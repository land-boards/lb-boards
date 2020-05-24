/*
** Main.c module for Chapter8 Example (Stage8)
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
WORD Delay;


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
    dprint(ThreadID, "Blink (ID=%d) has started\n", &ThreadID);
    while (1) {
        CallVOS(ThreadID);
        vos_delay_msecs(Delay);
        ThreadRunning(ThreadID);
        PortData ^= LED3;
// Now write pattern to the GPIO port.
        CallVOS(ThreadID);
        vos_dev_write(hDevice[LEDs] ,&PortData, 1, NULL);
        ThreadRunning(ThreadID);
        dprint(ThreadID, "LED is %s ", (PortData & LED3) ? "Off" : "On");
        }
    }

// Faster thread, handles Faster Button
void Faster(BYTE ThreadID) {
    gpio_ioctl_cb_t gpio_iocb;
    vos_wait_semaphore(&DevicesStarted);
    vos_signal_semaphore(&DevicesStarted);
    ThreadRunning(ThreadID);
    dprint(ThreadID, "Faster (ID=%d) has started\n", &ThreadID);
// Wait for a edges on Bit3
    gpio_iocb.ioctl_code = VOS_IOCTL_GPIO_SET_PROG_INT0_PIN;
    gpio_iocb.value = GPIO_PIN_3;
    vos_dev_ioctl(hDevice[Buttons], &gpio_iocb);

    while (1) {
// Wait on a button press
        gpio_iocb.ioctl_code = VOS_IOCTL_GPIO_SET_PROG_INT0_MODE;
        gpio_iocb.value = GPIO_INT_ON_NEG_EDGE;
        CallVOS(ThreadID);
        vos_dev_ioctl(hDevice[Buttons], &gpio_iocb);
        gpio_iocb.ioctl_code = VOS_IOCTL_GPIO_WAIT_ON_INT0;
        vos_dev_ioctl(hDevice[Buttons], &gpio_iocb);
// Returned from interrupt
        ThreadRunning(ThreadID);
        Delay = (Delay>>1) | 1;
        dprint(ThreadID, "\nDelay now = %D ", &Delay);
        }
    }

// Slower thread, handles Slower Button
void Slower(BYTE ThreadID) {
    gpio_ioctl_cb_t gpio_iocb;
    vos_wait_semaphore(&DevicesStarted);
    vos_signal_semaphore(&DevicesStarted);
    ThreadRunning(ThreadID);
    dprint(ThreadID, "Slower (ID=%d) has started\n", &ThreadID);
// Wait for a edges on Bit7
    gpio_iocb.ioctl_code = VOS_IOCTL_GPIO_SET_PROG_INT1_PIN;
    gpio_iocb.value = GPIO_PIN_7;
    vos_dev_ioctl(hDevice[Buttons], &gpio_iocb);

    while (1) {
// Wait on a button press
        gpio_iocb.ioctl_code = VOS_IOCTL_GPIO_SET_PROG_INT1_MODE;
        gpio_iocb.value = GPIO_INT_ON_NEG_EDGE;
        CallVOS(ThreadID);
        vos_dev_ioctl(hDevice[Buttons], &gpio_iocb);
        gpio_iocb.ioctl_code = VOS_IOCTL_GPIO_WAIT_ON_INT1;
        vos_dev_ioctl(hDevice[Buttons], &gpio_iocb);
// Returned from interrupt
        ThreadRunning(ThreadID);
        Delay = (Delay<<1) | 1;
        dprint(ThreadID, "\nDelay now = %D ", &Delay);
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
        vos_create_thread(27, SIZEOF_tcb, &Faster, 1, 2);
        vos_create_thread(26, SIZEOF_tcb, &Slower, 1, 4);
        vos_create_thread( 1, SIZEOF_tcb, &MyIdleTask, 0);

// Start Scheduler to kick off the created thread(s)
        vos_start_scheduler();
        }

// It is an error to get here, use a breakpoint to catch this
    while (1) {
        CheckStatus(FALSE, ErrorSchedulerDidNotStart);
        }
    }




