/*
** Main.c module for Chapter8 Example (Stage5)
**
** Author:  John Hyde, USB Design By Example
*/

#define Test_TAM 0

// Include global definitions, constants, etc
#include "main.h"

// Declare global variables
VOS_HANDLE hDevice[NUMBER_OF_DEVICES];
vos_semaphore_t DevicesStarted;
vos_mutex_t dprintLock;

void CheckStatus(BYTE Status, BYTE ErrorCode) {
    BYTE Reason;
    if (Status == 0) return;
// Set a breakpoint at the next line so that this error can be resolved
    Reason = ErrorCode;
    }


// Declare program thread(s)
// Blink thread, toggles LED3 on GPIO1
void Blink(BYTE ThreadID) {
    BYTE PortData = LED3;
    vos_wait_semaphore(&DevicesStarted);
    vos_signal_semaphore(&DevicesStarted);
    ThreadRunning(ThreadID);
    dprint(ThreadID, "Thread %d (Blink) has started\n", &ThreadID);
    while (1) {
        CallVOS(ThreadID);
        vos_delay_msecs(512);
        ThreadRunning(ThreadID);
        PortData ^= LED3;
// Now write pattern to the GPIO port.
        CallVOS(ThreadID);
        vos_dev_write(hDevice[LEDs] ,&PortData, 1, NULL);
        ThreadRunning(ThreadID);
        dprint(ThreadID, "LED is %s ", (PortData & LED3) ? "Off" : "On");
        }
    }

void HelloWorld(BYTE ThreadID) {
    BYTE Counter = 0;
    vos_wait_semaphore(&DevicesStarted);
    vos_signal_semaphore(&DevicesStarted);
    ThreadRunning(ThreadID);
    dprint(ThreadID, "Thread %d (Hello World) has started\n", &ThreadID);
    while (1) {
        CallVOS(ThreadID);
        vos_delay_msecs(1000);
        ThreadRunning(ThreadID);
        dprint(ThreadID, "Hello World %d ", &Counter++);
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

void TAM_Test(BYTE ThreadID) {
// Test VOS response times just toggling the LA signals
// Other tasks are not running for this test
    StartupDevices();
    while (1) {
        CallVOS(ThreadID);
        ThreadRunning(ThreadID);
        }
    }

// Declare Main application
void main(void) {
// Initialize variables
    vos_init_semaphore(&DevicesStarted, 0);
    vos_init_mutex(&dprintLock, VOS_MUTEX_UNLOCKED);

// Initialise RTOS
    vos_init(VOS_QUANTUM, VOS_TICK_INTERVAL, NUMBER_OF_DEVICES);

// Sets the CPU frequency of the connected device.
    vos_set_clock_frequency(VOS_48MHZ_CLOCK_FREQUENCY);

// Initialise devices
    if (InitDevices()) {

// Initialise threads - pass a ThreadID to each thread
#if (Test_TAM)
        vos_create_thread(28, SIZEOF_tcb, &TAM_Test, 1, 1);
#else
        vos_create_thread(27, SIZEOF_tcb, &HelloWorld, 1, 2);
        vos_create_thread(28, SIZEOF_tcb, &Blink, 1, 1);
        vos_create_thread( 1, SIZEOF_tcb, &MyIdleTask, 0);
#endif

// Start Scheduler to kick off the created thread(s)
        vos_start_scheduler();
        }

// It is an error to get here, use a breakpoint to catch this
    while (1) {
        CheckStatus(FALSE, ErrorSchedulerDidNotStart);
        }
    }




