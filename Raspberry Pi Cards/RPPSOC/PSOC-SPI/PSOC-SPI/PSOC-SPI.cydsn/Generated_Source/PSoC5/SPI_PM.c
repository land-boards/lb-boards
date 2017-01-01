/*******************************************************************************
* File Name: SPI_PM.c
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

#include "SPI_PVT.h"

static SPI_BACKUP_STRUCT SPI_backup = 
{
    SPI_DISABLED,
    SPI_BITCTR_INIT,
};


/*******************************************************************************
* Function Name: SPI_SaveConfig
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
void SPI_SaveConfig(void) 
{

}


/*******************************************************************************
* Function Name: SPI_RestoreConfig
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
void SPI_RestoreConfig(void) 
{

}


/*******************************************************************************
* Function Name: SPI_Sleep
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
*  SPI_backup - modified when non-retention registers are saved.
*
* Reentrant:
*  No.
*
*******************************************************************************/
void SPI_Sleep(void) 
{
    /* Save components enable state */
    if ((SPI_TX_STATUS_ACTL_REG & SPI_INT_ENABLE) != 0u)
    {
        SPI_backup.enableState = 1u;
    }
    else /* Components block is disabled */
    {
        SPI_backup.enableState = 0u;
    }

    SPI_Stop();

}


/*******************************************************************************
* Function Name: SPI_Wakeup
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
*  SPI_backup - used when non-retention registers are restored.
*  SPI_txBufferWrite - modified every function call - resets to
*  zero.
*  SPI_txBufferRead - modified every function call - resets to
*  zero.
*  SPI_rxBufferWrite - modified every function call - resets to
*  zero.
*  SPI_rxBufferRead - modified every function call - resets to
*  zero.
*
* Reentrant:
*  No.
*
*******************************************************************************/
void SPI_Wakeup(void) 
{
    #if (SPI_TX_SOFTWARE_BUF_ENABLED)
        SPI_txBufferFull = 0u;
        SPI_txBufferRead = 0u;
        SPI_txBufferWrite = 0u;
    #endif /* SPI_TX_SOFTWARE_BUF_ENABLED */

    #if (SPI_RX_SOFTWARE_BUF_ENABLED)
        SPI_rxBufferFull = 0u;
        SPI_rxBufferRead = 0u;
        SPI_rxBufferWrite = 0u;
    #endif /* SPI_RX_SOFTWARE_BUF_ENABLED */

    SPI_ClearFIFO();

    /* Restore components block enable state */
    if (SPI_backup.enableState != 0u)
    {
         /* Components block was enabled */
         SPI_Enable();
    } /* Do nothing if components block was disabled */
}


/* [] END OF FILE */
