/*
** DisplayDescriptors.c  - Displays Device and Configuration Descriptors
**
** Author:  John Hyde, USB Design By Example
*/

#include "main.h"
extern VOS_HANDLE hDevice[NUMBER_OF_DEVICES];


BOOL DisplayDescriptors(BYTE ThreadID, usbhost_device_handle* ifDev) {
    BYTE* ConfigurationDescriptorPtr;
    usb_deviceRequest_t DeviceRequest;
    usb_deviceDescriptor_t DeviceDescriptor;
    usb_deviceConfigurationDescriptor_t ConfigurationDescriptorHeader;
    usb_deviceInterfaceDescriptor_t* InterfaceDescriptorPtr;
    usbhost_ioctl_cb_t hc_iocb;
    usbhost_ep_handle* EP0;
    BYTE Status;
    BYTE* DescriptorPtr;

// Get a handle for EP0
    hc_iocb.ioctl_code = VOS_IOCTL_USBHOST_DEVICE_GET_CONTROL_ENDPOINT_HANDLE;
    hc_iocb.handle.dif = ifDev;
    hc_iocb.get = &EP0;
    Status = i_vos_dev_ioctl(ThreadID, hDevice[Host], &hc_iocb);
    if (Status != USBHOST_OK) return dprint("\nCould not attach to Control Endpoint, status = %d", &Status);

// Read the Device Descriptor
    hc_iocb.ioctl_code = VOS_IOCTL_USBHOST_DEVICE_SETUP_TRANSFER;
    hc_iocb.handle.ep = EP0;
    DeviceRequest.bmRequestType = USB_BMREQUESTTYPE_DEV_TO_HOST;
    DeviceRequest.bRequest = USB_REQUEST_CODE_GET_DESCRIPTOR;
    DeviceRequest.wValue = USB_DESCRIPTOR_TYPE_DEVICE<<8;
    DeviceRequest.wIndex = 0;
    DeviceRequest.wLength = sizeof(DeviceDescriptor);
    hc_iocb.set = &DeviceRequest;
    hc_iocb.get = &DeviceDescriptor;
    Status = i_vos_dev_ioctl(ThreadID, hDevice[Host], &hc_iocb);
    if (Status != USBHOST_OK) return dprint("\nCould not read Device Descriptor, status = %d", &Status);

// Display the Device Descriptor
    dprint("\nDevice Descriptor is:", 0);
    dprintBuffer((BYTE*)&DeviceDescriptor, sizeof(DeviceDescriptor));

// Read the Configuration Descriptor header
// Note that lines marked /// are not needed but I left them in as comments so that you can better see what is going on
/// hc_iocb.ioctl_code = VOS_IOCTL_USBHOST_DEVICE_SETUP_TRANSFER;
/// hc_iocb.handle.ep = EP0;
/// DeviceRequest.bmRequestType = USB_BMREQUESTTYPE_DEV_TO_HOST;
/// DeviceRequest.bRequest = USB_REQUEST_CODE_GET_DESCRIPTOR;
    DeviceRequest.wValue = USB_DESCRIPTOR_TYPE_CONFIGURATION<<8;
/// DeviceRequest.wIndex = 0;
    DeviceRequest.wLength = sizeof(ConfigurationDescriptorHeader);
/// hc_iocb.set = &DeviceRequest;
    hc_iocb.get = &ConfigurationDescriptorHeader;
    Status = i_vos_dev_ioctl(ThreadID, hDevice[Host], &hc_iocb);
    if (Status != USBHOST_OK) return dprint("\nCould not read Configuration Descriptor Header, status = %d", &Status);

// Get some memory for the Configuration Descriptor
    ConfigurationDescriptorPtr = vos_malloc(ConfigurationDescriptorHeader.wTotalLength);
    if (ConfigurationDescriptorPtr == 0) return dprint("\nmalloc failed, no free memory", 0);

// Read the whole Configuration Descriptor
/// hc_iocb.ioctl_code = VOS_IOCTL_USBHOST_DEVICE_SETUP_TRANSFER;
/// hc_iocb.handle.ep = EP0;
/// DeviceRequest.bmRequestType = USB_BMREQUESTTYPE_DEV_TO_HOST;
/// DeviceRequest.bRequest = USB_REQUEST_CODE_GET_DESCRIPTOR;
/// DeviceRequest.wValue = USB_DESCRIPTOR_TYPE_CONFIGURATION<<8;
/// DeviceRequest.wIndex = 0;
    DeviceRequest.wLength = ConfigurationDescriptorHeader.wTotalLength;
/// hc_iocb.set = &DeviceRequest;
    hc_iocb.get = ConfigurationDescriptorPtr;
    Status = i_vos_dev_ioctl(ThreadID, hDevice[Host], &hc_iocb);
    if (Status != USBHOST_OK) return dprint("\nCould not read Configuration Descriptor, status = %d", &Status);

// Display the Configuration Descriptor
    dprint("\nConfiguration Descriptor is:", 0);
    DescriptorPtr = ConfigurationDescriptorPtr;
    while (DescriptorPtr<(ConfigurationDescriptorPtr+ConfigurationDescriptorHeader.wTotalLength)) {
        dprintBuffer(DescriptorPtr, *DescriptorPtr);
        DecodeDescriptor(DescriptorPtr);
        DescriptorPtr += *DescriptorPtr;
        }

    InterfaceDescriptorPtr = ConfigurationDescriptorPtr+9;
    if (InterfaceDescriptorPtr->bInterfaceClass == 3) {
        dprint("\nThis is a HID ", 0);
        if (InterfaceDescriptorPtr->bInterfaceProtocol == 1) dprint("Keyboard", 0);
        if (InterfaceDescriptorPtr->bInterfaceProtocol == 2) dprint("Mouse", 0);
        }
    if (InterfaceDescriptorPtr->bInterfaceClass == 9) dprint("\nThis is a HUB ", 0);

    vos_free(ConfigurationDescriptorPtr);
    }


