/*******************************************************************************
* File Name: BootloaderResetInterrupt.h
* Version 1.70
*
*  Description:
*   Provides the function definitions for the Interrupt Controller.
*
*
********************************************************************************
* Copyright 2008-2015, Cypress Semiconductor Corporation.  All rights reserved.
* You may use this file only in accordance with the license, terms, conditions, 
* disclaimers, and limitations in the end user license agreement accompanying 
* the software package with which this file was provided.
*******************************************************************************/
#if !defined(CY_ISR_BootloaderResetInterrupt_H)
#define CY_ISR_BootloaderResetInterrupt_H


#include <cytypes.h>
#include <cyfitter.h>

/* Interrupt Controller API. */
void BootloaderResetInterrupt_Start(void);
void BootloaderResetInterrupt_StartEx(cyisraddress address);
void BootloaderResetInterrupt_Stop(void);

CY_ISR_PROTO(BootloaderResetInterrupt_Interrupt);

void BootloaderResetInterrupt_SetVector(cyisraddress address);
cyisraddress BootloaderResetInterrupt_GetVector(void);

void BootloaderResetInterrupt_SetPriority(uint8 priority);
uint8 BootloaderResetInterrupt_GetPriority(void);

void BootloaderResetInterrupt_Enable(void);
uint8 BootloaderResetInterrupt_GetState(void);
void BootloaderResetInterrupt_Disable(void);

void BootloaderResetInterrupt_SetPending(void);
void BootloaderResetInterrupt_ClearPending(void);


/* Interrupt Controller Constants */

/* Address of the INTC.VECT[x] register that contains the Address of the BootloaderResetInterrupt ISR. */
#define BootloaderResetInterrupt_INTC_VECTOR            ((reg32 *) BootloaderResetInterrupt__INTC_VECT)

/* Address of the BootloaderResetInterrupt ISR priority. */
#define BootloaderResetInterrupt_INTC_PRIOR             ((reg8 *) BootloaderResetInterrupt__INTC_PRIOR_REG)

/* Priority of the BootloaderResetInterrupt interrupt. */
#define BootloaderResetInterrupt_INTC_PRIOR_NUMBER      BootloaderResetInterrupt__INTC_PRIOR_NUM

/* Address of the INTC.SET_EN[x] byte to bit enable BootloaderResetInterrupt interrupt. */
#define BootloaderResetInterrupt_INTC_SET_EN            ((reg32 *) BootloaderResetInterrupt__INTC_SET_EN_REG)

/* Address of the INTC.CLR_EN[x] register to bit clear the BootloaderResetInterrupt interrupt. */
#define BootloaderResetInterrupt_INTC_CLR_EN            ((reg32 *) BootloaderResetInterrupt__INTC_CLR_EN_REG)

/* Address of the INTC.SET_PD[x] register to set the BootloaderResetInterrupt interrupt state to pending. */
#define BootloaderResetInterrupt_INTC_SET_PD            ((reg32 *) BootloaderResetInterrupt__INTC_SET_PD_REG)

/* Address of the INTC.CLR_PD[x] register to clear the BootloaderResetInterrupt interrupt. */
#define BootloaderResetInterrupt_INTC_CLR_PD            ((reg32 *) BootloaderResetInterrupt__INTC_CLR_PD_REG)


#endif /* CY_ISR_BootloaderResetInterrupt_H */


/* [] END OF FILE */
