/*******************************************************************************
* File Name: .h
* Version 2.70
*
* Description:
*  This private header file contains internal definitions for the SPIS
*  component. Do not use these definitions directly in your application.
*
* Note:
*
********************************************************************************
* Copyright 2013-2015, Cypress Semiconductor Corporation. All rights reserved.
* You may use this file only in accordance with the license, terms, conditions,
* disclaimers, and limitations in the end user license agreement accompanying
* the software package with which this file was provided.
*******************************************************************************/

#if !defined(CY_SPIS_PVT_SPIS_1_H)
#define CY_SPIS_PVT_SPIS_1_H

#include "SPIS_1.h"


/**********************************
*   Functions with external linkage
**********************************/


/**********************************
*   Variables with external linkage
**********************************/
extern volatile uint8 SPIS_1_swStatusTx;
extern volatile uint8 SPIS_1_swStatusRx;

#if (SPIS_1_RX_SOFTWARE_BUF_ENABLED)

    extern volatile uint8 SPIS_1_rxBuffer[SPIS_1_RX_BUFFER_SIZE];
    extern volatile uint8 SPIS_1_rxBufferRead;
    extern volatile uint8 SPIS_1_rxBufferWrite;
    extern volatile uint8 SPIS_1_rxBufferFull;

#endif /* SPIS_1_RX_SOFTWARE_BUF_ENABLED */

#if (SPIS_1_TX_SOFTWARE_BUF_ENABLED)

    extern volatile uint8 SPIS_1_txBuffer[SPIS_1_TX_BUFFER_SIZE];
    extern volatile uint8 SPIS_1_txBufferRead;
    extern volatile uint8 SPIS_1_txBufferWrite;
    extern volatile uint8 SPIS_1_txBufferFull;

#endif /* SPIS_1_TX_SOFTWARE_BUF_ENABLED */

#endif /* CY_SPIS_PVT_SPIS_1_H */


/* [] END OF FILE */
