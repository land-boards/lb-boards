/*
** Main.h module for Chapter7 Example (Stage6)
** Created: 7/9/2010
** Author:  John Hyde
*/

// I think in terms of bytes and words, so define these!
typedef unsigned char BOOL;
typedef unsigned char BYTE;
typedef unsigned short WORD;

// Declare external headers needed
#include "vos.h"
#include "gpio.h"
#include "UART.h"

// Declare Global Variables
#define SIZEOF_tcb  0x400
#define LED3        2        // This is mapped to PortE.Bit1

// Declare the device drivers that are used
enum Devices {
    LEDs,
    UART,
    LA_In,
    LA_Out,
    Buttons
    };
#define NUMBER_OF_DEVICES    5

// Rather than check status from every vos call in line, I group them then work backwards
// to isolate an error. This uses less code and is efficient if errors are not expected
enum ErrorCodes {
    NoError,
    ErrorSchedulerDidNotStart,
    ErrorInitDevices,
    ErrorStartupDevices,
    ErrorUARTBufferOverflow
    };

// Declare external procedures
BOOL InitDevices(void);
void StartupDevices(void);
void CheckStatus(BYTE Status, BYTE ErrorCode);
BOOL dprint(BYTE ThreadID, BYTE* StringPtr, void* DataPtr);
void dprintBuffer(BYTE ThreadID, BYTE* BufferPtr, int Count);
void CallVOS(BYTE ThreadID);
void ThreadRunning(BYTE ThreadID);

