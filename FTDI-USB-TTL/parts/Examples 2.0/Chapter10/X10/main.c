/*
** Main.c module for Chapter10 Example (X10)
**
** Author:  John Hyde, USB Design By Example
*/

// Include global definitions, constants, etc
#include "main.h"

// Declare global variables
VOS_HANDLE hDevice[NUMBER_OF_DEVICES];
vos_semaphore_t DevicesStarted;
vos_mutex_t dprintLock;
WORD Delay;
BYTE PriorCode[8];

void CheckStatus(BYTE Status, BYTE ErrorCode) {
    BYTE Reason;
    if (Status == 0) return;
// Set a breakpoint at the next line so that this error can be resolved
    Reason = ErrorCode;
    }

void WaitForDevicesStarted(void) {
    vos_wait_semaphore(&DevicesStarted);
    vos_signal_semaphore(&DevicesStarted);
    }

// Declare program thread(s)
// Blink thread, toggles LED3 on GPIO1
void Blink(BYTE ThreadID) {
    BYTE PortData = LED3;
    WaitForDevicesStarted();
    dprint("Blink (ID=%d) has started\n", &ThreadID);
    while (1) {
        i_vos_delay_msecs(ThreadID, Delay);
        PortData ^= LED3;
// Now write pattern to the GPIO port.
        i_vos_dev_write(ThreadID, hDevice[LEDs] ,&PortData, 1, NULL);
        }
    }

BOOL DuplicateCode(BYTE* BufferPtr, BYTE Length) {
    BYTE i;
    BYTE Duplicate = TRUE;
    for (i=0; i<Length; i++, BufferPtr++) {
        if (PriorCode[i] != *BufferPtr) {
            Duplicate = FALSE;
            PriorCode[i] = *BufferPtr;
            }
        }
    return Duplicate;
    }

void FindX10Controller(BYTE ThreadID) {
// This thread looks for a CM15 X10 Controller attached to Host[2]
    usbhost_device_handle* ifDev;
    BYTE Buffer[8];
    BYTE Count;
    WaitForDevicesStarted();
    dprint("FindX10Controller (%d) started\n", &ThreadID);
    while (1) {
        ifDev = WaitForVIDPID(ThreadID, 0xbc7, 0x0001);
        dprint("\nX10Controller found (%X)", &ifDev);
        while (1) {
            Count = WaitOnIntIn(&Buffer[0], sizeof(Buffer));
            if (!DuplicateCode(&Buffer[0], Count)) {
                dprint("\nReceived: ", 0);
                dprintBuffer(&Buffer[0], Count);
 //               i_vos_delay_msecs(ThreadID, 8);
                }
//            X10Command(HOUSECODE_A, DEVICE_2, UNIT_OFF);
//            i_vos_delay_msecs(ThreadID, 5000);
//            X10Command(HOUSECODE_A, DEVICE_2, UNIT_ON);
//            i_vos_delay_msecs(ThreadID, 5000);
            }
        }
    }

void MyIdleTask(void) {
// This thread is always ready to run and effectively replaces VOS's IdleTask
// I toggle bit 7 of the Logic Analyser Port to show activity
    StartupDevices();
    while (1) {
        asm { ORPORT 393 $0x80; };
        asm {ANDPORT 393 $0x7F; };
        }
    }


// Declare Main application
void main(void) {
// Initialize variables
    vos_init_semaphore(&DevicesStarted, 0);
    vos_init_mutex(&dprintLock, VOS_MUTEX_UNLOCKED);
    Delay = 511;

// Initialise RTOS
    vos_init(VOS_QUANTUM, VOS_TICK_INTERVAL, NUMBER_OF_DEVICES);

// Sets the CPU frequency of the connected device.
    vos_set_clock_frequency(VOS_48MHZ_CLOCK_FREQUENCY);

// Initialise devices
    if (InitDevices()) {

// Initialise threads - pass a ThreadID to each thread
        vos_create_thread(28, SIZEOF_tcb, &Blink, 1, 1);
        vos_create_thread(27, SIZEOF_tcb, &FindX10Controller, 1, 2);
        vos_create_thread( 1, SIZEOF_tcb, &MyIdleTask, 0);

// Start Scheduler to kick off the created thread(s)
        vos_start_scheduler();
        }

// It is an error to get here, use a breakpoint to catch this
    while (1) {
        CheckStatus(1, ErrorSchedulerDidNotStart);
        }
    }



