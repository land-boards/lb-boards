/* system.h
 *
 * Machine generated for a CPU named "cpu_0" as defined in:
 * e:\E15K_ESTF_SDRAM\software\E15core_EPCS_SDRAM_syslib\..\..\SDRAM_NIOS.ptf
 *
 * Generated: 2018-01-26 18:35:19.921
 *
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/*

DO NOT MODIFY THIS FILE

   Changing this file will have subtle consequences
   which will almost certainly lead to a nonfunctioning
   system. If you do modify this file, be aware that your
   changes will be overwritten and lost when this file
   is generated again.

DO NOT MODIFY THIS FILE

*/

/******************************************************************************
*                                                                             *
* License Agreement                                                           *
*                                                                             *
* Copyright (c) 2003 Altera Corporation, San Jose, California, USA.           *
* All rights reserved.                                                        *
*                                                                             *
* Permission is hereby granted, free of charge, to any person obtaining a     *
* copy of this software and associated documentation files (the "Software"),  *
* to deal in the Software without restriction, including without limitation   *
* the rights to use, copy, modify, merge, publish, distribute, sublicense,    *
* and/or sell copies of the Software, and to permit persons to whom the       *
* Software is furnished to do so, subject to the following conditions:        *
*                                                                             *
* The above copyright notice and this permission notice shall be included in  *
* all copies or substantial portions of the Software.                         *
*                                                                             *
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  *
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,    *
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE *
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER      *
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING     *
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER         *
* DEALINGS IN THE SOFTWARE.                                                   *
*                                                                             *
* This agreement shall be governed in all respects by the laws of the State   *
* of California and by the laws of the United States of America.              *
*                                                                             *
******************************************************************************/

/*
 * system configuration
 *
 */

#define ALT_SYSTEM_NAME "SDRAM_NIOS"
#define ALT_CPU_NAME "cpu_0"
#define ALT_CPU_ARCHITECTURE "altera_nios2"
#define ALT_DEVICE_FAMILY "CYCLONEIVE"
#define ALT_STDIN "/dev/jtag_uart"
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN_BASE 0x04802010
#define ALT_STDIN_DEV jtag_uart
#define ALT_STDIN_PRESENT
#define ALT_STDOUT "/dev/jtag_uart"
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT_BASE 0x04802010
#define ALT_STDOUT_DEV jtag_uart
#define ALT_STDOUT_PRESENT
#define ALT_STDERR "/dev/jtag_uart"
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDERR_BASE 0x04802010
#define ALT_STDERR_DEV jtag_uart
#define ALT_STDERR_PRESENT
#define ALT_CPU_FREQ 100000000
#define ALT_IRQ_BASE NULL
#define ALT_LEGACY_INTERRUPT_API_PRESENT

/*
 * processor configuration
 *
 */

#define NIOS2_CPU_IMPLEMENTATION "tiny"
#define NIOS2_BIG_ENDIAN 0
#define NIOS2_INTERRUPT_CONTROLLER_ID 0

#define NIOS2_ICACHE_SIZE 0
#define NIOS2_DCACHE_SIZE 0
#define NIOS2_ICACHE_LINE_SIZE 0
#define NIOS2_ICACHE_LINE_SIZE_LOG2 0
#define NIOS2_DCACHE_LINE_SIZE 0
#define NIOS2_DCACHE_LINE_SIZE_LOG2 0
#define NIOS2_FLUSHDA_SUPPORTED

#define NIOS2_EXCEPTION_ADDR 0x02000020
#define NIOS2_RESET_ADDR 0x04801800
#define NIOS2_BREAK_ADDR 0x04801020

#define NIOS2_HAS_DEBUG_STUB

#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0

/*
 * A define for each class of peripheral
 *
 */

#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_TRI_STATE_BRIDGE
#define __ALTERA_AVALON_CFI_FLASH
#define __ALTERA_AVALON_EPCS_FLASH_CONTROLLER
#define __ALTERA_AVALON_NEW_SDRAM_CONTROLLER

/*
 * LED configuration
 *
 */

#define LED_NAME "/dev/LED"
#define LED_TYPE "altera_avalon_pio"
#define LED_BASE 0x04802000
#define LED_SPAN 16
#define LED_DO_TEST_BENCH_WIRING 0
#define LED_DRIVEN_SIM_VALUE 0
#define LED_HAS_TRI 0
#define LED_HAS_OUT 1
#define LED_HAS_IN 0
#define LED_CAPTURE 0
#define LED_DATA_WIDTH 1
#define LED_RESET_VALUE 0
#define LED_EDGE_TYPE "NONE"
#define LED_IRQ_TYPE "NONE"
#define LED_BIT_CLEARING_EDGE_REGISTER 0
#define LED_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LED_FREQ 100000000
#define ALT_MODULE_CLASS_LED altera_avalon_pio

/*
 * jtag_uart configuration
 *
 */

#define JTAG_UART_NAME "/dev/jtag_uart"
#define JTAG_UART_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_BASE 0x04802010
#define JTAG_UART_SPAN 8
#define JTAG_UART_IRQ 0
#define JTAG_UART_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_WRITE_DEPTH 64
#define JTAG_UART_READ_DEPTH 64
#define JTAG_UART_WRITE_THRESHOLD 8
#define JTAG_UART_READ_THRESHOLD 8
#define JTAG_UART_READ_CHAR_STREAM ""
#define JTAG_UART_SHOWASCII 1
#define JTAG_UART_RELATIVEPATH 1
#define JTAG_UART_READ_LE 0
#define JTAG_UART_WRITE_LE 0
#define JTAG_UART_ALTERA_SHOW_UNRELEASED_JTAG_UART_FEATURES 1
#define ALT_MODULE_CLASS_jtag_uart altera_avalon_jtag_uart

/*
 * tri_state_bridge_0 configuration
 *
 */

#define TRI_STATE_BRIDGE_0_NAME "/dev/tri_state_bridge_0"
#define TRI_STATE_BRIDGE_0_TYPE "altera_avalon_tri_state_bridge"
#define ALT_MODULE_CLASS_tri_state_bridge_0 altera_avalon_tri_state_bridge

/*
 * cfi_flash_0 configuration
 *
 */

#define CFI_FLASH_0_NAME "/dev/cfi_flash_0"
#define CFI_FLASH_0_TYPE "altera_avalon_cfi_flash"
#define CFI_FLASH_0_BASE 0x04400000
#define CFI_FLASH_0_SPAN 4194304
#define CFI_FLASH_0_SETUP_VALUE 40
#define CFI_FLASH_0_WAIT_VALUE 160
#define CFI_FLASH_0_HOLD_VALUE 40
#define CFI_FLASH_0_TIMING_UNITS "ns"
#define CFI_FLASH_0_UNIT_MULTIPLIER 1
#define CFI_FLASH_0_SIZE 4194304
#define ALT_MODULE_CLASS_cfi_flash_0 altera_avalon_cfi_flash

/*
 * epcs_flash_controller_0 configuration
 *
 */

#define EPCS_FLASH_CONTROLLER_0_NAME "/dev/epcs_flash_controller_0"
#define EPCS_FLASH_CONTROLLER_0_TYPE "altera_avalon_epcs_flash_controller"
#define EPCS_FLASH_CONTROLLER_0_BASE 0x04801800
#define EPCS_FLASH_CONTROLLER_0_SPAN 2048
#define EPCS_FLASH_CONTROLLER_0_IRQ 1
#define EPCS_FLASH_CONTROLLER_0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define EPCS_FLASH_CONTROLLER_0_DATABITS 8
#define EPCS_FLASH_CONTROLLER_0_TARGETCLOCK 20
#define EPCS_FLASH_CONTROLLER_0_CLOCKUNITS "MHz"
#define EPCS_FLASH_CONTROLLER_0_CLOCKMULT 1000000
#define EPCS_FLASH_CONTROLLER_0_NUMSLAVES 1
#define EPCS_FLASH_CONTROLLER_0_ISMASTER 1
#define EPCS_FLASH_CONTROLLER_0_CLOCKPOLARITY 0
#define EPCS_FLASH_CONTROLLER_0_CLOCKPHASE 0
#define EPCS_FLASH_CONTROLLER_0_LSBFIRST 0
#define EPCS_FLASH_CONTROLLER_0_EXTRADELAY 0
#define EPCS_FLASH_CONTROLLER_0_TARGETSSDELAY 100
#define EPCS_FLASH_CONTROLLER_0_DELAYUNITS "us"
#define EPCS_FLASH_CONTROLLER_0_DELAYMULT "1e-006"
#define EPCS_FLASH_CONTROLLER_0_PREFIX "epcs_"
#define EPCS_FLASH_CONTROLLER_0_REGISTER_OFFSET 0x400
#define EPCS_FLASH_CONTROLLER_0_IGNORE_LEGACY_CHECK 1
#define EPCS_FLASH_CONTROLLER_0_USE_ASMI_ATOM 0
#define EPCS_FLASH_CONTROLLER_0_CLOCKUNIT "kHz"
#define EPCS_FLASH_CONTROLLER_0_DELAYUNIT "us"
#define EPCS_FLASH_CONTROLLER_0_DISABLEAVALONFLOWCONTROL 0
#define EPCS_FLASH_CONTROLLER_0_INSERT_SYNC 0
#define EPCS_FLASH_CONTROLLER_0_SYNC_REG_DEPTH 2
#define ALT_MODULE_CLASS_epcs_flash_controller_0 altera_avalon_epcs_flash_controller

/*
 * sdram_0 configuration
 *
 */

#define SDRAM_0_NAME "/dev/sdram_0"
#define SDRAM_0_TYPE "altera_avalon_new_sdram_controller"
#define SDRAM_0_BASE 0x02000000
#define SDRAM_0_SPAN 33554432
#define SDRAM_0_REGISTER_DATA_IN 1
#define SDRAM_0_SIM_MODEL_BASE 0
#define SDRAM_0_SDRAM_DATA_WIDTH 16
#define SDRAM_0_SDRAM_ADDR_WIDTH 13
#define SDRAM_0_SDRAM_ROW_WIDTH 13
#define SDRAM_0_SDRAM_COL_WIDTH 9
#define SDRAM_0_SDRAM_NUM_CHIPSELECTS 1
#define SDRAM_0_SDRAM_NUM_BANKS 4
#define SDRAM_0_REFRESH_PERIOD 15.625
#define SDRAM_0_POWERUP_DELAY 100.0
#define SDRAM_0_CAS_LATENCY 3
#define SDRAM_0_T_RFC 70.0
#define SDRAM_0_T_RP 20.0
#define SDRAM_0_T_MRD 3
#define SDRAM_0_T_RCD 20.0
#define SDRAM_0_T_AC 5.5
#define SDRAM_0_T_WR 14.0
#define SDRAM_0_INIT_REFRESH_COMMANDS 2
#define SDRAM_0_INIT_NOP_DELAY 0.0
#define SDRAM_0_SHARED_DATA 0
#define SDRAM_0_SDRAM_BANK_WIDTH 2
#define SDRAM_0_TRISTATE_BRIDGE_SLAVE ""
#define SDRAM_0_STARVATION_INDICATOR 0
#define SDRAM_0_IS_INITIALIZED 1
#define ALT_MODULE_CLASS_sdram_0 altera_avalon_new_sdram_controller

/*
 * system library configuration
 *
 */

#define ALT_MAX_FD 32
#define ALT_SYS_CLK none
#define ALT_TIMESTAMP_CLK none

/*
 * Devices associated with code sections.
 *
 */

#define ALT_TEXT_DEVICE       SDRAM_0
#define ALT_RODATA_DEVICE     SDRAM_0
#define ALT_RWDATA_DEVICE     SDRAM_0
#define ALT_EXCEPTIONS_DEVICE SDRAM_0
#define ALT_RESET_DEVICE      EPCS_FLASH_CONTROLLER_0


#endif /* __SYSTEM_H_ */
