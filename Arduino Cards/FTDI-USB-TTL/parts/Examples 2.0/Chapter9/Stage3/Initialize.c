/*
** Initialize.c module for Chapter 9 Example
** Programs need a lot of initialization, do it here to tidy up main
**
** Author:  John Hyde, USB Design By Example
*/

#include "main.h"

extern VOS_HANDLE hDevice[NUMBER_OF_DEVICES];
extern vos_semaphore_t DevicesStarted;
extern usbslave_ep_handle_t EP0_In, EP0_Out, EP1_In;

// Device initialization
BOOL InitDevices(void) {
    gpio_context_t gpioCtx;
    uart_context_t uartCtx;
    usbhost_context_t hostCtx;
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
// Route Ports C and D for Logic Analyser
    Status |= vos_iomux_define_bidi(51, IOMUX_IN_GPIO_PORT_C_0, IOMUX_OUT_GPIO_PORT_D_0);
    Status |= vos_iomux_define_bidi(52, IOMUX_IN_GPIO_PORT_C_1, IOMUX_OUT_GPIO_PORT_D_1);
    Status |= vos_iomux_define_bidi(55, IOMUX_IN_GPIO_PORT_C_2, IOMUX_OUT_GPIO_PORT_D_2);
    Status |= vos_iomux_define_bidi(56, IOMUX_IN_GPIO_PORT_C_3, IOMUX_OUT_GPIO_PORT_D_3);
    Status |= vos_iomux_define_bidi(57, IOMUX_IN_GPIO_PORT_C_4, IOMUX_OUT_GPIO_PORT_D_4);
    Status |= vos_iomux_define_bidi(58, IOMUX_IN_GPIO_PORT_C_5, IOMUX_OUT_GPIO_PORT_D_5);
    Status |= vos_iomux_define_bidi(59, IOMUX_IN_GPIO_PORT_C_6, IOMUX_OUT_GPIO_PORT_D_6);
    Status |= vos_iomux_define_bidi(60, IOMUX_IN_GPIO_PORT_C_7, IOMUX_OUT_GPIO_PORT_D_7);

// INITIALISE GPIO PARAMETERS
// Initialize LEDs device with the device manager.
    gpioCtx.port_identifier = GPIO_PORT_E;
    gpio_init(LEDs, &gpioCtx);

// Spin up the UART
    uartCtx.buffer_size = VOS_BUFFER_SIZE_128_BYTES;
    uart_init(UART, &uartCtx);

// I could use one port and switch it from input to output at run time using VOS_IOCTL_GPIO_SET_MASK
// I decided to use 2 ports since I have them available and this reduces program complexity
    gpioCtx.port_identifier = GPIO_PORT_C;
    gpio_init(LA_In, &gpioCtx);
    gpioCtx.port_identifier = GPIO_PORT_D;
    gpio_init(LA_Out, &gpioCtx);

// Configure USB Host2 for operation
    hostCtx.if_count = 8;
    hostCtx.ep_count = 8;
    hostCtx.xfer_count = 2;
    hostCtx.iso_xfer_count = 0;
    usbhost_init(-1, Host, &hostCtx);

// No pin routing to implement for USB Slave 1, just initialize it
    usbslave_init(USBSLAVE_PORT_A, Slave);

    CheckStatus(Status, ErrorInitDevices);
    return TRUE; //(Status == 0);
    }

void StartupDevices(void) {
    gpio_ioctl_cb_t gpio_iocb;
    common_ioctl_cb_t uart_iocb;
    usbslave_ioctl_cb_t slave_iocb;
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

// Open two more GPIO drivers for the Logic Analyser and configure them
    hDevice[LA_In] = vos_dev_open(LA_In);
// Set all port bits to input
    gpio_iocb.ioctl_code = VOS_IOCTL_GPIO_SET_MASK;
    gpio_iocb.value = 0;
    Status |= vos_dev_ioctl(hDevice[LA_In], &gpio_iocb);
    hDevice[LA_Out] = vos_dev_open(LA_Out);
// Set all port bits to output
    gpio_iocb.ioctl_code = VOS_IOCTL_GPIO_SET_MASK;
    gpio_iocb.value = 0xFF;
    Status |= vos_dev_ioctl(hDevice[LA_Out], &gpio_iocb);

// Spin up USB Host
    hDevice[Host] = vos_dev_open(Host);

// Startup and get handles for the USB Slave
    hDevice[Slave] = vos_dev_open(Slave);
    slave_iocb.ioctl_code = VOS_IOCTL_USBSLAVE_SET_ENDPOINT_MASKS;
    slave_iocb.request.set_ep_masks.in_mask = 0x02;    // EP1
    slave_iocb.request.set_ep_masks.out_mask = 0;
    Status |= vos_dev_ioctl(hDevice[Slave], &slave_iocb);

    slave_iocb.ioctl_code = VOS_IOCTL_USBSLAVE_GET_CONTROL_ENDPOINT_HANDLE;
    slave_iocb.ep = USBSLAVE_CONTROL_IN;
    slave_iocb.get = &EP0_In;
    Status |= vos_dev_ioctl(hDevice[Slave], &slave_iocb);

    slave_iocb.ioctl_code = VOS_IOCTL_USBSLAVE_GET_CONTROL_ENDPOINT_HANDLE;
    slave_iocb.ep = USBSLAVE_CONTROL_OUT;
    slave_iocb.get = &EP0_Out;
    Status |= vos_dev_ioctl(hDevice[Slave], &slave_iocb);

    slave_iocb.ioctl_code = VOS_IOCTL_USBSLAVE_GET_IN_ENDPOINT_HANDLE;
    slave_iocb.ep = 1;
    slave_iocb.get = &EP1_In;
    Status |= vos_dev_ioctl(hDevice[Slave], &slave_iocb);

// Let other threads know that devices are initialized
    vos_signal_semaphore(&DevicesStarted);

    CheckStatus(Status, ErrorStartupDevices);
    }


