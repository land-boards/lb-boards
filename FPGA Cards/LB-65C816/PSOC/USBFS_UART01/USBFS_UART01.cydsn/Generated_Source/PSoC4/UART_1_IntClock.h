/*******************************************************************************
* File Name: UART_1_IntClock.h
* Version 2.20
*
*  Description:
*   Provides the function and constant definitions for the clock component.
*
*  Note:
*
********************************************************************************
* Copyright 2008-2012, Cypress Semiconductor Corporation.  All rights reserved.
* You may use this file only in accordance with the license, terms, conditions, 
* disclaimers, and limitations in the end user license agreement accompanying 
* the software package with which this file was provided.
*******************************************************************************/

#if !defined(CY_CLOCK_UART_1_IntClock_H)
#define CY_CLOCK_UART_1_IntClock_H

#include <cytypes.h>
#include <cyfitter.h>


/***************************************
*        Function Prototypes
***************************************/
#if defined CYREG_PERI_DIV_CMD

void UART_1_IntClock_StartEx(uint32 alignClkDiv);
#define UART_1_IntClock_Start() \
    UART_1_IntClock_StartEx(UART_1_IntClock__PA_DIV_ID)

#else

void UART_1_IntClock_Start(void);

#endif/* CYREG_PERI_DIV_CMD */

void UART_1_IntClock_Stop(void);

void UART_1_IntClock_SetFractionalDividerRegister(uint16 clkDivider, uint8 clkFractional);

uint16 UART_1_IntClock_GetDividerRegister(void);
uint8  UART_1_IntClock_GetFractionalDividerRegister(void);

#define UART_1_IntClock_Enable()                         UART_1_IntClock_Start()
#define UART_1_IntClock_Disable()                        UART_1_IntClock_Stop()
#define UART_1_IntClock_SetDividerRegister(clkDivider, reset)  \
    UART_1_IntClock_SetFractionalDividerRegister((clkDivider), 0u)
#define UART_1_IntClock_SetDivider(clkDivider)           UART_1_IntClock_SetDividerRegister((clkDivider), 1u)
#define UART_1_IntClock_SetDividerValue(clkDivider)      UART_1_IntClock_SetDividerRegister((clkDivider) - 1u, 1u)


/***************************************
*             Registers
***************************************/
#if defined CYREG_PERI_DIV_CMD

#define UART_1_IntClock_DIV_ID     UART_1_IntClock__DIV_ID

#define UART_1_IntClock_CMD_REG    (*(reg32 *)CYREG_PERI_DIV_CMD)
#define UART_1_IntClock_CTRL_REG   (*(reg32 *)UART_1_IntClock__CTRL_REGISTER)
#define UART_1_IntClock_DIV_REG    (*(reg32 *)UART_1_IntClock__DIV_REGISTER)

#define UART_1_IntClock_CMD_DIV_SHIFT          (0u)
#define UART_1_IntClock_CMD_PA_DIV_SHIFT       (8u)
#define UART_1_IntClock_CMD_DISABLE_SHIFT      (30u)
#define UART_1_IntClock_CMD_ENABLE_SHIFT       (31u)

#define UART_1_IntClock_CMD_DISABLE_MASK       ((uint32)((uint32)1u << UART_1_IntClock_CMD_DISABLE_SHIFT))
#define UART_1_IntClock_CMD_ENABLE_MASK        ((uint32)((uint32)1u << UART_1_IntClock_CMD_ENABLE_SHIFT))

#define UART_1_IntClock_DIV_FRAC_MASK  (0x000000F8u)
#define UART_1_IntClock_DIV_FRAC_SHIFT (3u)
#define UART_1_IntClock_DIV_INT_MASK   (0xFFFFFF00u)
#define UART_1_IntClock_DIV_INT_SHIFT  (8u)

#else 

#define UART_1_IntClock_DIV_REG        (*(reg32 *)UART_1_IntClock__REGISTER)
#define UART_1_IntClock_ENABLE_REG     UART_1_IntClock_DIV_REG
#define UART_1_IntClock_DIV_FRAC_MASK  UART_1_IntClock__FRAC_MASK
#define UART_1_IntClock_DIV_FRAC_SHIFT (16u)
#define UART_1_IntClock_DIV_INT_MASK   UART_1_IntClock__DIVIDER_MASK
#define UART_1_IntClock_DIV_INT_SHIFT  (0u)

#endif/* CYREG_PERI_DIV_CMD */

#endif /* !defined(CY_CLOCK_UART_1_IntClock_H) */

/* [] END OF FILE */
