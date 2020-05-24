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

enum X10_HouseCodes {
    HOUSECODE_M,
    HOUSECODE_N,
    HOUSECODE_O,
    HOUSECODE_P,
    HOUSECODE_C,
    HOUSECODE_D,
    HOUSECODE_A,
    HOUSECODE_B,
    HOUSECODE_E,
    HOUSECODE_F,
    HOUSECODE_G,
    HOUSECODE_H,
    HOUSECODE_K,
    HOUSECODE_L,
    HOUSECODE_I,
    HOUSECODE_J
    };

enum X10_DeviceCodes {
    DEVICE_13,
    DEVICE_14,
    DEVICE_15,
    DEVICE_16,
    DEVICE_3,
    DEVICE_4,
    DEVICE_1,
    DEVICE_2,
    DEVICE_5,
    DEVICE_6,
    DEVICE_7,
    DEVICE_8,
    DEVICE_11,
    DEVICE_12,
    DEVICE_9,
    DEVICE_10
    };

enum X10_FunctionCodes {
    ALL_UNITS_OFF,
    ALL_LIGHTS_ON,
    UNIT_ON,
    UNIT_OFF,
    UNIT_DIM,
    UNIT_BRIGHT,
    ALL_LOGHTS_OFF
    };

// Declare external procedures
BOOL InitDevices(void);
void StartupDevices(void);
void CheckStatus(BYTE Status, BYTE ErrorCode);
BOOL dprint(BYTE* StringPtr, void* DataPtr);
void dprintBuffer(BYTE* BufferPtr, int Count);
usbhost_device_handle* WaitForVIDPID(BYTE ThreadID, WORD VID, WORD PID);
BOOL DisplayDescriptors(BYTE ThreadID, usbhost_device_handle* ifDev);
void X10Command(BYTE HouseCode, BYTE DeviceCode, BYTE Function);
int WaitOnIntIn(BYTE* BufferPtr, WORD BufferLength);

uint8 i_vos_delay_msecs(BYTE ThreadID, uint16 ms);
uint8 i_vos_dev_read(BYTE ThreadID, VOS_HANDLE h, BYTE* buffer, WORD len, WORD* read);
uint8 i_vos_dev_write(BYTE ThreadID, VOS_HANDLE h, BYTE* buffer, WORD len, WORD* written);
uint8 i_vos_dev_ioctl(BYTE ThreadID, VOS_HANDLE h,void* cb);
void i_vos_lock_mutex(BYTE ThreadID, vos_mutex_t* m);

