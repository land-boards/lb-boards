/*
** Slave.c module for Chapter9 Example
**
** Author:  John Hyde, USB Design By Example
*/

#include "main.h"

extern VOS_HANDLE hDevice[NUMBER_OF_DEVICES];
extern vos_semaphore_t EnumerationComplete;

// My slave has EP0 plus EP1_In
usbslave_ep_handle_t EP0_In, EP0_Out, EP1_In;
BYTE Configuration;
BYTE KeyboardLEDs;

// Declare my descriptors - as BYTE arrays at the moment due to a compiler limitation
//rom
BYTE KeyboardReportDescriptor[] = {
    5, 1,        //  Usage_Page (Generic Desktop)
    9, 6,        //  Usage (Keyboard)
    0xA1, 1,     //  Collection (Application)
// First declare the key usage input report
    5, 7,        //    Usage page (KeyBoard)
    0x19, 0xE0,  //    Usage_Minimum (Keyboard - Left Control)
    0x29, 0xE7,  //    Usage_Maximum (Keyboard - Right GUI)
    0x15, 0,     //    Logical_Minimum (0)
    0x25, 1,     //    Logical_Maximum (1)
    0x75, 1,     //    Report_Size (1)
    0x95, 8,     //    Report_Count (8)
    0x81, 2,     //    Input (Data,Var,Abs) = Modifier Byte
    0x81, 1,     //    Input (Constant) = Reserved Byte
    0x19, 0,     //    Usage_Minimum (Keyboard - 0)
    0x29, 82,    //    Usage_Maximum (Keyboard - UpArrow)
    0x15, 0,     //    Logical_Minimum (0)
    0x25, 82,    //    Logical_Maximum (82)
    0x75, 8,     //    Report_Size (8)
    0x95, 6,     //    Report_Count (KeycodesMax)
    0x81, 0,     //    Input (Data,Array) = Key Usage Bytes
// Now the LED output report
    5, 8,        //    Usage Page (LEDs)
    0x19, 1,     //    Usage_Minimum (LED - Num Lock)
    0x29, 5,     //    Usage_Maximum (LED - Kana)
    0x15, 0,     //    Logical_Minimum (0)
    0x25, 1,     //    Logical_Maximum (1)
    0x75, 1,     //    Report_Size (1)
    0x95, 5,     //    Report_Count (5)
    0x91, 2,     //    Output (Data,Var,Abs) = LEDs (5 bits)
    0x95, 3,     //    Report_Count (3)
    0x91, 1,     //    Output (Constant) = Pad (3 bits)
    0xC0         //  End_Collection
    };
//rom
BYTE MyDeviceDescriptor[18] = {
    18, 1, 0x10, 1, 0, 0, 0, 8, 0x42, 0x42, 0x20, 3, 3, 0, 0, 0, 0, 1 };
//rom
BYTE MyConfigurationDescriptor[34] = {
// Configuration Header
    9, 2, 34, 0, 1, 1, 0, 0x80, 50,
// Interface
    9, 4, 0, 0, 1, 3, 1, 1, 0,
// HID Class
    9, 0x21, 0x10, 1, 0, 1, 0x22, sizeof(KeyboardReportDescriptor), 0,
// Endpoint, EP1_In
    7, 5, 0x81, 3, 8, 0, 10
    };

void SendResponse(BYTE ThreadID, void* BufferPtr, WORD RequestedLength, WORD ActualLength) {
    usbslave_ioctl_cb_t iocb;
    iocb.ioctl_code = VOS_IOCTL_USBSLAVE_SETUP_TRANSFER;
    iocb.handle = EP0_In;
    iocb.request.setup_or_bulk_transfer.buffer = BufferPtr;
    iocb.request.setup_or_bulk_transfer.size = RequestedLength>ActualLength ? ActualLength : RequestedLength;
    dprint("\nIn SendResponse with %X buffer", &BufferPtr);
    dprintBuffer(BufferPtr, iocb.request.setup_or_bulk_transfer.size);
    i_vos_dev_ioctl(ThreadID, hDevice[Slave], &iocb);
    }

void SendACK(BYTE ThreadID) {
    usbslave_ioctl_cb_t iocb;
    iocb.ioctl_code = VOS_IOCTL_USBSLAVE_SETUP_TRANSFER;
    iocb.handle = EP0_In;
    iocb.request.setup_or_bulk_transfer.buffer = (void*) 0;
    iocb.request.setup_or_bulk_transfer.size = 0;
    i_vos_dev_ioctl(ThreadID, hDevice[Slave], &iocb);
    dprint("\nACK Sent", 0);
    }

void HandleChapter9Request(BYTE ThreadID, usb_deviceRequest_t* Setup) {
    BYTE Temp;
    usbslave_ioctl_cb_t iocb;
    dprint("\nIn HandleChapter9Request with %x", &Setup->bRequest);
    switch (Setup->bRequest) {
        case USB_REQUEST_CODE_SET_ADDRESS:
            dprint("\nAt SetAddress with %X", &Setup->wValue);
            iocb.ioctl_code = VOS_IOCTL_USBSLAVE_SET_ADDRESS;
            Temp = Setup->wValue & 0xFF;
            iocb.set = (void*) Temp;
            i_vos_dev_ioctl(ThreadID, hDevice[Slave], &iocb);
            SendACK(ThreadID);
            break;
        case USB_REQUEST_CODE_GET_DESCRIPTOR:
            Temp = Setup->wValue >> 8;
            dprint("\nIn Get Descriptor with %x", &Temp);
            switch (Temp) {
                case USB_DESCRIPTOR_TYPE_DEVICE:
                    dprint("\nGet Device Descriptor (%X)", &Setup->wLength);
                    SendResponse(ThreadID, &MyDeviceDescriptor[0], Setup->wLength ,sizeof(MyDeviceDescriptor));
                    break;
                case USB_DESCRIPTOR_TYPE_CONFIGURATION:
                    dprint("\nGet Configuration Descriptor (%X)", &Setup->wLength);
                    SendResponse(ThreadID, &MyConfigurationDescriptor[0], Setup->wLength ,sizeof(MyConfigurationDescriptor));
                    break;
                case 0x22:    // This is request for the HID Report Descriptor
                    SendResponse(ThreadID, &KeyboardReportDescriptor[0], Setup->wLength ,sizeof(KeyboardReportDescriptor));
                    break;
// Need to complete these - catch as an error for now
                case USB_DESCRIPTOR_TYPE_ENDPOINT:
                case USB_DESCRIPTOR_TYPE_DEVICE_QUALIFIER:
                case USB_DESCRIPTOR_TYPE_OTHER_SPEED_CONFIGURATION:
                    CheckStatus(Setup->wValue & 0xF, ErrorUnknownDescriptorType);
                    break;
                }
            break;
        case USB_REQUEST_CODE_SET_CONFIGURATION:
            dprint("\nSet Configuration = %x", &Setup->wValue);
            SendACK(ThreadID);
            vos_signal_semaphore(&EnumerationComplete);
            break;
// Need to complete these - catch as an error for now
        case USB_REQUEST_CODE_GET_STATUS:
        case USB_REQUEST_CODE_CLEAR_FEATURE:
        case USB_REQUEST_CODE_SET_FEATURE:
        case USB_REQUEST_CODE_SET_DESCRIPTOR:
        case USB_REQUEST_CODE_GET_CONFIGURATION:
        case USB_REQUEST_CODE_GET_INTERFACE:
        case USB_REQUEST_CODE_SET_INTERFACE:
        case USB_REQUEST_CODE_SYNCH_FRAME:
            CheckStatus(Setup->bRequest, ErrorUnknownRequest);
            break;
        }
    }

void HandleHIDClassRequest(BYTE ThreadID, usb_deviceRequest_t* Setup) {
    usbslave_ioctl_cb_t iocb;
    dprint("\nIn HandleHIDClassRequest with %x", &Setup->bRequest);
    switch (Setup->bRequest) {
        case USB_HID_REQUEST_CODE_SET_IDLE:
            SendACK(ThreadID);
            break;
        case USB_HID_REQUEST_CODE_SET_REPORT:
// The host is wanting the set the Keyboard LEDs
            dprint("\nIn SetReport with length = %X", &Setup->wLength);
            iocb.ioctl_code = VOS_IOCTL_USBSLAVE_SETUP_TRANSFER;
            iocb.handle = EP0_Out;
            iocb.request.setup_or_bulk_transfer.buffer = &KeyboardLEDs;
            iocb.request.setup_or_bulk_transfer.size = Setup->wLength;
            iocb.request.setup_or_bulk_transfer.bytes_transferred = 0;
            i_vos_dev_ioctl(ThreadID, hDevice[Slave], &iocb);
            SendACK(ThreadID);
            dprint("\nKeyboard LEDs set to %x", &KeyboardLEDs);
            break;
// Need to complete these - catch as an error for now
        case USB_HID_REQUEST_CODE_GET_REPORT:
        case USB_HID_REQUEST_CODE_GET_IDLE:
        case USB_HID_REQUEST_CODE_GET_PROTOCOL:
        case USB_HID_REQUEST_CODE_SET_PROTOCOL:
            CheckStatus(Setup->bRequest, ErrorUnknownRequest);
            break;
        }
    }

void HandleRequest(BYTE ThreadID, usb_deviceRequest_t* Setup) {
// Check if this is a standard or class request
     switch (Setup->bmRequestType & 0x60) {
        case USB_BMREQUESTTYPE_STANDARD: {
            HandleChapter9Request(ThreadID, Setup);
            break;
            }
        case USB_BMREQUESTTYPE_CLASS: {
            HandleHIDClassRequest(ThreadID, Setup);
            break;
            }
        default: {
            CheckStatus(Setup->bmRequestType, ErrorUnknownRequest);
            }
        }
    }

