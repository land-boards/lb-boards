/*
** Main.c module for Chapter8 Example (Stage4)
**
** Author:  John Hyde
*/

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
void Blink(void) {
    BYTE PortData = LED3;
    StartupDevices();
    dprint("Blink has started\n", 0);
    while (1) {
        vos_delay_msecs(512);
        PortData ^= LED3;
// Now write pattern to the GPIO port.
        vos_dev_write(hDevice[LEDs] ,&PortData, 1, NULL);
        dprint("LED is %s ", (PortData & LED3) ? "Off" : "On");
        }
    }

void HelloWorld(void) {
    BYTE Counter = 0;
    vos_wait_semaphore(&DevicesStarted);
    vos_signal_semaphore(&DevicesStarted);
    dprint("Hello World has started\n", 0);
    while (1) {
        vos_delay_msecs(1000);
        dprint("Hello World %d ", &Counter++);
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

// Initialise thread(s)
        vos_create_thread(27, SIZEOF_tcb, &HelloWorld, 0);
        vos_create_thread(28, SIZEOF_tcb, &Blink, 0);

// Start Scheduler to kick off the created thread(s)
        vos_start_scheduler();
        }

// It is an error to get here, use a breakpoint to catch this
    while (1) {
        CheckStatus(FALSE, ErrorSchedulerDidNotStart);
        }
    }




