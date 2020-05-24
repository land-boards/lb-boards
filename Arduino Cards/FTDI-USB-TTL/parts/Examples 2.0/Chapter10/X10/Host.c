/*
** Host.c  - support routines for USB Host
**
** Author:  John Hyde, USB Design By Example
*/

#include "main.h"

extern VOS_HANDLE hDevice[NUMBER_OF_DEVICES];

//BYTE ASCIIHouseCode[16] = {"MECKOGAINFDLPHBJ"};
//BYTE LookupDeviceCode[16] = {13,5,3,11,15,7,1,9,14,6,4,12,16,8,2,10};
BYTE ASCIIHouseCode[16] = {"MNOPCDABEFGHKLIJ"};
BYTE LookupDeviceCode[16] = {13,14,15,16,3,4,1,2,5,6,7,8,11,12,9,10};
char* ASCIIFunctionCode[7] = {
    "ALL_UNITS_OFF",
    "ALL_LIGHTS_ON",
    "UNIT_ON",
    "UNIT_OFF",
    "UNIT_DIM",
    "UNIT_BRIGHT",
    "ALL_LIGHTS_OFF"
    };

usbhost_ep_handle* IntIn;
usbhost_ep_handle* IntOut;
vos_semaphore_t IntTransferComplete;

usbhost_device_handle* WaitForVIDPID(BYTE ThreadID, WORD VID, WORD PID) {
    usbhost_ioctl_cb_t hc_iocb;
    usbhost_device_handle* ifDev;
    usbhost_ioctl_cb_vid_pid_t hc_iocb_VidPid;
    BYTE State, Status;
// Return when a device matching VID and PID has been found
    while (1) {
        dprint(" .", 0);
        i_vos_delay_msecs(ThreadID, 1000);
// Check that the host has finished enumeration
        hc_iocb.ioctl_code = VOS_IOCTL_USBHOST_GET_CONNECT_STATE;
        hc_iocb.get = &State;
        i_vos_dev_ioctl(ThreadID, hDevice[Host], &hc_iocb);
        if (State == PORT_STATE_ENUMERATED) {
// Check for a specific device
            hc_iocb_VidPid.vid = VID;
            hc_iocb_VidPid.pid = PID;
            hc_iocb.ioctl_code = VOS_IOCTL_USBHOST_DEVICE_FIND_HANDLE_BY_VID_PID;
            hc_iocb.handle.dif = NULL;
            hc_iocb.set = &hc_iocb_VidPid;
            hc_iocb.get = &ifDev;
            i_vos_dev_ioctl(ThreadID, hDevice[Host], &hc_iocb);
            if (ifDev) {
// Now get handles for the Data Endpoints
                hc_iocb.ioctl_code = VOS_IOCTL_USBHOST_DEVICE_GET_INT_IN_ENDPOINT_HANDLE;
                hc_iocb.handle.dif = ifDev;
                hc_iocb.get = &IntIn;
                Status = i_vos_dev_ioctl(ThreadID, hDevice[Host], &hc_iocb);
                if (Status != USBHOST_OK) return dprint("Could not get IntIn Endpoint (%d) ", &Status);
                hc_iocb.ioctl_code = VOS_IOCTL_USBHOST_DEVICE_GET_INT_OUT_ENDPOINT_HANDLE;
//                hc_iocb.handle.dif = ifDev;
                hc_iocb.get = &IntOut;
                Status = i_vos_dev_ioctl(ThreadID, hDevice[Host], &hc_iocb);
                if (Status != USBHOST_OK) return dprint("Could not get IntOut Endpoint (%d) ", &Status);
                vos_init_semaphore(&IntTransferComplete, 0);
                return ifDev;
                }
            }
// Keyboard is not attached, wait until current device(s) is/are removed and check again
        dprint("\nDevice not found, waiting for more devices", 0);
        vos_delay_msecs(5000);
        }
    return 0; // Keep compiler happy
    }

void SendIntOut(BYTE* BufferPtr, WORD BufferLength) {
    usbhost_xfer_t xfer;
    BYTE Status;
    vos_memset(&xfer, 0, sizeof(usbhost_xfer_t));
    xfer.s = &IntTransferComplete;
    xfer.ep = IntOut;
    xfer.buf = BufferPtr;
    xfer.len = BufferLength;
// Send packet to X10 controller
    Status = vos_dev_write(hDevice[Host], (BYTE*)&xfer, sizeof(usbhost_xfer_t), NULL);
    if (Status != USBHOST_OK) dprint("Send X10 packet Error (%d)\n", &Status);
    }

void GetIntIn(BYTE* BufferPtr, WORD BufferLength) {
    usbhost_xfer_t xfer;
    BYTE Status;
    vos_memset(&xfer, 0, sizeof(usbhost_xfer_t));
    xfer.s = &IntTransferComplete;
    xfer.ep = IntIn;
    xfer.buf = BufferPtr;
    xfer.len = BufferLength;
// Wait for a response packet from X10 controller
    Status = vos_dev_read(hDevice[Host], (BYTE*)&xfer, sizeof(usbhost_xfer_t), NULL);
    if (Status != USBHOST_OK) dprint("Get X10 packet Error (%d)\n", &Status);
    }

int WaitOnIntIn(BYTE* BufferPtr, WORD BufferLength) {
    usbhost_xfer_t xfer;
    BYTE Status;
    vos_memset(&xfer, 0, sizeof(usbhost_xfer_t));
    xfer.s = &IntTransferComplete;
    xfer.ep = IntIn;
    xfer.buf = BufferPtr;
    xfer.len = BufferLength;
    xfer.flags = USBHOST_XFER_FLAG_ROUNDING;
// Wait for a response packet from X10 controller
    Status = vos_dev_read(hDevice[Host], (BYTE*)&xfer, sizeof(usbhost_xfer_t), NULL);
    if (Status != USBHOST_OK) {
        dprint("Get X10 packet Error (%d)\n", &Status);
        return 0;
        }
    return xfer.len;
    }

void X10Command(BYTE HouseCode, BYTE DeviceCode, BYTE Function) {
    BYTE Buffer[2];
    BYTE Response;
    dprint("\nSending %s to ", ASCIIFunctionCode[Function]);
    dprint("Housecode=%c ", &ASCIIHouseCode[HouseCode]);
    dprint("Device=%d", &LookupDeviceCode[DeviceCode]);
// First send the X10 address, then the function
    Buffer[0] = 4;
    Buffer[1] = (HouseCode<<4) | DeviceCode;
    SendIntOut(&Buffer[0], sizeof(Buffer));
// Wait for an 'ACK' from the controller indicating that it is ready for the next command
    GetIntIn(&Response, 1);
    Buffer[0] = 6;
    Buffer[1] = (HouseCode<<4) | Function;
    SendIntOut(&Buffer[0], sizeof(Buffer));
    GetIntIn(&Response, 1);
    }


