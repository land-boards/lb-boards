/*
** Main.c module for Chapter8 Example (Stage1)
**
** Author:  John Hyde, USB Design By Example
*/

// Include global definitions, constants, etc
#include "main.h"

// Declare global variables
VOS_HANDLE hDevice[NUMBER_OF_DEVICES];

void CheckStatus(BYTE Status, BYTE ErrorCode) {
    BYTE Reason;
    if (Status == 0) return;
// Set a breakpoint at the next line so that this error can be resolved
    Reason = ErrorCode;
    }

// Device initialization
BOOL InitDevices(void) {
    gpio_ioctl_cb_t gpio_iocb;
    gpio_context_t gpioCtx;
    BYTE Status = 0;

// This example needs a 64pin module due to my hardware implementation
    if (vos_get_package_type() != VINCULUM_II_64_PIN) return FALSE;

// INITIALISE IOMUX PARAMETERS
// We will flash LED3 on the V2 Eval Board, which is connected to GPIO1
// The software will write to an IO Register, choose PortE
// Connect PortE to the physical IO pin, need Bit1 or Bit5
    Status |= vos_iomux_define_output(12, IOMUX_OUT_GPIO_PORT_E_1);

// INITIALISE GPIO PARAMETERS
// Initialize LEDs device with the device manager.
    gpioCtx.port_identifier = GPIO_PORT_E;
    gpio_init(LEDs, &gpioCtx);

    CheckStatus(Status, ErrorInitDevices);
    return TRUE;
    }

void StartupDevices(void) {
    gpio_ioctl_cb_t gpio_iocb;
    BYTE Status = 0;
// Open GPIO driver and configure it
    hDevice[LEDs] = vos_dev_open(LEDs);
// Set LED3 pin to output
    gpio_iocb.ioctl_code = VOS_IOCTL_GPIO_SET_MASK;
    gpio_iocb.value = LED3;
    Status |= vos_dev_ioctl(hDevice[LEDs], &gpio_iocb);

    CheckStatus(Status, ErrorStartupDevices);
    }

// Declare program thread(s)
// Blink thread, toggles LED3 on GPIO1
void Blink(void) {
    BYTE PortData = LED3;
    StartupDevices();
    while (1) {
        vos_delay_msecs(512);
        PortData ^= LED3;
// Now write pattern to the GPIO port.
        vos_dev_write(hDevice[LEDs] ,&PortData, 1, NULL);
        }
    }

// Declare Main application
void main(void) {
// Initialize variables

// Initialise RTOS
    vos_init(VOS_QUANTUM, VOS_TICK_INTERVAL, NUMBER_OF_DEVICES);

// Sets the CPU frequency of the connected device.
    vos_set_clock_frequency(VOS_48MHZ_CLOCK_FREQUENCY);

// Initialise devices
    if (InitDevices()) {

// Initialise thread(s)
        vos_create_thread(28, SIZEOF_tcb, &Blink, 0);

// Start Scheduler to kick off the created thread(s)
        vos_start_scheduler();
        }

// It is an error to get here, use a breakpoint to catch this
    while (1) {
        CheckStatus(FALSE, ErrorSchedulerDidNotStart);
        }
    }



