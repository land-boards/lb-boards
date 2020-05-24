/*
** Host.c  - support routines for USB Host
**
** Author:  John Hyde, USB Design By Example
*/

#include "main.h"

extern VOS_HANDLE hDevice[NUMBER_OF_DEVICES];

usb_deviceRequest_t SetBootProtocol = { 0x21, 0x0B, 0, 0, 0 };
usb_deviceRequest_t SetIdle = { 0x21, 0x0A, 0, 0, 0 };
//                                    1234567890123456789012345678901234567890 123 456789 01234567
rom char HidUsageToASCIITable1[57] = "????abcdefghijklmnopqrstuvwxyz1234567890\r??\t -=[]\\?;'',./";
rom char HidUsageToASCIITable2[57] = "????ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*()\r??\t _+{}|?:\"~<>?";

void HidUsageToASCII(BYTE Modifier, BYTE Code) {
// A simple table lookup
    char TempChar;
    if (Modifier & 0x11) dprint("Control+", 0);
    if (Code<sizeof(HidUsageToASCIITable1)) {
        TempChar =  (Modifier & 0x22) ? HidUsageToASCIITable2[Code] : HidUsageToASCIITable1[Code];
        dprint("%c", &TempChar);
        }
    else dprint("special", 0);
    }


usbhost_device_handle* WaitForKeyboard(BYTE ThreadID) {
    usbhost_ioctl_cb_t hc_iocb;
    usbhost_device_handle* ifDev;
    usbhost_ioctl_cb_class_t hc_iocb_class;
    BYTE Interface, InterfaceCount;
    BYTE State, Status;
// Return when a Keyboard has been found
    while (1) {
        dprint(" .", 0);
        i_vos_delay_msecs(ThreadID, 1000);
// Check that the host has finished enumeration
        hc_iocb.ioctl_code = VOS_IOCTL_USBHOST_GET_CONNECT_STATE;
        hc_iocb.get = &State;
        i_vos_dev_ioctl(ThreadID, hDevice[Host], &hc_iocb);
        if (State == PORT_STATE_ENUMERATED) {
// Discover attached device(s)
            hc_iocb.ioctl_code = VOS_IOCTL_USBHOST_DEVICE_GET_COUNT;
            hc_iocb.get = &InterfaceCount;
            i_vos_dev_ioctl(ThreadID, hDevice[Host], &hc_iocb);
            dprint("\n%d Device Interface(s) Found:", &InterfaceCount);
            for (Interface=0; Interface<InterfaceCount; Interface++) {
// Get a handle to this device interface
                dprint("\n\nChecking Device Interface %d", &Interface);
                hc_iocb.ioctl_code = VOS_IOCTL_USBHOST_DEVICE_GET_NEXT_HANDLE;
                hc_iocb.handle.dif = Interface ? ifDev : NULL;
                hc_iocb.get = &ifDev;
                Status = i_vos_dev_ioctl(ThreadID, hDevice[Host], &hc_iocb);
                if (Status != USBHOST_OK) {
                    dprint("\nCould not attach to device interface, status = %d", &Status);
                    break;
                    }
// For education purposes, print out the descriptors for this interface
                DisplayDescriptors(ThreadID, ifDev);
// Search through the enumerated device(s) for a Keyboard device
                hc_iocb.ioctl_code = VOS_IOCTL_USBHOST_DEVICE_GET_CLASS_INFO;
                hc_iocb.handle.dif = ifDev;
                hc_iocb.get = &hc_iocb_class;
                Status = i_vos_dev_ioctl(ThreadID, hDevice[Host], &hc_iocb);
                if (Status != USBHOST_OK) {
                    dprint("\nCould not get class info, status = %d", &Status);
                    continue;
                    }
                dprint("\nClass Info: ", 0);
                dprintBuffer((BYTE*)&hc_iocb_class, sizeof(hc_iocb_class));
                if ((hc_iocb_class.dev_class == USB_CLASS_HID) &&
                    (hc_iocb_class.dev_protocol == USB_PROTOCOL_HID_KEYBOARD)) return ifDev;
                }
// Keyboard is not attached, wait until current device(s) is/are removed and check again
            dprint("\nKeyboard not found, waiting for more devices%", 0);
            vos_delay_msecs(5000);
            }
        }
    return 0; // Keep compiler happy
    }

BOOL GetReports(BYTE ThreadID, usbhost_device_handle* ifDev, MessageType* Message) {
// This function initializes the identified HID, receives Reports from it and forwards them
// This function owns the ReportBuffer which is long enough to receive keyboard reports
    BYTE ReportBuffer[MaxReportLength];
    usbhost_ep_handle* epData, epCtrl;
    usbhost_ioctl_cb_t hc_iocb;
    usbhost_xfer_t xfer;
    BYTE Status;
    vos_semaphore_t ReportReceived, Returned;
// Have the device handle, also need handles to EP0 and Data Endpoint
    hc_iocb.ioctl_code = VOS_IOCTL_USBHOST_DEVICE_GET_CONTROL_ENDPOINT_HANDLE;
    hc_iocb.handle.dif = ifDev;
    hc_iocb.get = &epCtrl;
    Status = i_vos_dev_ioctl(ThreadID, hDevice[Host], &hc_iocb);
    if (Status != USBHOST_OK) return dprint("Could not get EP0 (%d) ", &Status);
// Setup HID for Boot Protocol and to only send Reports on a data change
    hc_iocb.ioctl_code = VOS_IOCTL_USBHOST_DEVICE_SETUP_TRANSFER;
    hc_iocb.handle.ep = epCtrl;
    hc_iocb.set = &SetBootProtocol;
    i_vos_dev_ioctl(ThreadID, hDevice[Host], &hc_iocb);
/// hc_iocb.ioctl_code = VOS_IOCTL_USBHOST_DEVICE_SETUP_TRANSFER;
/// hc_iocb.handle.ep = epCtrl;
    hc_iocb.set = &SetIdle;
    i_vos_dev_ioctl(ThreadID, hDevice[Host], &hc_iocb);
// Now get a handle for the Data Endpoint
    hc_iocb.ioctl_code = VOS_IOCTL_USBHOST_DEVICE_GET_INT_IN_ENDPOINT_HANDLE;
    hc_iocb.handle.dif = ifDev;
    hc_iocb.get = &epData;
    Status = i_vos_dev_ioctl(ThreadID, hDevice[Host], &hc_iocb);
    if (Status != USBHOST_OK) return dprint("Could not get Data Endpoint (%d) ", &Status);
// Now wait for data reports
    dprint("\nWaiting for reports from %s", Message->NamePtr);
// VOS uses a semaphore to signal when a report has been received
    vos_init_semaphore(&ReportReceived, 0);
// I also use one to know when I can use the ReportBuffer again
    vos_init_semaphore(&Returned, 0);
// Initialize transfer data, I do the same transfer over and over again
    Message->ReportBuffer = &ReportBuffer[0];
    Message->ResponseSemaphore = &Returned;
    xfer.s = &ReportReceived;
    xfer.ep = epData;
    xfer.buf = Message->ReportBuffer;
    xfer.len = Message->ReportLength;
    xfer.flags = 0;
    while (1) {
// Wait for a report to arrive from keyboard
        Status = i_vos_dev_read(ThreadID, hDevice[Host], (BYTE*)&xfer, sizeof(usbhost_xfer_t), NULL);
        if (Status != USBHOST_OK) return dprint("Read Report Error (%d) ", &Status);
// Send the Report off to be processed
        i_vos_signal_semaphore(ThreadID, Message->SignalSemaphore);
// Need ownership of Message to continue
        i_vos_wait_semaphore(ThreadID, &Returned);
        }
    }


