/*******************************************************************************
* File Name: ADC_SAR_1_PM.c
* Version 3.0
*
* Description:
*  This file provides Sleep/WakeUp APIs functionality.
*
* Note:
*
********************************************************************************
* Copyright 2008-2015, Cypress Semiconductor Corporation.  All rights reserved.
* You may use this file only in accordance with the license, terms, conditions,
* disclaimers, and limitations in the end user license agreement accompanying
* the software package with which this file was provided.
*******************************************************************************/

#include "ADC_SAR_1.h"


/***************************************
* Local data allocation
***************************************/

static ADC_SAR_1_BACKUP_STRUCT  ADC_SAR_1_backup =
{
    ADC_SAR_1_DISABLED
};


/*******************************************************************************
* Function Name: ADC_SAR_1_SaveConfig
********************************************************************************
*
* Summary:
*  Saves the current user configuration.
*
* Parameters:
*  None.
*
* Return:
*  None.
*
*******************************************************************************/
void ADC_SAR_1_SaveConfig(void)
{
    /* All configuration registers are marked as [reset_all_retention] */
}


/*******************************************************************************
* Function Name: ADC_SAR_1_RestoreConfig
********************************************************************************
*
* Summary:
*  Restores the current user configuration.
*
* Parameters:
*  None.
*
* Return:
*  None.
*
*******************************************************************************/
void ADC_SAR_1_RestoreConfig(void)
{
    /* All congiguration registers are marked as [reset_all_retention] */
}


/*******************************************************************************
* Function Name: ADC_SAR_1_Sleep
********************************************************************************
*
* Summary:
*  This is the preferred routine to prepare the component for sleep.
*  The ADC_SAR_1_Sleep() routine saves the current component state,
*  then it calls the ADC_Stop() function.
*
* Parameters:
*  None.
*
* Return:
*  None.
*
* Global Variables:
*  ADC_SAR_1_backup - The structure field 'enableState' is modified
*  depending on the enable state of the block before entering to sleep mode.
*
*******************************************************************************/
void ADC_SAR_1_Sleep(void)
{
    if((ADC_SAR_1_PWRMGR_SAR_REG  & ADC_SAR_1_ACT_PWR_SAR_EN) != 0u)
    {
        if((ADC_SAR_1_SAR_CSR0_REG & ADC_SAR_1_SAR_SOF_START_CONV) != 0u)
        {
            ADC_SAR_1_backup.enableState = ADC_SAR_1_ENABLED | ADC_SAR_1_STARTED;
        }
        else
        {
            ADC_SAR_1_backup.enableState = ADC_SAR_1_ENABLED;
        }
        ADC_SAR_1_Stop();
    }
    else
    {
        ADC_SAR_1_backup.enableState = ADC_SAR_1_DISABLED;
    }
}


/*******************************************************************************
* Function Name: ADC_SAR_1_Wakeup
********************************************************************************
*
* Summary:
*  This is the preferred routine to restore the component to the state when
*  ADC_SAR_1_Sleep() was called. If the component was enabled before the
*  ADC_SAR_1_Sleep() function was called, the
*  ADC_SAR_1_Wakeup() function also re-enables the component.
*
* Parameters:
*  None.
*
* Return:
*  None.
*
* Global Variables:
*  ADC_SAR_1_backup - The structure field 'enableState' is used to
*  restore the enable state of block after wakeup from sleep mode.
*
*******************************************************************************/
void ADC_SAR_1_Wakeup(void)
{
    if(ADC_SAR_1_backup.enableState != ADC_SAR_1_DISABLED)
    {
        ADC_SAR_1_Enable();
        #if(ADC_SAR_1_DEFAULT_CONV_MODE != ADC_SAR_1__HARDWARE_TRIGGER)
            if((ADC_SAR_1_backup.enableState & ADC_SAR_1_STARTED) != 0u)
            {
                ADC_SAR_1_StartConvert();
            }
        #endif /* End ADC_SAR_1_DEFAULT_CONV_MODE != ADC_SAR_1__HARDWARE_TRIGGER */
    }
}


/* [] END OF FILE */
