/*******************************************************************************
* File Name: SPIS_1.c
* Version 2.70
*
* Description:
*  This file provides all API functionality of the SPI Slave component.
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

#include "SPIS_1_PVT.h"

#if (SPIS_1_TX_SOFTWARE_BUF_ENABLED)

    volatile uint8 SPIS_1_txBuffer[SPIS_1_TX_BUFFER_SIZE];
    volatile uint8 SPIS_1_txBufferRead;
    volatile uint8 SPIS_1_txBufferWrite;
    volatile uint8 SPIS_1_txBufferFull;

#endif /* SPIS_1_TX_SOFTWARE_BUF_ENABLED*/

#if (SPIS_1_RX_SOFTWARE_BUF_ENABLED)

    volatile uint8 SPIS_1_rxBuffer[SPIS_1_RX_BUFFER_SIZE];
    volatile uint8 SPIS_1_rxBufferRead;
    volatile uint8 SPIS_1_rxBufferWrite;
    volatile uint8 SPIS_1_rxBufferFull;

#endif /* SPIS_1_RX_SOFTWARE_BUF_ENABLED */

uint8 SPIS_1_initVar = 0u;

volatile uint8 SPIS_1_swStatusTx;
volatile uint8 SPIS_1_swStatusRx;


/*******************************************************************************
* Function Name: SPIS_1_Init
********************************************************************************
*
* Summary:
*  Inits/Restores default SPIS configuration provided with customizer.
*
* Parameters:
*  None.
*
* Return:
*  None.
*
* Side Effects:
*  When this function is called it initializes all of the necessary parameters
*  for execution. i.e. setting the initial interrupt mask, configuring the
*  interrupt service routine, configuring the bit-counter parameters and
*  clearing the FIFO and Status Register.
*
* Reentrant:
*  No.
*
*******************************************************************************/
void SPIS_1_Init(void) 
{
    /*Initialize the Bit counter */
    SPIS_1_COUNTER_PERIOD_REG = SPIS_1_BITCTR_INIT;

    /* ISR initialization */
    #if(SPIS_1_INTERNAL_TX_INT_ENABLED)

        CyIntDisable(SPIS_1_TX_ISR_NUMBER);

        /* Set the ISR to point to the SPIS_1_isr Interrupt. */
        (void)CyIntSetVector(SPIS_1_TX_ISR_NUMBER, &SPIS_1_TX_ISR);

        /* Set the priority. */
        CyIntSetPriority(SPIS_1_TX_ISR_NUMBER, SPIS_1_TX_ISR_PRIORITY);

    #endif /* SPIS_1_INTERNAL_TX_INT_ENABLED */

    #if(SPIS_1_INTERNAL_RX_INT_ENABLED)

        CyIntDisable(SPIS_1_RX_ISR_NUMBER);

        /* Set the ISR to point to the SPIS_1_isr Interrupt. */
        (void)CyIntSetVector(SPIS_1_RX_ISR_NUMBER, &SPIS_1_RX_ISR);

        /* Set the priority. */
        CyIntSetPriority(SPIS_1_RX_ISR_NUMBER, SPIS_1_RX_ISR_PRIORITY);

    #endif /* SPIS_1_INTERNAL_RX_INT_ENABLED */

    /* Clear any stray data from the RX and TX FIFO */
    SPIS_1_ClearFIFO();

    #if(SPIS_1_RX_SOFTWARE_BUF_ENABLED)
        SPIS_1_rxBufferFull = 0u;
        SPIS_1_rxBufferRead = 0u;
        SPIS_1_rxBufferWrite = 0u;
    #endif /* SPIS_1_RX_SOFTWARE_BUF_ENABLED */

    #if(SPIS_1_TX_SOFTWARE_BUF_ENABLED)
        SPIS_1_txBufferFull = 0u;
        SPIS_1_txBufferRead = 0u;
        SPIS_1_txBufferWrite = 0u;
    #endif /* SPIS_1_TX_SOFTWARE_BUF_ENABLED */

    (void) SPIS_1_ReadTxStatus(); /* Clear any pending status bits */
    (void) SPIS_1_ReadRxStatus(); /* Clear any pending status bits */


    /* Configure the Initial interrupt mask */
    #if (SPIS_1_TX_SOFTWARE_BUF_ENABLED)
        SPIS_1_TX_STATUS_MASK_REG  = (SPIS_1_TX_INIT_INTERRUPTS_MASK &
                                                (uint8)~SPIS_1_STS_TX_FIFO_NOT_FULL);
    #else /* SPIS_1_TX_SOFTWARE_BUF_ENABLED */
        SPIS_1_TX_STATUS_MASK_REG  = SPIS_1_TX_INIT_INTERRUPTS_MASK;
    #endif /* SPIS_1_TX_SOFTWARE_BUF_ENABLED */

    SPIS_1_RX_STATUS_MASK_REG  = SPIS_1_RX_INIT_INTERRUPTS_MASK;
}


/*******************************************************************************
* Function Name: SPIS_1_Enable
********************************************************************************
*
* Summary:
*  Enable SPIS component.
*
* Parameters:
*  None.
*
* Return:
*  None.
*
*******************************************************************************/
void SPIS_1_Enable(void) 
{
    uint8 enableInterrupts;
    enableInterrupts = CyEnterCriticalSection();

    SPIS_1_COUNTER_CONTROL_REG |= SPIS_1_CNTR_ENABLE;
    SPIS_1_TX_STATUS_ACTL_REG |= SPIS_1_INT_ENABLE;
    SPIS_1_RX_STATUS_ACTL_REG |= SPIS_1_INT_ENABLE;

    CyExitCriticalSection(enableInterrupts);

    #if(SPIS_1_INTERNAL_TX_INT_ENABLED)
        CyIntEnable(SPIS_1_TX_ISR_NUMBER);
    #endif /* SPIS_1_INTERNAL_TX_INT_ENABLED */

    #if(SPIS_1_INTERNAL_RX_INT_ENABLED)
        CyIntEnable(SPIS_1_RX_ISR_NUMBER);
    #endif /* SPIS_1_INTERNAL_RX_INT_ENABLED */
}


/*******************************************************************************
* Function Name: SPIS_1_Start
********************************************************************************
*
* Summary:
*  Initialize and Enable the SPI Slave component.
*
* Parameters:
*  None.
*
* Return:
*  None.
*
* Global variables:
*  SPIS_1_initVar - used to check initial configuration, modified on
*  first function call.
*
* Theory:
*  Enable the clock input to enable operation.
*
* Reentrant:
*  No.
*
*******************************************************************************/
void SPIS_1_Start(void) 
{
    if(SPIS_1_initVar == 0u)
    {
        SPIS_1_Init();
        SPIS_1_initVar = 1u;
    }

    SPIS_1_Enable();
}


/*******************************************************************************
* Function Name: SPIS_1_Stop
********************************************************************************
*
* Summary:
*  Disable the SPI Slave component.
*
* Parameters:
*  None.
*
* Return:
*  None.
*
* Theory:
*  Disable the internal interrupt if one is used.
*
*******************************************************************************/
void SPIS_1_Stop(void) 
{
    uint8 enableInterrupts;
    enableInterrupts = CyEnterCriticalSection();

    SPIS_1_TX_STATUS_ACTL_REG &= (uint8)~SPIS_1_INT_ENABLE;
    SPIS_1_RX_STATUS_ACTL_REG &= (uint8)~SPIS_1_INT_ENABLE;

    CyExitCriticalSection(enableInterrupts);

    #if(SPIS_1_INTERNAL_TX_INT_ENABLED)
        CyIntDisable(SPIS_1_TX_ISR_NUMBER);
    #endif /* SPIS_1_INTERNAL_TX_INT_ENABLED */

    #if(SPIS_1_INTERNAL_RX_INT_ENABLED)
        CyIntDisable(SPIS_1_RX_ISR_NUMBER);
    #endif /* SPIS_1_INTERNAL_RX_INT_ENABLED */
}


/*******************************************************************************
* Function Name: SPIS_1_EnableTxInt
********************************************************************************
*
* Summary:
*  Enable internal Tx interrupt generation.
*
* Parameters:
*  None.
*
* Return:
*  None.
*
* Theory:
*  Enable the internal Tx interrupt output -or- the interrupt component itself.
*
*******************************************************************************/
void SPIS_1_EnableTxInt(void) 
{
    #if(SPIS_1_INTERNAL_TX_INT_ENABLED)
        CyIntEnable(SPIS_1_TX_ISR_NUMBER);
    #endif /* SPIS_1_INTERNAL_TX_INT_ENABLED */
}


/*******************************************************************************
* Function Name: SPIS_1_EnableRxInt
********************************************************************************
*
* Summary:
*  Enable internal Rx interrupt generation.
*
* Parameters:
*  None.
*
* Return:
*  None.
*
* Theory:
*  Enable the internal Rx interrupt output -or- the interrupt component itself.
*
*******************************************************************************/
void SPIS_1_EnableRxInt(void) 
{
    #if(SPIS_1_INTERNAL_RX_INT_ENABLED)
        CyIntEnable(SPIS_1_RX_ISR_NUMBER);
    #endif /* SPIS_1_INTERNAL_RX_INT_ENABLED */
}


/*******************************************************************************
* Function Name: SPIS_1_DisableTxInt
********************************************************************************
*
* Summary:
*  Disable internal Tx interrupt generation.
*
* Parameters:
*  None.
*
* Return:
*  None.
*
* Theory:
*  Disable the internal Tx interrupt output -or- the interrupt component itself.
*
*******************************************************************************/
void SPIS_1_DisableTxInt(void) 
{
    #if(SPIS_1_INTERNAL_TX_INT_ENABLED)
        CyIntDisable(SPIS_1_TX_ISR_NUMBER);
    #endif /* SPIS_1_INTERNAL_TX_INT_ENABLED */
}


/*******************************************************************************
* Function Name: SPIS_1_DisableRxInt
********************************************************************************
*
* Summary:
*  Disable internal Rx interrupt generation.
*
* Parameters:
*  None.
*
* Return:
*  None.
*
* Theory:
*  Disable the internal Rx interrupt output -or- the interrupt component itself.
*
*******************************************************************************/
void SPIS_1_DisableRxInt(void) 
{
    #if(SPIS_1_INTERNAL_RX_INT_ENABLED)
        CyIntDisable(SPIS_1_RX_ISR_NUMBER);
    #endif /* SPIS_1_INTERNAL_RX_INT_ENABLED */
}


/*******************************************************************************
* Function Name: SPIS_1_SetTxInterruptMode
********************************************************************************
*
* Summary:
*  Configure which status bits trigger an interrupt event.
*
* Parameters:
*  intSrc: An or'd combination of the desired status bit masks (defined in the
*  header file).
*
* Return:
*  None.
*
* Theory:
*  Enables the output of specific status bits to the interrupt controller.
*
*******************************************************************************/
void SPIS_1_SetTxInterruptMode(uint8 intSrc) 
{
    SPIS_1_TX_STATUS_MASK_REG  = intSrc;
}


/*******************************************************************************
* Function Name: SPIS_1_SetRxInterruptMode
********************************************************************************
*
* Summary:
*  Configure which status bits trigger an interrupt event.
*
* Parameters:
*  intSrc: An or'd combination of the desired status bit masks (defined in the
*  header file).
*
* Return:
*  None.
*
* Theory:
*  Enables the output of specific status bits to the interrupt controller.
*
*******************************************************************************/
void SPIS_1_SetRxInterruptMode(uint8 intSrc) 
{
    SPIS_1_RX_STATUS_MASK_REG  = intSrc;
}


/*******************************************************************************
* Function Name: SPIS_1_ReadTxStatus
********************************************************************************
*
* Summary:
*  Read the Tx status register for the component.
*
* Parameters:
*  None.
*
* Return:
*  Contents of the Tx status register.
*
* Global variables:
*  SPIS_1_swStatusTx - used to store in software status register,
*  modified every function call - resets to zero.
*
* Theory:
*  Allows the user and the API to read the Tx status register for error
*  detection and flow control.
*
* Side Effects:
*  Clear Tx status register of the component.
*
* Reentrant:
*  No.
*
*******************************************************************************/
uint8 SPIS_1_ReadTxStatus(void) 
{
    uint8 tmpStatus;

    #if (SPIS_1_TX_SOFTWARE_BUF_ENABLED)

        SPIS_1_DisableTxInt();

        tmpStatus = SPIS_1_GET_STATUS_TX(SPIS_1_swStatusTx);

        SPIS_1_swStatusTx = 0u;

        /* Enable Interrupts */
        SPIS_1_EnableTxInt();

    #else /* !SPIS_1_TX_SOFTWARE_BUF_ENABLED */

        tmpStatus = SPIS_1_TX_STATUS_REG;

    #endif /* SPIS_1_TX_SOFTWARE_BUF_ENABLED */

    return(tmpStatus);
}


/*******************************************************************************
* Function Name: SPIS_1_ReadRxStatus
********************************************************************************
*
* Summary:
*  Read the Rx status register for the component.
*
* Parameters:
*  None.
*
* Return:
*  Contents of the Rx status register.
*
* Global variables:
*  SPIS_1_swStatusRx - used to store in software Rx status register,
*  modified every function call - resets to zero.
*
* Theory:
*  Allows the user and the API to read the Rx status register for error
*  detection and flow control.
*
* Side Effects:
*  Clear Rx status register of the component.
*
* Reentrant:
*  No.
*
*******************************************************************************/
uint8 SPIS_1_ReadRxStatus(void) 
{
    uint8 tmpStatus;

    #if (SPIS_1_RX_SOFTWARE_BUF_ENABLED)

        SPIS_1_DisableRxInt();

        tmpStatus = SPIS_1_GET_STATUS_RX(SPIS_1_swStatusRx);

        SPIS_1_swStatusRx = 0u;

        /* Enable Interrupts */
        SPIS_1_EnableRxInt();

    #else /* !SPIS_1_RX_SOFTWARE_BUF_ENABLED */

        tmpStatus = SPIS_1_RX_STATUS_REG;

    #endif /* SPIS_1_RX_SOFTWARE_BUF_ENABLED */

    return(tmpStatus);
}


/*******************************************************************************
* Function Name: SPIS_1_WriteTxData
********************************************************************************
*
* Summary:
*  Write a byte of data to be sent across the SPI.
*
* Parameters:
*  txDataByte: The data value to send across the SPI.
*
* Return:
*  None.
*
* Global variables:
*  SPIS_1_txBufferWrite - used for the account of the bytes which
*  have been written down in the TX software buffer, modified every function
*  call if TX Software Buffer is used.
*  SPIS_1_txBufferRead - used for the account of the bytes which
*  have been read from the TX software buffer.
*  SPIS_1_txBuffer[SPIS_1_TX_BUFFER_SIZE] - used to store
*  data to sending, modified every function call if TX Software Buffer is used.
*
* Theory:
*  Allows the user to transmit any byte of data in a single transfer.
*
* Side Effects:
*  If this function is called again before the previous byte is finished then
*  the next byte will be appended to the transfer with no time between
*  the byte transfers. Clear Tx status register of the component.
*
* Reentrant:
*  No.
*
*******************************************************************************/
void SPIS_1_WriteTxData(uint8 txData) 
{
    #if(SPIS_1_TX_SOFTWARE_BUF_ENABLED)

        uint8 tempStatus;
        uint8 tmpTxBufferRead;

        /* Block if buffer is full, so we don't overwrite. */
        do
        {
            tmpTxBufferRead = SPIS_1_txBufferRead;
            if (0u == tmpTxBufferRead)
            {
                tmpTxBufferRead = SPIS_1_TX_BUFFER_SIZE - 1u;
            }
            else
            {
                tmpTxBufferRead--;
            }

        }
        while(tmpTxBufferRead == SPIS_1_txBufferWrite);

        /* Disable Interrupt to protect variables that could change on interrupt. */
        SPIS_1_DisableTxInt();

        tempStatus = SPIS_1_GET_STATUS_TX(SPIS_1_swStatusTx);
        SPIS_1_swStatusTx = tempStatus;

        if((SPIS_1_txBufferRead == SPIS_1_txBufferWrite) &&
            (0u != (SPIS_1_swStatusTx & SPIS_1_STS_TX_FIFO_NOT_FULL)))
        {
            /* Put data element into the TX FIFO */
            CY_SET_REG8(SPIS_1_TXDATA_PTR, txData);
        }
        else
        {
            /* Put data element into the software buffer */
            SPIS_1_txBufferWrite++;
            if(SPIS_1_txBufferWrite >= SPIS_1_TX_BUFFER_SIZE)
            {
                SPIS_1_txBufferWrite = 0u;
            }

            if(SPIS_1_txBufferWrite == SPIS_1_txBufferRead)
            {
                SPIS_1_txBufferRead++;
                if(SPIS_1_txBufferRead >= SPIS_1_RX_BUFFER_SIZE)
                {
                    SPIS_1_txBufferRead = 0u;
                }
                SPIS_1_txBufferFull = 1u;
            }

            SPIS_1_txBuffer[SPIS_1_txBufferWrite] = txData;

            SPIS_1_TX_STATUS_MASK_REG |= SPIS_1_STS_TX_FIFO_NOT_FULL;
        }

        /* Enable Interrupt. */
        SPIS_1_EnableTxInt();

    #else /* !SPIS_1_TX_SOFTWARE_BUF_ENABLED */
        /* Wait until TX FIFO has a place */
        while(0u == (SPIS_1_TX_STATUS_REG & SPIS_1_STS_TX_FIFO_NOT_FULL))
        {
        }

        /* Put data element into the TX FIFO */
        CY_SET_REG8(SPIS_1_TXDATA_PTR, txData);
        
    #endif /* SPIS_1_TX_SOFTWARE_BUF_ENABLED */
}

#if(SPIS_1_MODE_USE_ZERO != 0u)

    /*******************************************************************************
    * Function Name: SPIS_1_WriteTxDataZero
    ********************************************************************************
    *
    * Summary:
    *  Write a byte zero of data to be sent across the SPI. This must be used in
    *  Mode 00 and 01 if the FIFO is empty and data is not being sent.
    *
    * Parameters:
    *  txDataByte: The data value to send across the SPI.
    *
    * Return:
    *  None.
    *
    * Theory:
    *  Allows the user to transmit any byte of data in a single transfer. Clear
    *  status register of the component.
    *
    *******************************************************************************/
    void SPIS_1_WriteTxDataZero(uint8 txDataByte)
                                        
    {
        CY_SET_REG8(SPIS_1_TXDATA_ZERO_PTR, txDataByte);
    }

#endif /* (SPIS_1_MODE_USE_ZERO != 0u) */


/*******************************************************************************
* Function Name: SPIS_1_ReadRxData
********************************************************************************
*
* Summary:
*  Read the next byte of data received across the SPI.
*
* Parameters:
*  None.
*
* Return:
*  The next byte of data read from the FIFO.
*
* Global variables:
*  SPIS_1_rxBufferWrite - used for the account of the bytes which
*  have been written down in the RX software buffer.
*  SPIS_1_rxBufferRead - used for the account of the bytes which
*  have been read from the RX software buffer, modified every function
*  call if RX Software Buffer is used.
*  SPIS_1_rxBuffer[SPIS_1_RX_BUFFER_SIZE] - used to store
*  received data.
*
* Theory:
*  Allows the user to read a byte of data received.
*
* Side Effects:
*  Will return invalid data if the FIFO is empty.  User should poll for FIFO
*  empty status before calling Read function.
*
* Reentrant:
*  No.
*
*******************************************************************************/
uint8 SPIS_1_ReadRxData(void) 
{
    uint8 rxData;

    #if(SPIS_1_RX_SOFTWARE_BUF_ENABLED)

        /* Disable Interrupt to protect variables that could change on interrupt. */
        SPIS_1_DisableRxInt();

        if(SPIS_1_rxBufferRead != SPIS_1_rxBufferWrite)
        {
            if(SPIS_1_rxBufferFull == 0u)
            {
                SPIS_1_rxBufferRead++;
                if(SPIS_1_rxBufferRead >= SPIS_1_RX_BUFFER_SIZE)
                {
                    SPIS_1_rxBufferRead = 0u;
                }
            }
            else
            {
                SPIS_1_rxBufferFull = 0u;
            }
        }

        rxData = SPIS_1_rxBuffer[SPIS_1_rxBufferRead];

        /* Enable Interrupt. */
        SPIS_1_EnableRxInt();

    #else /* !SPIS_1_RX_SOFTWARE_BUF_ENABLED */

        rxData = CY_GET_REG8(SPIS_1_RXDATA_PTR);

    #endif /* SPIS_1_RX_SOFTWARE_BUF_ENABLED */

    return (rxData);

}


/*******************************************************************************
* Function Name: SPIS_1_GetRxBufferSize
********************************************************************************
*
* Summary:
*  Returns the number of bytes/words of data currently held in the RX buffer.
*  If RX Software Buffer not used then function return 0 if FIFO empty or 1 if
*  FIFO not empty. In another case function return size of RX Software Buffer.
*
* Parameters:
*  None.
*
* Return:
*  Integer count of the number of bytes/words in the RX buffer.
*
* Global variables:
*  SPIS_1_rxBufferWrite - used for the account of the bytes which
*  have been written down in the RX software buffer.
*  SPIS_1_rxBufferRead - used for the account of the bytes which
*  have been read from the RX software buffer.
*
* Theory:
*  Allows the user to find out how full the RX Buffer is.
*
*******************************************************************************/
uint8 SPIS_1_GetRxBufferSize(void) 
{
    uint8 size;

    #if(SPIS_1_RX_SOFTWARE_BUF_ENABLED)

        /* Disable Interrupt to protect variables that could change on interrupt. */
        SPIS_1_DisableRxInt();

        if(SPIS_1_rxBufferRead == SPIS_1_rxBufferWrite)
        {
            size = 0u; /* No data in RX buffer */
        }
        else if(SPIS_1_rxBufferRead < SPIS_1_rxBufferWrite)
        {
            size = (SPIS_1_rxBufferWrite - SPIS_1_rxBufferRead);
        }
        else
        {
            size = (SPIS_1_RX_BUFFER_SIZE - SPIS_1_rxBufferRead) + SPIS_1_rxBufferWrite;
        }

        /* Enable interrupt. */
        SPIS_1_EnableRxInt();

    #else /* !SPIS_1_RX_SOFTWARE_BUF_ENABLED*/

        /* We can only know if there is data in the fifo. */
        size = ((SPIS_1_RX_STATUS_REG & SPIS_1_STS_RX_FIFO_NOT_EMPTY) != 0u) ? 1u : 0u;

    #endif /* SPIS_1_RX_SOFTWARE_BUF_ENABLED */

    return (size);
}


/*******************************************************************************
* Function Name: SPIS_1_GetTxBufferSize
********************************************************************************
*
* Summary:
*  Returns the number of bytes/words of data currently held in the TX buffer.
*  If TX Software Buffer not used then function return 0 - if FIFO empty, 1 - if
*  FIFO not full, 4 - if FIFO full. In another case function return size of TX
*  Software Buffer.
*
* Parameters:
*  None.
*
* Return:
*  Integer count of the number of bytes/words in the TX buffer.
*
* Global variables:
*  SPIS_1_txBufferWrite - used for the account of the bytes which
*  have been written down in the TX software buffer.
*  SPIS_1_txBufferRead - used for the account of the bytes which
*  have been read from the TX software buffer.
*
* Theory:
*  Allows the user to find out how full the TX Buffer is.
*
* Side Effects:
*  Clear status register of the component.
*
*******************************************************************************/
uint8  SPIS_1_GetTxBufferSize(void) 
{
    uint8 size;

    #if(SPIS_1_TX_SOFTWARE_BUF_ENABLED)

        /* Disable Interrupt to protect variables that could change on interrupt. */
        SPIS_1_DisableTxInt();

        if(SPIS_1_txBufferRead == SPIS_1_txBufferWrite)
        {
            size = 0u;
        }
        else if(SPIS_1_txBufferRead < SPIS_1_txBufferWrite)
        {
            size = (SPIS_1_txBufferWrite - SPIS_1_txBufferRead);
        }
        else
        {
            size = (SPIS_1_TX_BUFFER_SIZE - SPIS_1_txBufferRead) + SPIS_1_txBufferWrite;
        }

        /* Enable Interrupt. */
        SPIS_1_EnableTxInt();

    #else /* !SPIS_1_TX_SOFTWARE_BUF_ENABLED */

        size = SPIS_1_TX_STATUS_REG;

        /* Is the fifo is full. */
        if((size & SPIS_1_STS_TX_FIFO_EMPTY) != 0u)
        {
            size = 0u;
        }
        else if((size & SPIS_1_STS_TX_FIFO_NOT_FULL) != 0u)
        {
            size = 1u;
        }
        else
        {
            size = 4u;
        }

    #endif /* SPIS_1_TX_SOFTWARE_BUF_ENABLED */

    return (size);
}


/*******************************************************************************
* Function Name: SPIS_1_ClearRxBuffer
********************************************************************************
*
* Summary:
*  Clear the RX RAM buffer by setting the read and write pointers both to zero.
*
* Parameters:
*  None.
*
* Return:
*  None.
*
* Global variables:
*  SPIS_1_rxBufferWrite - used for the account of the bytes which
*  have been written down in the RX software buffer, modified every function
*  call - resets to zero.
*  SPIS_1_rxBufferRead - used for the account of the bytes which
*  have been read from the RX software buffer, modified every function call -
*  resets to zero.
*
* Theory:
*  Setting the pointers to zero makes the system believe there is no data to
*  read and writing will resume at address 0 overwriting any data that may have
*  remained in the RAM.
*
* Side Effects:
*  Any received data not read from the RAM buffer will be lost when overwritten.
*
* Reentrant:
*  No.
*
*******************************************************************************/
void SPIS_1_ClearRxBuffer(void) 
{
    /* Clear Hardware RX FIFO */
    while((SPIS_1_RX_STATUS_REG & SPIS_1_STS_RX_FIFO_NOT_EMPTY) != 0u)
    {
        CY_GET_REG8(SPIS_1_RXDATA_PTR);
    }

    #if(SPIS_1_RX_SOFTWARE_BUF_ENABLED)

        /* Disable interrupt to protect variables that could change on interrupt. */
        SPIS_1_DisableRxInt();

        SPIS_1_rxBufferRead  = 0u;
        SPIS_1_rxBufferWrite = 0u;
		SPIS_1_rxBufferFull  = 0u;
        /* Enable interrupt. */
        SPIS_1_EnableRxInt();

    #endif /* SPIS_1_RX_SOFTWARE_BUF_ENABLED */
}


/*******************************************************************************
* Function Name: SPIS_1_ClearTxBuffer
********************************************************************************
*
* Summary:
*  Clear the TX RAM buffer by setting the read and write pointers both to zero.
*
* Parameters:
*  None.
*
* Return:
*  None.
*
* Global variables:
*  SPIS_1_txBufferWrite - used for the account of the bytes which
*  have been written down in the TX software buffer, modified every function
*  call - resets to zero.
*  SPIS_1_txBufferRead - used for the account of the bytes which
*  have been read from the TX software buffer, modified every function call -
*  resets to zero.
*
* Theory:
*  Setting the pointers to zero makes the system believe there is no data to
*  read and writing will resume at address 0 overwriting any data that may have
*  remained in the RAM.
*
* Side Effects:
*  Any data not yet transmitted from the RAM buffer will be lost when
*  overwritten.
*
* Reentrant:
*  No.
*
*******************************************************************************/
void SPIS_1_ClearTxBuffer(void) 
{
    uint8 enableInterrupts;

    /* Clear Hardware TX FIFO */
    enableInterrupts = CyEnterCriticalSection();

    #if(SPIS_1_DATA_WIDTH <= 8u)

        /* Clear TX FIFO */
        SPIS_1_TX_AUX_CONTROL_DP0_REG |= (uint8)SPIS_1_FIFO_CLR;
        SPIS_1_TX_AUX_CONTROL_DP0_REG &= (uint8)~SPIS_1_FIFO_CLR;

    #else

        /* Clear TX FIFO */
        SPIS_1_TX_AUX_CONTROL_DP0_REG |= (uint8)SPIS_1_FIFO_CLR;
        SPIS_1_TX_AUX_CONTROL_DP0_REG &= (uint8)~SPIS_1_FIFO_CLR;
        SPIS_1_TX_AUX_CONTROL_DP1_REG |= (uint8)SPIS_1_FIFO_CLR;
        SPIS_1_TX_AUX_CONTROL_DP1_REG &= (uint8)~SPIS_1_FIFO_CLR;

    #endif /* SPIS_1_DATA_WIDTH > 8u */

    CyExitCriticalSection(enableInterrupts);

    #if(SPIS_1_TX_SOFTWARE_BUF_ENABLED)

        /* Disable Interrupt to protect variables that could change on interrupt. */
        SPIS_1_DisableTxInt();

        SPIS_1_txBufferRead  = 0u;
        SPIS_1_txBufferWrite = 0u;
		SPIS_1_txBufferFull  = 0u;
		
        /* If Buffer is empty then disable TX FIFO status interrupt */
        SPIS_1_TX_STATUS_MASK_REG &= (uint8)~SPIS_1_STS_TX_FIFO_NOT_FULL;

        /* Enable Interrupt. */
        SPIS_1_EnableTxInt();

    #endif /* SPIS_1_TX_SOFTWARE_BUF_ENABLED */
}


#if (SPIS_1_BIDIRECTIONAL_MODE != 0u)

    /*******************************************************************************
    * Function Name: SPIS_1_TxEnable
    ********************************************************************************
    *
    * Summary:
    *  If the SPI Slave is configured to use a single bi-directional pin then this
    *  will set the bi-directional pin to transmit.
    *
    * Parameters:
    *  None.
    *
    * Return:
    *  None.
    *
    *******************************************************************************/
    void SPIS_1_TxEnable(void) 
    {
            SPIS_1_CONTROL_REG |= SPIS_1_CTRL_TX_SIGNAL_EN;
    }


    /*******************************************************************************
    * Function Name: SPIS_1_TxDisable
    ********************************************************************************
    *
    * Summary:
    *  If the SPI Slave is configured to use a single bi-directional pin then this
    *  will set the bi-directional pin to receive.
    *
    * Parameters:
    *  None.
    *
    * Return:
    *  None.
    *
    *******************************************************************************/
    void SPIS_1_TxDisable(void) 
    {
            SPIS_1_CONTROL_REG &= (uint8)~SPIS_1_CTRL_TX_SIGNAL_EN;
    }

#endif /* SPIS_1_BIDIRECTIONAL_MODE != 0u */


/*******************************************************************************
* Function Name: SPIS_1_PutArray
********************************************************************************
*
* Summary:
*  Write available data from RAM/ROM to the TX buffer while space is available
*  in the TX buffer. Keep trying until all data is passed to the TX buffer. If
*  used Mode 00 or 01 before PutArray() function should be called
*  WriteTxDataZero() function.
*
* Parameters:
*  *buffer: Pointer to the location in RAM containing the data to send
*  byteCount: The number of bytes to move to the transmit buffer.
*
* Return:
*  None.
*
* Side Effects:
*  Will stay in this routine until all data has been sent.  May get locked in
*  this loop if data is not being initiated by the master if there is not
*  enough room in the TX FIFO.
*
* Reentrant:
*  No.
*
*******************************************************************************/
void SPIS_1_PutArray(const uint8 buffer[], uint8 byteCount)
                                                                    
{
    uint8 bufIndex;
    bufIndex = 0u;

    while(byteCount > 0u)
    {
        SPIS_1_WriteTxData(buffer[bufIndex]);
        bufIndex++;
        byteCount--;
    }
}


/*******************************************************************************
* Function Name: SPIS_1_ClearFIFO
********************************************************************************
*
* Summary:
*  Clear the RX and TX FIFO's of all data for a fresh start.
*
* Parameters:
*  None.
*
* Return:
*  None.
*
* Side Effects:
*  Clear status register of the component.
*
*******************************************************************************/
void SPIS_1_ClearFIFO(void) 
{
    uint8 enableInterrupts;

    while((SPIS_1_RX_STATUS_REG & SPIS_1_STS_RX_FIFO_NOT_EMPTY) != 0u)
    {
        CY_GET_REG8(SPIS_1_RXDATA_PTR);
    }

    enableInterrupts = CyEnterCriticalSection();

    #if(SPIS_1_DATA_WIDTH <= 8u)

        /* Clear TX FIFO */
        SPIS_1_TX_AUX_CONTROL_DP0_REG |= (uint8)SPIS_1_FIFO_CLR;
        SPIS_1_TX_AUX_CONTROL_DP0_REG &= (uint8)~SPIS_1_FIFO_CLR;

    #else

        /* Clear TX FIFO */
        SPIS_1_TX_AUX_CONTROL_DP0_REG |= (uint8)SPIS_1_FIFO_CLR;
        SPIS_1_TX_AUX_CONTROL_DP0_REG &= (uint8)~SPIS_1_FIFO_CLR;
        SPIS_1_TX_AUX_CONTROL_DP1_REG |= (uint8)SPIS_1_FIFO_CLR;
        SPIS_1_TX_AUX_CONTROL_DP1_REG &= (uint8)~SPIS_1_FIFO_CLR;

    #endif /* SPIS_1_DATA_WIDTH <= 8u */

    CyExitCriticalSection(enableInterrupts);
}


/* Following functions are for version Compatibility, they are obsolete.
*  Please do not use it in new projects.
*/


/*******************************************************************************
* Function Name: SPIS_1_EnableInt
********************************************************************************
*
* Summary:
*  Enable internal interrupt generation.
*
* Parameters:
*  None.
*
* Return:
*  None.
*
* Theory:
*  Enable the internal interrupt output -or- the interrupt component itself.
*
*******************************************************************************/
void SPIS_1_EnableInt(void) 
{
    #if(SPIS_1_INTERNAL_TX_INT_ENABLED)
        CyIntEnable(SPIS_1_TX_ISR_NUMBER);
    #endif /* SPIS_1_INTERNAL_TX_INT_ENABLED */

    #if(SPIS_1_INTERNAL_RX_INT_ENABLED)
        CyIntEnable(SPIS_1_RX_ISR_NUMBER);
    #endif /* SPIS_1_INTERNAL_RX_INT_ENABLED */
}


/*******************************************************************************
* Function Name: SPIS_1_DisableInt
********************************************************************************
*
* Summary:
*  Disable internal interrupt generation.
*
* Parameters:
*  None.
*
* Return:
*  None.
*
* Theory:
*  Disable the internal interrupt output -or- the interrupt component itself.
*
*******************************************************************************/
void SPIS_1_DisableInt(void) 
{
    #if(SPIS_1_INTERNAL_TX_INT_ENABLED)
        CyIntDisable(SPIS_1_TX_ISR_NUMBER);
    #endif /* SPIS_1_INTERNAL_TX_INT_ENABLED */

    #if(SPIS_1_INTERNAL_RX_INT_ENABLED)
        CyIntDisable(SPIS_1_RX_ISR_NUMBER);
    #endif /* SPIS_1_INTERNAL_RX_INT_ENABLED */
}


/*******************************************************************************
* Function Name: SPIS_1_SetInterruptMode
********************************************************************************
*
* Summary:
*  Configure which status bits trigger an interrupt event.
*
* Parameters:
*  intSrc: An or'd combination of the desired status bit masks (defined in the
*  header file).
*
* Return:
*  None.
*
* Theory:
*  Enables the output of specific status bits to the interrupt controller.
*
*******************************************************************************/
void SPIS_1_SetInterruptMode(uint8 intSrc) 
{
    SPIS_1_TX_STATUS_MASK_REG  = intSrc;
    SPIS_1_RX_STATUS_MASK_REG  = intSrc;
}


/*******************************************************************************
* Function Name: SPIS_1_ReadStatus
********************************************************************************
*
* Summary:
*  Read the status register for the component.
*
* Parameters:
*  None.
*
* Return:
*  Contents of the status register.
*
* Global variables:
*  SPIS_1_swStatus - used to store in software status register,
*  modified every function call - resets to zero.
*
* Theory:
*  Allows the user and the API to read the status register for error detection
*  and flow control.
*
* Side Effects:
*  Clear status register of the component.
*
* Reentrant:
*  No.
*
*******************************************************************************/
uint8 SPIS_1_ReadStatus(void) 
{
    uint8 tmpStatus;

    #if ((SPIS_1_TX_SOFTWARE_BUF_ENABLED) || (SPIS_1_RX_SOFTWARE_BUF_ENABLED))

        SPIS_1_DisableInt();

        tmpStatus = SPIS_1_GET_STATUS_TX(SPIS_1_swStatusTx) |
              (SPIS_1_GET_STATUS_RX(SPIS_1_swStatusRx) & (uint8)~SPIS_1_STS_RX_FIFO_FULL);

        SPIS_1_swStatusTx = 0u;
        SPIS_1_swStatusRx = 0u;

        /* Enable Interrupts */
        SPIS_1_EnableInt();

    #else /* !((SPIS_1_TX_SOFTWARE_BUF_ENABLED) || (SPIS_1_RX_SOFTWARE_BUF_ENABLED)) */

        tmpStatus = SPIS_1_TX_STATUS_REG | (SPIS_1_RX_STATUS_REG &
                                                      (uint8)~SPIS_1_STS_RX_FIFO_FULL);

    #endif /* (SPIS_1_TX_SOFTWARE_BUF_ENABLED) || (SPIS_1_RX_SOFTWARE_BUF_ENABLED) */

    return(tmpStatus);
}


/* [] END OF FILE */
