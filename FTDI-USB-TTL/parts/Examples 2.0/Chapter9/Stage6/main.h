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
#include "USBHID.h"
#include "USBSlave.h"
#include "string.h"
#include "SPIMaster.h"
#include "Timers.h"

// Declare Global Variables
#define SIZEOF_tcb      0x400
#define LED3            2        // This is mapped to PortE.Bit1
#define MaxReportLength 8

typedef struct _MessageType {
    BYTE*                ReportBuffer;
    WORD                 ReportLength;
    vos_semaphore_t*     SignalSemaphore;
    vos_semaphore_t*     ResponseSemaphore;
    usbslave_ep_handle_t DataEP;
    char*                NamePtr;
    } MessageType;

typedef struct _EntryType {
    BYTE    AtmelCommand;
    BYTE    UpperAddress;
    WORD    BufferAddress;
    BYTE    Tag;
    WORD    ElapsedTime;
    WORD    Index;
    BYTE    KeyboardReport[8];
    BYTE    MouseReport[3];
    } EntryType;

typedef struct _AtmelType {
    BYTE Command;
    WORD Address;
    BYTE DontCare;
    } AtmelType;

// Declare the device drivers that are used
enum Devices {
    LEDs,
    UART,
    LA_In,
    LA_Out,
    Host,
    Slave,
    SPIM,
    Timer0
    };
#define NUMBER_OF_DEVICES    8

// Rather than check status from every vos call in line, I group them then work backwards
// to isolate an error. This uses less code and is efficient if errors are not expected
enum ErrorCodes {
    NoError,
    ErrorSchedulerDidNotStart,
    ErrorInitDevices,
    ErrorStartupDevices,
    ErrorUnknownRequest,
    ErrorUnknownDescriptorType,
    ErrorCouldNotSendReport,
    ErrorNoDataFlash,
    ErrorTimer0
    };

enum Tags {
    ValidKeyboardReport = 1
    };

enum AtmelCommands {
    AtmelProgramWithBuffer1 = 0x83,
    AtmelWriteBuffer1 = 0x84,
    AtmelProgramWithBuffer2 = 0x86,
    AtmelWriteBuffer2 = 0x87,
    AtmelGetDeviceID = 0x9F,
    AtmelGetStatus = 0xD7
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
void HandleRequest(BYTE ThreadID, usb_deviceRequest_t* Setup);
void SendAndReceiveSPIBytes(BYTE ThreadID, BYTE* BufferPtr, WORD Length, BOOL Receive);
BOOL CheckDataFlash(BYTE ThreadID);
WORD ResetTimer0(void);
WORD Swap(WORD Data);

uint8 i_vos_delay_msecs(BYTE ThreadID, uint16 ms);
uint8 i_vos_dev_read(BYTE ThreadID, VOS_HANDLE h, BYTE* buffer, WORD len, WORD* read);
uint8 i_vos_dev_write(BYTE ThreadID, VOS_HANDLE h, BYTE* buffer, WORD len, WORD* written);
uint8 i_vos_dev_ioctl(BYTE ThreadID, VOS_HANDLE h,void* cb);
void i_vos_lock_mutex(BYTE ThreadID, vos_mutex_t* m);
void i_vos_wait_semaphore(BYTE ThreadID, vos_semaphore_t* s);
void i_vos_signal_semaphore(BYTE ThreadID, vos_semaphore_t* s);


