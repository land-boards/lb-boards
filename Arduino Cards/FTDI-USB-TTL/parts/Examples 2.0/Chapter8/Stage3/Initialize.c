/*
** Initialize.c module for Chapter7 Example
**
** Programs need a lot of initialization, do it here to tidy up main
*/

#include "main.h"

extern VOS_HANDLE hDevice[NUMBER_OF_DEVICES];
extern vos_semaphore_t DevicesStarted;

// Device initialization
BOOL InitDevices(void) {
    gpio_context_t gpioCtx;
    uart_context_t uartCtx;
    BYTE Status = 0;

// This example needs a 64pin module due to my hardware implementation
    if (vos_get_package_type() != VINCULUM_II_64_PIN) return FALSE;

// INITIALISE IOMUX PARAMETERS
// We will flash LED3 on the V2 Eval Board, which is connected to GPIO1
// The software will write to an IO Register, choose PortE
// Connect PortE to the physical IO pin, need Bit1 or Bit5
    Status |= vos_iomux_define_output(12, IOMUX_OUT_GPIO_PORT_E_1);
// Route the UART to physical pins
    Status |= vos_iomux_define_output(39,IOMUX_OUT_UART_TXD);
    Status |= vos_iomux_define_input(40,IOMUX_IN_UART_RXD);

// INITIALISE GPIO PARAMETERS
// Initialize LEDs device with the device manager.
    gpioCtx.port_identifier = GPIO_PORT_E;
    gpio_init(LEDs, &gpioCtx);

// Spin up the UART
    uartCtx.buffer_size = VOS_BUFFER_SIZE_128_BYTES;
    uart_init(UART, &uartCtx);

    CheckStatus(Status, ErrorInitDevices);
    return TRUE; //(Status == 0);
    }

void StartupDevices(void) {
    gpio_ioctl_cb_t gpio_iocb;
    common_ioctl_cb_t uart_iocb;
    BYTE Status = 0;
// Open GPIO driver and configure it
    hDevice[LEDs] = vos_dev_open(LEDs);
// Set LED3 pin to output
    gpio_iocb.ioctl_code = VOS_IOCTL_GPIO_SET_MASK;
    gpio_iocb.value = LED3;
    Status |= vos_dev_ioctl(hDevice[LEDs], &gpio_iocb);

// Open UART driver and configure it
    hDevice[UART] = vos_dev_open(UART);
    uart_iocb.ioctl_code = VOS_IOCTL_UART_SET_BAUD_RATE;
    uart_iocb.set.uart_baud_rate = UART_BAUD_3000000;
    Status = vos_dev_ioctl(hDevice[UART], &uart_iocb);
    uart_iocb.ioctl_code = VOS_IOCTL_UART_SET_FLOW_CONTROL;
    uart_iocb.set.param = UART_FLOW_NONE;
    Status |= vos_dev_ioctl(hDevice[UART], &uart_iocb);
    uart_iocb.ioctl_code = VOS_IOCTL_UART_SET_DATA_BITS;
    uart_iocb.set.param = UART_DATA_BITS_8;
    Status |= vos_dev_ioctl(hDevice[UART], &uart_iocb);
    uart_iocb.ioctl_code = VOS_IOCTL_UART_SET_STOP_BITS;
    uart_iocb.set.param = UART_STOP_BITS_1;
    Status |= vos_dev_ioctl(hDevice[UART], &uart_iocb);
    uart_iocb.ioctl_code = VOS_IOCTL_UART_SET_PARITY;
    uart_iocb.set.param = UART_PARITY_NONE;
    Status |= vos_dev_ioctl(hDevice[UART], &uart_iocb);
// Since baud rate >= 115200 enable DMA for this channel
    uart_iocb.ioctl_code = VOS_IOCTL_COMMON_ENABLE_DMA;
    Status |= vos_dev_ioctl(hDevice[UART], &uart_iocb);
// Finally enable UART interrupts are we're ready to go!
    vos_enable_interrupts(VOS_UART_INT_IEN);

// Let other tasks know that devices are initialized
    vos_signal_semaphore(&DevicesStarted);

    CheckStatus(Status, ErrorStartupDevices);
    }

