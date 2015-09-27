/*******************************************************************************
* File Name: WSDriver_fisr.h
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
#if !defined(CY_ISR_WSDriver_fisr_H)
#define CY_ISR_WSDriver_fisr_H


#include <cytypes.h>
#include <cyfitter.h>

/* Interrupt Controller API. */
void WSDriver_fisr_Start(void);
void WSDriver_fisr_StartEx(cyisraddress address);
void WSDriver_fisr_Stop(void);

CY_ISR_PROTO(WSDriver_fisr_Interrupt);

void WSDriver_fisr_SetVector(cyisraddress address);
cyisraddress WSDriver_fisr_GetVector(void);

void WSDriver_fisr_SetPriority(uint8 priority);
uint8 WSDriver_fisr_GetPriority(void);

void WSDriver_fisr_Enable(void);
uint8 WSDriver_fisr_GetState(void);
void WSDriver_fisr_Disable(void);

void WSDriver_fisr_SetPending(void);
void WSDriver_fisr_ClearPending(void);


/* Interrupt Controller Constants */

/* Address of the INTC.VECT[x] register that contains the Address of the WSDriver_fisr ISR. */
#define WSDriver_fisr_INTC_VECTOR            ((reg32 *) WSDriver_fisr__INTC_VECT)

/* Address of the WSDriver_fisr ISR priority. */
#define WSDriver_fisr_INTC_PRIOR             ((reg8 *) WSDriver_fisr__INTC_PRIOR_REG)

/* Priority of the WSDriver_fisr interrupt. */
#define WSDriver_fisr_INTC_PRIOR_NUMBER      WSDriver_fisr__INTC_PRIOR_NUM

/* Address of the INTC.SET_EN[x] byte to bit enable WSDriver_fisr interrupt. */
#define WSDriver_fisr_INTC_SET_EN            ((reg32 *) WSDriver_fisr__INTC_SET_EN_REG)

/* Address of the INTC.CLR_EN[x] register to bit clear the WSDriver_fisr interrupt. */
#define WSDriver_fisr_INTC_CLR_EN            ((reg32 *) WSDriver_fisr__INTC_CLR_EN_REG)

/* Address of the INTC.SET_PD[x] register to set the WSDriver_fisr interrupt state to pending. */
#define WSDriver_fisr_INTC_SET_PD            ((reg32 *) WSDriver_fisr__INTC_SET_PD_REG)

/* Address of the INTC.CLR_PD[x] register to clear the WSDriver_fisr interrupt. */
#define WSDriver_fisr_INTC_CLR_PD            ((reg32 *) WSDriver_fisr__INTC_CLR_PD_REG)


#endif /* CY_ISR_WSDriver_fisr_H */


/* [] END OF FILE */
