/*
** DecodeDescriptor.c  - Do a first pass translation of the descriptor
**
** Author:  John Hyde, USB Design By Example
*/

#include "main.h"

void DecodeDescriptor(BYTE* DescriptorPtr) {
// Feel free to expand this (and send me the result so that I can redistribute it)
    BYTE i;
    BYTE Length = *DescriptorPtr++;
    switch (*DescriptorPtr) {
        case USB_DESCRIPTOR_TYPE_DEVICE:
            dprint(" = %s", "Device");
            break;
        case USB_DESCRIPTOR_TYPE_CONFIGURATION:
            dprint(" = %s", "Configuration");
            break;
        case USB_DESCRIPTOR_TYPE_STRING:
            dprint(" = %s", "String Descriptor = '");
            for (i = 2; i<Length; i+=2, DescriptorPtr+=2) dprint("%c", *DescriptorPtr);
            dprint("'", 0);
            break;
        case USB_DESCRIPTOR_TYPE_INTERFACE:
            dprint(" = %s", "Interface, Class = ");
            DescriptorPtr +=4;
            switch (*DescriptorPtr) {
                case 0: dprint("Not Defined", 0); break;
                case USB_CLASS_AUDIO: dprint("Audio", 0); break;
                case USB_CLASS_CDC_CONTROL: dprint("CDC Control", 0); break;
                case USB_CLASS_HID: dprint("HID", 0); break;
                case USB_CLASS_PHYSICAL: dprint("Physical", 0); break;
                case USB_CLASS_IMAGE: dprint("Still Image", 0); break;
                case USB_CLASS_PRINTER: dprint("Printer", 0); break;
                case USB_CLASS_MASS_STORAGE: dprint("Mass Storage (BOMS)", 0); break;
                case USB_CLASS_HUB: dprint("Hub", 0); break;
                case USB_CLASS_CDC_DATA: dprint("CDC Data", 0); break;
                case USB_CLASS_SMART_CARD: dprint("Smart Card", 0); break;
                case USB_CLASS_CONTENT_SECURITY: dprint("Content Security", 0); break;
                case USB_CLASS_VIDEO: dprint("Video", 0); break;
                case USB_CLASS_PERSONAL_HEALTHCARE: dprint("Personal Healthcare", 0); break;
                case USB_CLASS_DIAGNOSTIC_DEVICE: dprint("Diagnostic Device", 0); break;
                case USB_CLASS_WIRELESS_CONTROLLER: dprint("Wireless Controller", 0); break;
                case USB_CLASS_MISCELLANEOUS: dprint("Miscellaneous", 0); break;
                case USB_CLASS_APPLICATION: dprint("Application", 0); break;
                case USB_CLASS_VENDOR: dprint("Vendor Defined", 0); break;
                default: dprint("Invalid", 0);
                }
            break;
        case USB_DESCRIPTOR_TYPE_ENDPOINT: dprint(" = %s", "Endpoint"); break;
        case USB_DESCRIPTOR_TYPE_DEVICE_QUALIFIER: dprint(" = %s", "Device Qualifier"); break;
        case USB_DESCRIPTOR_TYPE_OTHER_SPEED_CONFIGURATION: dprint(" = %s", "Other Speed Configuration"); break;
        case USB_DESCRIPTOR_TYPE_INTERFACE_POWER: dprint(" = %s", "Interface Power"); break;
        case 0x21:
        case 0x22:
        case 0x23:
        case 0x24:
        case 0x25: dprint(" = %s", "Class Specific"); break;
        default: dprint(" = %s", "Unknown");
        }
    }


