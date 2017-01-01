/*******************************************************************************
* File Name: SPI_INT.c
* Version 2.70
*
* Description:
*  This file provides all Interrupt Service Routine (ISR) for the SPI Slave
*  component.
*
* Note:
*  None.
*
********************************************************************************
* Copyright 2008-2015, Cypress Semiconductor Corporation.  All rights reserved.
* You may use this file only in accordance with the license, terms, conditions,
* disclaimers, and limitations in the end user license agreement accompanying
* the software package with which this file was provided.
*******************************************************************************/

#include "SPI_PVT.h"
#include "cyapicallbacks.h"

/* User code required at start of ISR */
/* `#START SPI_ISR_START_DEF` */

/* `#END` */


/*******************************************************************************
* Function Name: SPI_TX_ISR
*
* Summary:
*  Interrupt Service Routine for TX portion of the SPI Slave.
*
* Parameters:
*  None.
*
* Return:
*  None.
*
* Global variables:
*  SPI_txBufferWrite - used for the account of the bytes which
*  have been written down in the TX software buffer.
*  SPI_txBufferRead - used for the account of the bytes which
*  have been read from the TX software buffer, modified when exist data to
*  sending and FIFO Not Full.
*  SPI_txBuffer[SPI_TX_BUFFER_SIZE] - used to store
*  data to sending.
*  All described above Global variables are used when Software Buffer is used.
*
*******************************************************************************/
CY_ISR(SPI_TX_ISR)
{

    #if(SPI_TX_SOFTWARE_BUF_ENABLED)
        uint8 tmpStatus;
    #endif /* (SPI_TX_SOFTWARE_BUF_ENABLED) */

    #ifdef SPI_TX_ISR_ENTRY_CALLBACK
        SPI_TX_ISR_EntryCallback();
    #endif /* SPI_TX_ISR_ENTRY_CALLBACK */

    /* User code required at start of ISR */
    /* `#START SPI_ISR_TX_START` */

    /* `#END` */

    #if(SPI_TX_SOFTWARE_BUF_ENABLED)
        /* Component interrupt service code */

        /* See if TX data buffer is not empty and there is space in TX FIFO */
        while(SPI_txBufferRead != SPI_txBufferWrite)
        {
            tmpStatus = SPI_GET_STATUS_TX(SPI_swStatusTx);
            SPI_swStatusTx = tmpStatus;

            if ((SPI_swStatusTx & SPI_STS_TX_FIFO_NOT_FULL) != 0u)
            {
                if(SPI_txBufferFull == 0u)
                {
                   SPI_txBufferRead++;

                    if(SPI_txBufferRead >= SPI_TX_BUFFER_SIZE)
                    {
                        SPI_txBufferRead = 0u;
                    }
                }
                else
                {
                    SPI_txBufferFull = 0u;
                }

                /* Put data element into the TX FIFO */
                CY_SET_REG8(SPI_TXDATA_PTR, 
                                             SPI_txBuffer[SPI_txBufferRead]);
            }
            else
            {
                break;
            }
        }

        /* If Buffer is empty then disable TX FIFO status interrupt until there is data in the buffer */
        if(SPI_txBufferRead == SPI_txBufferWrite)
        {
            SPI_TX_STATUS_MASK_REG &= ((uint8)~SPI_STS_TX_FIFO_NOT_FULL);
        }

    #endif /* SPI_TX_SOFTWARE_BUF_ENABLED */

    /* User code required at end of ISR (Optional) */
    /* `#START SPI_ISR_TX_END` */

    /* `#END` */
    
    #ifdef SPI_TX_ISR_EXIT_CALLBACK
        SPI_TX_ISR_ExitCallback();
    #endif /* SPI_TX_ISR_EXIT_CALLBACK */
   }


/*******************************************************************************
* Function Name: SPI_RX_ISR
*
* Summary:
*  Interrupt Service Routine for RX portion of the SPI Slave.
*
* Parameters:
*  None.
*
* Return:
*  None.
*
* Global variables:
*  SPI_rxBufferWrite - used for the account of the bytes which
*  have been written down in the RX software buffer modified when FIFO contains
*  new data.
*  SPI_rxBufferRead - used for the account of the bytes which
*  have been read from the RX software buffer, modified when overflow occurred.
*  SPI_rxBuffer[SPI_RX_BUFFER_SIZE] - used to store
*  received data, modified when FIFO contains new data.
*  All described above Global variables are used when Software Buffer is used.
*
*******************************************************************************/
CY_ISR(SPI_RX_ISR)
{
    #if(SPI_RX_SOFTWARE_BUF_ENABLED)
        uint8 tmpStatus;
        uint8 rxData;
    #endif /* (SPI_TX_SOFTWARE_BUF_ENABLED) */

    #ifdef SPI_RX_ISR_ENTRY_CALLBACK
        SPI_RX_ISR_EntryCallback();
    #endif /* SPI_RX_ISR_ENTRY_CALLBACK */

    /* User code required at start of ISR */
    /* `#START SPI_RX_ISR_START` */

    /* `#END` */
    
    #if(SPI_RX_SOFTWARE_BUF_ENABLED)
        tmpStatus = SPI_GET_STATUS_RX(SPI_swStatusRx);
        SPI_swStatusRx = tmpStatus;
        /* See if RX data FIFO has some data and if it can be moved to the RX Buffer */
        while((SPI_swStatusRx & SPI_STS_RX_FIFO_NOT_EMPTY) != 0u)
        {
            rxData = CY_GET_REG8(SPI_RXDATA_PTR);

            /* Set next pointer. */
            SPI_rxBufferWrite++;
            if(SPI_rxBufferWrite >= SPI_RX_BUFFER_SIZE)
            {
                SPI_rxBufferWrite = 0u;
            }

            if(SPI_rxBufferWrite == SPI_rxBufferRead)
            {
                SPI_rxBufferRead++;
                if(SPI_rxBufferRead >= SPI_RX_BUFFER_SIZE)
                {
                    SPI_rxBufferRead = 0u;
                }
                SPI_rxBufferFull = 1u;
            }

            /* Move data from the FIFO to the Buffer */
            SPI_rxBuffer[SPI_rxBufferWrite] = rxData;

            tmpStatus = SPI_GET_STATUS_RX(SPI_swStatusRx);
            SPI_swStatusRx = tmpStatus;
        }
    #endif /* SPI_RX_SOFTWARE_BUF_ENABLED */

    /* User code required at end of ISR (Optional) */
    /* `#START SPI_RX_ISR_END` */

    /* `#END` */

    #ifdef SPI_RX_ISR_EXIT_CALLBACK
        SPI_RX_ISR_ExitCallback();
    #endif /* SPI_RX_ISR_EXIT_CALLBACK */
}

/* [] END OF FILE */
