/*******************************************************************************
* File Name: ADC_SAR_1_Bypass.c  
* Version 1.90
*
* Description:
*  This file contains API to enable firmware control of a Pins component.
*
* Note:
*
********************************************************************************
* Copyright 2008-2012, Cypress Semiconductor Corporation.  All rights reserved.
* You may use this file only in accordance with the license, terms, conditions, 
* disclaimers, and limitations in the end user license agreement accompanying 
* the software package with which this file was provided.
*******************************************************************************/

#include "cytypes.h"
#include "ADC_SAR_1_Bypass.h"

/* APIs are not generated for P15[7:6] on PSoC 5 */
#if !(CY_PSOC5A &&\
	 ADC_SAR_1_Bypass__PORT == 15 && ((ADC_SAR_1_Bypass__MASK & 0xC0) != 0))


/*******************************************************************************
* Function Name: ADC_SAR_1_Bypass_Write
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
void ADC_SAR_1_Bypass_Write(uint8 value) 
{
    uint8 staticBits = (ADC_SAR_1_Bypass_DR & (uint8)(~ADC_SAR_1_Bypass_MASK));
    ADC_SAR_1_Bypass_DR = staticBits | ((uint8)(value << ADC_SAR_1_Bypass_SHIFT) & ADC_SAR_1_Bypass_MASK);
}


/*******************************************************************************
* Function Name: ADC_SAR_1_Bypass_SetDriveMode
********************************************************************************
*
* Summary:
*  Change the drive mode on the pins of the port.
* 
* Parameters:  
*  mode:  Change the pins to this drive mode.
*
* Return: 
*  None
*
*******************************************************************************/
void ADC_SAR_1_Bypass_SetDriveMode(uint8 mode) 
{
	CyPins_SetPinDriveMode(ADC_SAR_1_Bypass_0, mode);
}


/*******************************************************************************
* Function Name: ADC_SAR_1_Bypass_Read
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
*  Macro ADC_SAR_1_Bypass_ReadPS calls this function. 
*  
*******************************************************************************/
uint8 ADC_SAR_1_Bypass_Read(void) 
{
    return (ADC_SAR_1_Bypass_PS & ADC_SAR_1_Bypass_MASK) >> ADC_SAR_1_Bypass_SHIFT;
}


/*******************************************************************************
* Function Name: ADC_SAR_1_Bypass_ReadDataReg
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
uint8 ADC_SAR_1_Bypass_ReadDataReg(void) 
{
    return (ADC_SAR_1_Bypass_DR & ADC_SAR_1_Bypass_MASK) >> ADC_SAR_1_Bypass_SHIFT;
}


/* If Interrupts Are Enabled for this Pins component */ 
#if defined(ADC_SAR_1_Bypass_INTSTAT) 

    /*******************************************************************************
    * Function Name: ADC_SAR_1_Bypass_ClearInterrupt
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
    uint8 ADC_SAR_1_Bypass_ClearInterrupt(void) 
    {
        return (ADC_SAR_1_Bypass_INTSTAT & ADC_SAR_1_Bypass_MASK) >> ADC_SAR_1_Bypass_SHIFT;
    }

#endif /* If Interrupts Are Enabled for this Pins component */ 

#endif /* CY_PSOC5A... */

    
/* [] END OF FILE */
