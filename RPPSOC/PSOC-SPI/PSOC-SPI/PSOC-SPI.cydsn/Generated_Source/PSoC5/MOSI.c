/*******************************************************************************
* File Name: MOSI.c  
* Version 2.10
*
* Description:
*  This file contains API to enable firmware control of a Pins component.
*
* Note:
*
********************************************************************************
* Copyright 2008-2014, Cypress Semiconductor Corporation.  All rights reserved.
* You may use this file only in accordance with the license, terms, conditions, 
* disclaimers, and limitations in the end user license agreement accompanying 
* the software package with which this file was provided.
*******************************************************************************/

#include "cytypes.h"
#include "MOSI.h"

/* APIs are not generated for P15[7:6] on PSoC 5 */
#if !(CY_PSOC5A &&\
	 MOSI__PORT == 15 && ((MOSI__MASK & 0xC0) != 0))


/*******************************************************************************
* Function Name: MOSI_Write
********************************************************************************
*
* Summary:
*  Assign a new value to the digital port's data output register.  
*
* Parameters:  
*  prtValue:  The value to be assigned to the Digital Port. 
*
* Return: 
*  None
*  
*******************************************************************************/
void MOSI_Write(uint8 value) 
{
    uint8 staticBits = (MOSI_DR & (uint8)(~MOSI_MASK));
    MOSI_DR = staticBits | ((uint8)(value << MOSI_SHIFT) & MOSI_MASK);
}


/*******************************************************************************
* Function Name: MOSI_SetDriveMode
********************************************************************************
*
* Summary:
*  Change the drive mode on the pins of the port.
* 
* Parameters:  
*  mode:  Change the pins to one of the following drive modes.
*
*  MOSI_DM_STRONG     Strong Drive 
*  MOSI_DM_OD_HI      Open Drain, Drives High 
*  MOSI_DM_OD_LO      Open Drain, Drives Low 
*  MOSI_DM_RES_UP     Resistive Pull Up 
*  MOSI_DM_RES_DWN    Resistive Pull Down 
*  MOSI_DM_RES_UPDWN  Resistive Pull Up/Down 
*  MOSI_DM_DIG_HIZ    High Impedance Digital 
*  MOSI_DM_ALG_HIZ    High Impedance Analog 
*
* Return: 
*  None
*
*******************************************************************************/
void MOSI_SetDriveMode(uint8 mode) 
{
	CyPins_SetPinDriveMode(MOSI_0, mode);
}


/*******************************************************************************
* Function Name: MOSI_Read
********************************************************************************
*
* Summary:
*  Read the current value on the pins of the Digital Port in right justified 
*  form.
*
* Parameters:  
*  None
*
* Return: 
*  Returns the current value of the Digital Port as a right justified number
*  
* Note:
*  Macro MOSI_ReadPS calls this function. 
*  
*******************************************************************************/
uint8 MOSI_Read(void) 
{
    return (MOSI_PS & MOSI_MASK) >> MOSI_SHIFT;
}


/*******************************************************************************
* Function Name: MOSI_ReadDataReg
********************************************************************************
*
* Summary:
*  Read the current value assigned to a Digital Port's data output register
*
* Parameters:  
*  None 
*
* Return: 
*  Returns the current value assigned to the Digital Port's data output register
*  
*******************************************************************************/
uint8 MOSI_ReadDataReg(void) 
{
    return (MOSI_DR & MOSI_MASK) >> MOSI_SHIFT;
}


/* If Interrupts Are Enabled for this Pins component */ 
#if defined(MOSI_INTSTAT) 

    /*******************************************************************************
    * Function Name: MOSI_ClearInterrupt
    ********************************************************************************
    * Summary:
    *  Clears any active interrupts attached to port and returns the value of the 
    *  interrupt status register.
    *
    * Parameters:  
    *  None 
    *
    * Return: 
    *  Returns the value of the interrupt status register
    *  
    *******************************************************************************/
    uint8 MOSI_ClearInterrupt(void) 
    {
        return (MOSI_INTSTAT & MOSI_MASK) >> MOSI_SHIFT;
    }

#endif /* If Interrupts Are Enabled for this Pins component */ 

#endif /* CY_PSOC5A... */

    
/* [] END OF FILE */
