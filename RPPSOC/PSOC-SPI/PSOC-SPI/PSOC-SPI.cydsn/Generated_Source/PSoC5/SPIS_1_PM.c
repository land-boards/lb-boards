/*******************************************************************************
* File Name: SPIS_1_PM.c
* Version 2.70
*
* Description:
*  This file contains the setup, control and status commands to support
*  component operations in low power mode.
*
* Note:
*
********************************************************************************
* Copyright 2008-2015, Cypress Semiconductor Corporation.  All rights reserved.
* You may use this file only in accordance with the license, terms, conditions,
* disclaimers, and limitations in the end user license agreement accompanying
* the software package with which this file was provided.
*******************************************************************************/

#include "SPIS_1_PVT.h"

static SPIS_1_BACKUP_STRUCT SPIS_1_backup = 
{
    SPIS_1_DISABLED,
    SPIS_1_BITCTR_INIT,
};


/*******************************************************************************
* Function Name: SPIS_1_SaveConfig
********************************************************************************
*
* Summary:
*  Empty function. Included for consistency with other components.
*
* Parameters:
*  None.
*
* Return:
*  None.
*
*******************************************************************************/
void SPIS_1_SaveConfig(void) 
{

}


/*******************************************************************************
* Function Name: SPIS_1_RestoreConfig
********************************************************************************
*
* Summary:
*  Empty function. Included for consistency with other components.
*
* Parameters:
*  None.
*
* Return:
*  None.
*
*******************************************************************************/
void SPIS_1_RestoreConfig(void) 
{

}


/*******************************************************************************
* Function Name: SPIS_1_Sleep
********************************************************************************
*
* Summary:
*  Prepare SPI Slave Component goes to sleep.
*
* Parameters:
*  None.
*
* Return:
*  None.
*
* Global Variables:
*  SPIS_1_backup - modified when non-retention registers are saved.
*
* Reentrant:
*  No.
*
*******************************************************************************/
void SPIS_1_Sleep(void) 
{
    /* Save components enable state */
    if ((SPIS_1_TX_STATUS_ACTL_REG & SPIS_1_INT_ENABLE) != 0u)
    {
        SPIS_1_backup.enableState = 1u;
    }
    else /* Components block is disabled */
    {
        SPIS_1_backup.enableState = 0u;
    }

    SPIS_1_Stop();

}


/*******************************************************************************
* Function Name: SPIS_1_Wakeup
********************************************************************************
*
* Summary:
*  Prepare SPIM Component to wake up.
*
* Parameters:
*  None.
*
* Return:
*  None.
*
* Global Variables:
*  SPIS_1_backup - used when non-retention registers are restored.
*  SPIS_1_txBufferWrite - modified every function call - resets to
*  zero.
*  SPIS_1_txBufferRead - modified every function call - resets to
*  zero.
*  SPIS_1_rxBufferWrite - modified every function call - resets to
*  zero.
*  SPIS_1_rxBufferRead - modified every function call - resets to
*  zero.
*
* Reentrant:
*  No.
*
*******************************************************************************/
void SPIS_1_Wakeup(void) 
{
    #if (SPIS_1_TX_SOFTWARE_BUF_ENABLED)
        SPIS_1_txBufferFull = 0u;
        SPIS_1_txBufferRead = 0u;
        SPIS_1_txBufferWrite = 0u;
    #endif /* SPIS_1_TX_SOFTWARE_BUF_ENABLED */

    #if (SPIS_1_RX_SOFTWARE_BUF_ENABLED)
        SPIS_1_rxBufferFull = 0u;
        SPIS_1_rxBufferRead = 0u;
        SPIS_1_rxBufferWrite = 0u;
    #endif /* SPIS_1_RX_SOFTWARE_BUF_ENABLED */

    SPIS_1_ClearFIFO();

    /* Restore components block enable state */
    if (SPIS_1_backup.enableState != 0u)
    {
         /* Components block was enabled */
         SPIS_1_Enable();
    } /* Do nothing if components block was disabled */
}


/* [] END OF FILE */
