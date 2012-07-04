/*
** Main.h module for Chapter9 Example
**
** Author:  John Hyde, USB Design By Example
*/

// I think in terms of bytes and words, so define these!
typedef unsigned char BOOL;
typedef unsigned char BYTE;
typedef unsigned short WORD;

// Declare external headers needed
#include "vos.h"
#include "gpio.h"
#include "UART.h"
#include "USB.h"
#include "USBHost.h"

// Declare Global Variables
#define SIZEOF_tcb      0x400
#define LED3            2        // This is mapped to PortE.Bit1
#define MaxReportLength 8

typedef struct _MessageType {
    BYTE*              ReportBuffer;
    WORD               ReportLength;
    vos_semaphore_t*   SignalSemaphore;
    vos_semaphore_t*   ResponseSemaphore;
    usbhost_ep_handle* DataEP;
    char*              NamePtr;
    } MessageType;

// Declare the device drivers that are used
enum Devices {
    LEDs,
    UART,
    LA_In,
    LA_Out,
    Host
    };
#define NUMBER_OF_DEVICES    5

// Rather than check status from every vos call in line, I group them then work backwards
// to isolate an error. This uses less code and is efficient if errors are not expected
enum ErrorCodes {
    NoError,
    ErrorSchedulerDidNotStart,
    ErrorInitDevices,
    ErrorStartupDevices
    };

// Declare external procedures
BOOL InitDevices(void);
void StartupDevices(void);
void CheckStatus(BYTE Status, BYTE ErrorCode);
BOOL dprint(BYTE* StringPtr, void* DataPtr);
void dprintBuffer(BYTE* BufferPtr, int Count);
usbhost_device_handle* WaitForKeyboard(BYTE ThreadID);
BOOL DisplayDescriptors(BYTE ThreadID, usbhost_device_handle* ifDev);
void DecodeDescriptor(BYTE* DescriptorPtr);
BOOL GetReports(BYTE ThreadID, usbhost_device_handle* ifDev, MessageType* Message);
void HidUsageToASCII(BYTE Modifier, BYTE Code);

uint8 i_vos_delay_msecs(BYTE ThreadID, uint16 ms);
uint8 i_vos_dev_read(BYTE ThreadID, VOS_HANDLE h, BYTE* buffer, WORD len, WORD* read);
uint8 i_vos_dev_write(BYTE ThreadID, VOS_HANDLE h, BYTE* buffer, WORD len, WORD* written);
uint8 i_vos_dev_ioctl(BYTE ThreadID, VOS_HANDLE h,void* cb);
void i_vos_lock_mutex(BYTE ThreadID, vos_mutex_t* m);
void i_vos_wait_semaphore(BYTE ThreadID, vos_semaphore_t* s);
void i_vos_signal_semaphore(BYTE ThreadID, vos_semaphore_t* s);

