/*
** Host.c  - support routines for USB Host
**
** Author:  John Hyde, USB Design By Example
*/

#include "main.h"

extern VOS_HANDLE hDevice[NUMBER_OF_DEVICES];

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

