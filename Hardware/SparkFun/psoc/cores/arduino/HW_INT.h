/*******************************************************************************
* File Name: HW_INT.h
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
#if !defined(CY_ISR_HW_INT_H)
#define CY_ISR_HW_INT_H


#include <cytypes.h>
#include <cyfitter.h>

/* Interrupt Controller API. */
void HW_INT_Start(void);
void HW_INT_StartEx(cyisraddress address);
void HW_INT_Stop(void);

CY_ISR_PROTO(HW_INT_Interrupt);

void HW_INT_SetVector(cyisraddress address);
cyisraddress HW_INT_GetVector(void);

void HW_INT_SetPriority(uint8 priority);
uint8 HW_INT_GetPriority(void);

void HW_INT_Enable(void);
uint8 HW_INT_GetState(void);
void HW_INT_Disable(void);

void HW_INT_SetPending(void);
void HW_INT_ClearPending(void);


/* Interrupt Controller Constants */

/* Address of the INTC.VECT[x] register that contains the Address of the HW_INT ISR. */
#define HW_INT_INTC_VECTOR            ((reg32 *) HW_INT__INTC_VECT)

/* Address of the HW_INT ISR priority. */
#define HW_INT_INTC_PRIOR             ((reg8 *) HW_INT__INTC_PRIOR_REG)

/* Priority of the HW_INT interrupt. */
#define HW_INT_INTC_PRIOR_NUMBER      HW_INT__INTC_PRIOR_NUM

/* Address of the INTC.SET_EN[x] byte to bit enable HW_INT interrupt. */
#define HW_INT_INTC_SET_EN            ((reg32 *) HW_INT__INTC_SET_EN_REG)

/* Address of the INTC.CLR_EN[x] register to bit clear the HW_INT interrupt. */
#define HW_INT_INTC_CLR_EN            ((reg32 *) HW_INT__INTC_CLR_EN_REG)

/* Address of the INTC.SET_PD[x] register to set the HW_INT interrupt state to pending. */
#define HW_INT_INTC_SET_PD            ((reg32 *) HW_INT__INTC_SET_PD_REG)

/* Address of the INTC.CLR_PD[x] register to clear the HW_INT interrupt. */
#define HW_INT_INTC_CLR_PD            ((reg32 *) HW_INT__INTC_CLR_PD_REG)


#endif /* CY_ISR_HW_INT_H */


/* [] END OF FILE */
