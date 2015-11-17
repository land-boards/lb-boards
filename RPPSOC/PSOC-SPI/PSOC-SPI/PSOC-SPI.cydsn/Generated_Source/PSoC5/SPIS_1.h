/*******************************************************************************
* File Name: SPIS_1.h
* Version 2.70
*
* Description:
*  Contains the function prototypes, constants and register definition
*  of the SPI Slave Component.
*
* Note:
*  None
*
********************************************************************************
* Copyright 2008-2015, Cypress Semiconductor Corporation. All rights reserved.
* You may use this file only in accordance with the license, terms, conditions,
* disclaimers, and limitations in the end user license agreement accompanying
* the software package with which this file was provided.
*******************************************************************************/

#if !defined(CY_SPIS_SPIS_1_H)
#define CY_SPIS_SPIS_1_H

#include "cytypes.h"
#include "CyLib.h"

/* Check to see if required defines such as CY_PSOC5A are available */
/* They are defined starting with cy_boot v3.0 */
#if !defined (CY_PSOC5A)
    #error Component SPI_Slave_v2_70 requires cy_boot v3.0 or later
#endif /* (CY_PSOC5A) */


/***************************************
*   Conditional Compilation Parameters
***************************************/

#define SPIS_1_DATA_WIDTH                  (8u)
#define SPIS_1_INTERNAL_TX_INT_ENABLED     (0u)
#define SPIS_1_INTERNAL_RX_INT_ENABLED     (0u)
#define SPIS_1_MODE_USE_ZERO               (1u)
#define SPIS_1_BIDIRECTIONAL_MODE          (0u)
#define SPIS_1_MODE                        (0u)

#define SPIS_1_FIFO_SIZE                  (4u)
/* Internal interrupt handling */
#define SPIS_1_TX_BUFFER_SIZE             (4u)
#define SPIS_1_RX_BUFFER_SIZE             (4u)
#define SPIS_1_INTERNAL_TX_INT_ENABLED    (0u)
#define SPIS_1_INTERNAL_RX_INT_ENABLED    (0u)

#define SPIS_1_TX_SOFTWARE_BUF_ENABLED    ((0u != SPIS_1_INTERNAL_TX_INT_ENABLED) && \
                                                     (SPIS_1_TX_BUFFER_SIZE > SPIS_1_FIFO_SIZE))

#define SPIS_1_RX_SOFTWARE_BUF_ENABLED    ((0u != SPIS_1_INTERNAL_RX_INT_ENABLED) && \
                                                     (SPIS_1_RX_BUFFER_SIZE > SPIS_1_FIFO_SIZE))


/***************************************
*        Data Struct Definition
***************************************/

/* Sleep Mode API Support */
typedef struct
{
    uint8 enableState;
    uint8 cntrPeriod;
} SPIS_1_BACKUP_STRUCT;


/***************************************
*        Function Prototypes
***************************************/

void  SPIS_1_Init(void) ;
void  SPIS_1_Enable(void) ;
void  SPIS_1_Start(void) ;
void  SPIS_1_Stop(void) ;
void  SPIS_1_EnableTxInt(void) ;
void  SPIS_1_EnableRxInt(void) ;
void  SPIS_1_DisableTxInt(void) ;
void  SPIS_1_DisableRxInt(void) ;
void  SPIS_1_SetTxInterruptMode(uint8 intSrc) ;
void  SPIS_1_SetRxInterruptMode(uint8 intSrc) ;
uint8 SPIS_1_ReadTxStatus(void) ;
uint8 SPIS_1_ReadRxStatus(void) ;
void  SPIS_1_WriteTxData(uint8 txData);

#if(SPIS_1_MODE_USE_ZERO != 0u)
    void  SPIS_1_WriteTxDataZero(uint8 txDataByte) \
                                              ;
#endif /* (SPIS_1_MODE_USE_ZERO != 0u) */

uint8 SPIS_1_ReadRxData(void) ;
uint8 SPIS_1_GetRxBufferSize(void) ;
uint8 SPIS_1_GetTxBufferSize(void) ;
void  SPIS_1_ClearRxBuffer(void) ;
void  SPIS_1_ClearTxBuffer(void) ;

#if (SPIS_1_BIDIRECTIONAL_MODE != 0u)
    void  SPIS_1_TxEnable(void) ;
    void  SPIS_1_TxDisable(void) ;
#endif /* SPIS_1_BIDIRECTIONAL_MODE != 0u */

void  SPIS_1_PutArray(const uint8 buffer[], uint8 byteCount) ;
void  SPIS_1_ClearFIFO(void) ;
void  SPIS_1_Sleep(void) ;
void  SPIS_1_Wakeup(void) ;
void  SPIS_1_SaveConfig(void) ;
void  SPIS_1_RestoreConfig(void) ;

/* Communication bootloader APIs */
#if defined(CYDEV_BOOTLOADER_IO_COMP) && ((CYDEV_BOOTLOADER_IO_COMP == CyBtldr_SPIS_1) || \
                                          (CYDEV_BOOTLOADER_IO_COMP == CyBtldr_Custom_Interface))
    /* Physical layer functions */
    void    SPIS_1_CyBtldrCommStart(void) CYSMALL ;
    void    SPIS_1_CyBtldrCommStop(void) CYSMALL ;
    void    SPIS_1_CyBtldrCommReset(void) CYSMALL ;
    cystatus SPIS_1_CyBtldrCommWrite(const uint8 pData[], uint16 size, uint16 * count, uint8 timeOut) CYSMALL
             ;
    cystatus SPIS_1_CyBtldrCommRead(uint8 pData[], uint16 size, uint16 * count, uint8 timeOut) CYSMALL
             ;

    #if (CYDEV_BOOTLOADER_IO_COMP == CyBtldr_SPIS_1)
        #define CyBtldrCommStart    SPIS_1_CyBtldrCommStart
        #define CyBtldrCommStop     SPIS_1_CyBtldrCommStop
        #define CyBtldrCommReset    SPIS_1_CyBtldrCommReset
        #define CyBtldrCommWrite    SPIS_1_CyBtldrCommWrite
        #define CyBtldrCommRead     SPIS_1_CyBtldrCommRead
    #endif  /* (CYDEV_BOOTLOADER_IO_COMP == CyBtldr_SPIS_1) */

    /* Byte to Byte time out for detecting end of block data from host */
    #define SPIS_1_BYTE2BYTE_TIME_OUT (1u)

#endif /* (CYDEV_BOOTLOADER_IO_COMP) && ((CYDEV_BOOTLOADER_IO_COMP == CyBtldr_SPIS_1) || \
                                             (CYDEV_BOOTLOADER_IO_COMP == CyBtldr_Custom_Interface)) */


CY_ISR_PROTO(SPIS_1_TX_ISR);
CY_ISR_PROTO(SPIS_1_RX_ISR);

/* Macros for getting software status of SPIS Statusi Register */
#define SPIS_1_GET_STATUS_TX(swTxSts) ( (uint8)(SPIS_1_TX_STATUS_REG | \
                                                       ((swTxSts) & SPIS_1_STS_CLR_ON_RD_BYTES_MASK)) )
#define SPIS_1_GET_STATUS_RX(swRxSts) ( (uint8)(SPIS_1_RX_STATUS_REG | \
                                                       ((swRxSts) & SPIS_1_STS_CLR_ON_RD_BYTES_MASK)) )


/***************************************
*   Variable with external linkage
***************************************/

extern uint8 SPIS_1_initVar;


/***************************************
*           API Constants
***************************************/

#define SPIS_1_TX_ISR_NUMBER     ((uint8)SPIS_1_TxInternalInterrupt__INTC_NUMBER)
#define SPIS_1_RX_ISR_NUMBER     ((uint8)SPIS_1_RxInternalInterrupt__INTC_NUMBER)
#define SPIS_1_TX_ISR_PRIORITY   ((uint8)SPIS_1_TxInternalInterrupt__INTC_PRIOR_NUM)
#define SPIS_1_RX_ISR_PRIORITY   ((uint8)SPIS_1_RxInternalInterrupt__INTC_PRIOR_NUM)


/***************************************
*    Initial Parameter Constants
***************************************/

#define SPIS_1_INT_ON_SPI_DONE    (uint8)(0u << SPIS_1_STS_SPI_DONE_SHIFT)
#define SPIS_1_INT_ON_TX_EMPTY    (uint8)(0u << SPIS_1_STS_TX_FIFO_EMPTY_SHIFT)
#define SPIS_1_INT_ON_TX_NOT_FULL (uint8)(0u << SPIS_1_STS_TX_FIFO_NOT_FULL_SHIFT)
#define SPIS_1_INT_ON_BYTE_COMP   (uint8)(0u << SPIS_1_STS_BYTE_COMPLETE_SHIFT)

#define SPIS_1_TX_INIT_INTERRUPTS_MASK  (SPIS_1_INT_ON_SPI_DONE | \
                                            SPIS_1_INT_ON_TX_EMPTY | SPIS_1_INT_ON_TX_NOT_FULL | \
                                            SPIS_1_INT_ON_BYTE_COMP)

#define SPIS_1_INT_ON_RX_EMPTY     (uint8)(0u << SPIS_1_STS_RX_FIFO_EMPTY_SHIFT)
#define SPIS_1_INT_ON_RX_NOT_EMPTY (uint8)(0u << SPIS_1_STS_RX_FIFO_NOT_EMPTY_SHIFT)
#define SPIS_1_INT_ON_RX_OVER      (uint8)(0u << SPIS_1_STS_RX_FIFO_OVERRUN_SHIFT)
#define SPIS_1_INT_ON_RX_FULL      (uint8)(0u << SPIS_1_STS_RX_FIFO_FULL_SHIFT)

#define SPIS_1_RX_INIT_INTERRUPTS_MASK (SPIS_1_INT_ON_RX_EMPTY | \
                                            SPIS_1_INT_ON_RX_NOT_EMPTY | SPIS_1_INT_ON_RX_OVER | \
                                            SPIS_1_INT_ON_RX_FULL)

#define SPIS_1_BITCTR_INIT           (SPIS_1_DATA_WIDTH - 1u)

#define SPIS_1__MODE_00 0
#define SPIS_1__MODE_01 1
#define SPIS_1__MODE_10 2
#define SPIS_1__MODE_11 3


#define SPIS_1_TX_BUFFER_SIZE         (4u)
#define SPIS_1_RX_BUFFER_SIZE         (4u)

/* Following definitions are for version Compatibility, they are obsolete.
*  Please do not use it in new projects
*/
#define SPIS_1_INIT_INTERRUPTS_MASK  (SPIS_1_INT_ON_SPI_DONE | SPIS_1_INT_ON_TX_EMPTY | \
                                            SPIS_1_INT_ON_TX_NOT_FULL | SPIS_1_INT_ON_RX_EMPTY | \
                                            SPIS_1_INT_ON_RX_NOT_EMPTY | SPIS_1_INT_ON_RX_OVER | \
                                            SPIS_1_INT_ON_BYTE_COMP)


/***************************************
*             Registers
***************************************/
#if(CY_PSOC3 || CY_PSOC5)
    #define SPIS_1_TXDATA_ZERO_REG          (* (reg8  *) \
            SPIS_1_BSPIS_sR8_Dp_u0__A0_REG)

    #define SPIS_1_TXDATA_ZERO_PTR           (  (reg8  *) \
            SPIS_1_BSPIS_sR8_Dp_u0__A0_REG)

    #define SPIS_1_RXDATA_ZERO_REG           (* (reg8  *) \
            SPIS_1_BSPIS_sR8_Dp_u0__A0_REG)

    #define SPIS_1_RXDATA_ZERO_PTR           (  (reg8  *) \
            SPIS_1_BSPIS_sR8_Dp_u0__A0_REG)

    #define SPIS_1_TXDATA_REG                (* (reg8  *) \
            SPIS_1_BSPIS_sR8_Dp_u0__F0_REG)

    #define SPIS_1_TXDATA_PTR                (  (reg8  *) \
            SPIS_1_BSPIS_sR8_Dp_u0__F0_REG)

    #define SPIS_1_RXDATA_REG                (* (reg8  *) \
            SPIS_1_BSPIS_sR8_Dp_u0__F1_REG)

    #define SPIS_1_RXDATA_PTR                (  (reg8  *) \
            SPIS_1_BSPIS_sR8_Dp_u0__F1_REG)
#else
    #if(SPIS_1_DATA_WIDTH <= 8u) /* 8bit - SPIS */
        #define SPIS_1_TXDATA_ZERO_REG           (* (reg8 *) \
                SPIS_1_BSPIS_sR8_Dp_u0__A0_REG)

        #define SPIS_1_TXDATA_ZERO_PTR           (  (reg8  *) \
                SPIS_1_BSPIS_sR8_Dp_u0__A0_REG)

        #define SPIS_1_RXDATA_ZERO_REG           (* (reg8  *) \
                SPIS_1_BSPIS_sR8_Dp_u0__A0_REG)

        #define SPIS_1_RXDATA_ZERO_PTR           (  (reg8 *) \
                SPIS_1_BSPIS_sR8_Dp_u0__A0_REG)

        #define SPIS_1_TXDATA_REG                (* (reg8  *) \
                SPIS_1_BSPIS_sR8_Dp_u0__F0_REG)

        #define SPIS_1_TXDATA_PTR                (  (reg8  *) \
                SPIS_1_BSPIS_sR8_Dp_u0__F0_REG)

        #define SPIS_1_RXDATA_REG                (* (reg8  *) \
                SPIS_1_BSPIS_sR8_Dp_u0__F1_REG)

        #define SPIS_1_RXDATA_PTR                (  (reg8  *) \
                SPIS_1_BSPIS_sR8_Dp_u0__F1_REG)
    #else /* 16bit - SPIS */
        #define SPIS_1_TXDATA_ZERO_REG           (* (reg16  *) \
                SPIS_1_BSPIS_sR8_Dp_u0__16BIT_A0_REG)

        #define SPIS_1_TXDATA_ZERO_PTR           (  (reg16  *) \
                SPIS_1_BSPIS_sR8_Dp_u0__16BIT_A0_REG)

        #define SPIS_1_RXDATA_ZERO_REG           (* (reg16  *) \
                SPIS_1_BSPIS_sR8_Dp_u0__16BIT_A0_REG)

        #define SPIS_1_RXDATA_ZERO_PTR           (  (reg16  *) \
                SPIS_1_BSPIS_sR8_Dp_u0__16BIT_A0_REG)

        #define SPIS_1_TXDATA_REG                (* (reg16  *) \
                SPIS_1_BSPIS_sR8_Dp_u0__16BIT_F0_REG)

        #define SPIS_1_TXDATA_PTR                (  (reg16  *) \
                SPIS_1_BSPIS_sR8_Dp_u0__16BIT_F0_REG)

        #define SPIS_1_RXDATA_REG                (* (reg16  *) \
                SPIS_1_BSPIS_sR8_Dp_u0__16BIT_F1_REG)

        #define SPIS_1_RXDATA_PTR                (  (reg16 *) \
                SPIS_1_BSPIS_sR8_Dp_u0__16BIT_F1_REG)
    #endif /* (SPIS_1_DATA_WIDTH <= 8u) */
#endif     /* (CY_PSOC3 || CY_PSOC5) */

#define SPIS_1_TX_AUX_CONTROL_DP0_REG       (* (reg8 *) \
        SPIS_1_BSPIS_sR8_Dp_u0__DP_AUX_CTL_REG)
#define SPIS_1_TX_AUX_CONTROL_DP0_PTR       (  (reg8 *) \
        SPIS_1_BSPIS_sR8_Dp_u0__DP_AUX_CTL_REG)

#define SPIS_1_RX_AUX_CONTROL_DP0_REG       (* (reg8 *) \
        SPIS_1_BSPIS_sR8_Dp_u0__DP_AUX_CTL_REG)
#define SPIS_1_RX_AUX_CONTROL_DP0_PTR       (  (reg8 *) \
        SPIS_1_BSPIS_sR8_Dp_u0__DP_AUX_CTL_REG)

#if(SPIS_1_DATA_WIDTH > 8u)

    #define SPIS_1_TX_AUX_CONTROL_DP1_REG   (* (reg8 *) \
            SPIS_1_BSPIS_sR8_Dp_u1__DP_AUX_CTL_REG)
    #define SPIS_1_TX_AUX_CONTROL_DP1_PTR   (  (reg8 *) \
            SPIS_1_BSPIS_sR8_Dp_u1__DP_AUX_CTL_REG)

    #define SPIS_1_RX_AUX_CONTROL_DP1_REG   (* (reg8 *) \
            SPIS_1_BSPIS_sR8_Dp_u1__DP_AUX_CTL_REG)
    #define SPIS_1_RX_AUX_CONTROL_DP1_PTR   (  (reg8 *) \
            SPIS_1_BSPIS_sR8_Dp_u1__DP_AUX_CTL_REG)

#endif /* SPIS_1_DATA_WIDTH > 8u */


#define SPIS_1_COUNTER_PERIOD_REG    (* (reg8 *) \
        SPIS_1_BSPIS_BitCounter__PERIOD_REG)
#define SPIS_1_COUNTER_PERIOD_PTR    (  (reg8 *) \
        SPIS_1_BSPIS_BitCounter__PERIOD_REG)

#define SPIS_1_TX_STATUS_MASK_REG    (* (reg8 *) \
        SPIS_1_BSPIS_TxStsReg__MASK_REG)
#define SPIS_1_TX_STATUS_MASK_PTR    (  (reg8 *) \
        SPIS_1_BSPIS_TxStsReg__MASK_REG)

#define SPIS_1_RX_STATUS_MASK_REG    (* (reg8 *) \
        SPIS_1_BSPIS_RxStsReg__MASK_REG)
#define SPIS_1_RX_STATUS_MASK_PTR    (  (reg8 *) \
        SPIS_1_BSPIS_RxStsReg__MASK_REG)

#define SPIS_1_ONE_REG               (* (reg8 *) \
        SPIS_1_BSPIS_SPISlave_dpCounter_u0__D1_REG)
#define SPIS_1_ONE_PTR               (  (reg8 *) \
        SPIS_1_BSPIS_dpCounter_u0__D1_REG)

#define SPIS_1_TX_STATUS_REG         (* (reg8 *) \
        SPIS_1_BSPIS_TxStsReg__STATUS_REG)
#define SPIS_1_TX_STATUS_PTR         (  (reg8 *) \
        SPIS_1_BSPIS__TxStsReg__STATUS_REG)

#define SPIS_1_RX_STATUS_REG         (* (reg8 *) \
        SPIS_1_BSPIS_RxStsReg__STATUS_REG)
#define SPIS_1_RX_STATUS_PTR         (  (reg8 *) \
        SPIS_1_BSPIS_RxStsReg__STATUS_REG)

#define SPIS_1_COUNTER_CONTROL_REG   (* (reg8 *) \
        SPIS_1_BSPIS_BitCounter__CONTROL_AUX_CTL_REG)
#define SPIS_1_COUNTER_CONTROL_PTR   (  (reg8 *) \
        SPIS_1_BSPIS_BitCounter__CONTROL_AUX_CTL_REG)

#define SPIS_1_TX_STATUS_ACTL_REG    (* (reg8 *) \
        SPIS_1_BSPIS_TxStsReg__STATUS_AUX_CTL_REG)
#define SPIS_1_TX_STATUS_ACTL_PTR    (  (reg8 *) \
        SPIS_1_TX_BSPIS_TxStsReg__STATUS_AUX_CTL_REG)

#define SPIS_1_RX_STATUS_ACTL_REG    (* (reg8 *) \
        SPIS_1_BSPIS_RxStsReg__STATUS_AUX_CTL_REG)
#define SPIS_1_RX_STATUS_ACTL_PTR    (  (reg8 *) \
        SPIS_1_RX_BSPIS_RxStsReg__STATUS_AUX_CTL_REG)

#if(SPIS_1_BIDIRECTIONAL_MODE)

    #define SPIS_1_CONTROL_REG       (* (reg8 *) \
   SPIS_1_BSPIS_SyncCtl_CtrlReg__CONTROL_REG)
    #define SPIS_1_CONTROL_PTR       (  (reg8 *) \
   SPIS_1_BSPIS_SyncCtl_CtrlReg__CONTROL_REG)

#endif /* SPIS_1_BIDIRECTIONAL_MODE */


/***************************************
*       Register Constants
***************************************/

/* Status Register Definitions */
#define SPIS_1_STS_SPI_DONE_SHIFT             (0x00u)
#define SPIS_1_STS_TX_FIFO_NOT_FULL_SHIFT     (0x01u)
#define SPIS_1_STS_TX_FIFO_EMPTY_SHIFT        (0x02u)
#define SPIS_1_STS_RX_FIFO_NOT_EMPTY_SHIFT    (0x03u)
#define SPIS_1_STS_RX_FIFO_EMPTY_SHIFT        (0x04u)
#define SPIS_1_STS_RX_FIFO_OVERRUN_SHIFT      (0x05u)
#define SPIS_1_STS_RX_FIFO_FULL_SHIFT         (0x06u)
#define SPIS_1_STS_BYTE_COMPLETE_SHIFT        (0x06u)

#define SPIS_1_STS_SPI_DONE                   ((uint8)(0x01u << SPIS_1_STS_SPI_DONE_SHIFT))
#define SPIS_1_STS_TX_FIFO_EMPTY              ((uint8)(0x01u << SPIS_1_STS_TX_FIFO_EMPTY_SHIFT))
#define SPIS_1_STS_TX_FIFO_NOT_FULL           ((uint8)(0x01u << SPIS_1_STS_TX_FIFO_NOT_FULL_SHIFT))
#define SPIS_1_STS_RX_FIFO_EMPTY              ((uint8)(0x01u << SPIS_1_STS_RX_FIFO_EMPTY_SHIFT))
#define SPIS_1_STS_RX_FIFO_NOT_EMPTY          ((uint8)(0x01u << SPIS_1_STS_RX_FIFO_NOT_EMPTY_SHIFT))
#define SPIS_1_STS_RX_FIFO_OVERRUN            ((uint8)(0x01u << SPIS_1_STS_RX_FIFO_OVERRUN_SHIFT))
#define SPIS_1_STS_RX_FIFO_FULL               ((uint8)(0x01u << SPIS_1_STS_RX_FIFO_FULL_SHIFT))
#define SPIS_1_STS_BYTE_COMPLETE              ((uint8)(0x01u << SPIS_1_STS_BYTE_COMPLETE_SHIFT))

#define SPIS_1_STS_CLR_ON_RD_BYTES_MASK       (0x61u)

/* StatusI Register Interrupt Enable Control Bits */
/* As defined by the Register map for the AUX Control Register */
#define SPIS_1_INT_ENABLE                     (0x10u)
#define SPIS_1_TX_FIFO_CLR    (0x01u) /* F0 - TX FIFO */
#define SPIS_1_RX_FIFO_CLR    (0x02u) /* F1 - RX FIFO */
#define SPIS_1_FIFO_CLR       (SPIS_1_TX_FIFO_CLR | SPIS_1_RX_FIFO_CLR)

/* Bit Counter (7-bit) Control Register Bit Definitions */
/* As defined by the Register map for the AUX Control Register */
#define SPIS_1_CNTR_ENABLE                    (0x20u)

/* Bi-Directional mode control bit */
#define SPIS_1_CTRL_TX_SIGNAL_EN              (0x01u)

/* Datapath Auxillary Control Register definitions */
#define SPIS_1_AUX_CTRL_FIFO0_CLR             (0x00u)
#define SPIS_1_AUX_CTRL_FIFO1_CLR             (0x00u)
#define SPIS_1_AUX_CTRL_FIFO0_LVL             (0x00u)
#define SPIS_1_AUX_CTRL_FIFO1_LVL             (0x00u)
#define SPIS_1_STATUS_ACTL_INT_EN_MASK        (0x10u)

/* Component disabled */
#define SPIS_1_DISABLED   (0u)

/***************************************
* The following code is DEPRECATED and 
* should not be used in new projects.
***************************************/

#define SPIS_1_TXDATA_ZERO               (SPIS_1_TXDATA_ZERO_REG)
#define SPIS_1_TXDATA                    (SPIS_1_TXDATA_REG)
#define SPIS_1_RXDATA                    (SPIS_1_RXDATA_REG)
#define SPIS_1_MISO_AUX_CONTROLDP0       (SPIS_1_MISO_AUX_CTRL_DP0_REG)
#define SPIS_1_MOSI_AUX_CONTROLDP0       (SPIS_1_MOSI_AUX_CTRL_DP0_REG)
#define SPIS_1_TXBUFFERREAD              (SPIS_1_txBufferRead)
#define SPIS_1_TXBUFFERWRITE             (SPIS_1_txBufferWrite)
#define SPIS_1_RXBUFFERREAD              (SPIS_1_rxBufferRead)
#define SPIS_1_RXBUFFERWRITE             (SPIS_1_rxBufferWrite)

#if(SPIS_1_DATA_WIDTH > 8u)

    #define SPIS_1_MISO_AUX_CONTROLDP1   (SPIS_1_MISO_AUX_CTRL_DP1_REG)
    #define SPIS_1_MOSI_AUX_CONTROLDP1   (SPIS_1_MOSI_AUX_CTRL_DP0_REG)

#endif /* SPIS_1_DATA_WIDTH > 8u */

#define SPIS_1_COUNTER_PERIOD            (SPIS_1_COUNTER_PERIOD_REG)
#define SPIS_1_COUNTER_CONTROL           (SPIS_1_COUNTER_CONTROL_REG)
#define SPIS_1_ONE                       (SPIS_1_ONE_REG)
#define SPIS_1_STATUS                    (SPIS_1_TX_STATUS_REG)
#define SPIS_1_STATUS_MASK               (SPIS_1_TX_STATUS_MASK_REG)
#define SPIS_1_STATUS_ACTL               (SPIS_1_TX_STATUS_ACTL_REG)

#define SPIS_1_WriteByte      (SPIS_1_WriteTxData)
#define SPIS_1_ReadByte       (SPIS_1_ReadRxData)
#define SPIS_1_WriteByteZero  (SPIS_1_WriteTxDataZero)
void  SPIS_1_SetInterruptMode(uint8 intSrc) ;
uint8 SPIS_1_ReadStatus(void) ;
void  SPIS_1_EnableInt(void) ;
void  SPIS_1_DisableInt(void) ;

#define SPIS_1_STS_TX_BUF_NOT_FULL_SHIFT      (0x01u)
#define SPIS_1_STS_TX_BUF_FULL_SHIFT          (0x02u)
#define SPIS_1_STS_RX_BUF_NOT_EMPTY_SHIFT     (0x03u)
#define SPIS_1_STS_RX_BUF_EMPTY_SHIFT         (0x04u)
#define SPIS_1_STS_RX_BUF_OVERRUN_SHIFT       (0x05u)

#define SPIS_1_STS_TX_BUF_NOT_FULL            ((uint8)(0x01u << SPIS_1_STS_TX_BUF_NOT_FULL_SHIFT))
#define SPIS_1_STS_TX_BUF_FULL                ((uint8)(0x01u << SPIS_1_STS_TX_BUF_FULL_SHIFT))
#define SPIS_1_STS_RX_BUF_NOT_EMPTY           ((uint8)(0x01u << SPIS_1_STS_RX_BUF_NOT_EMPTY_SHIFT))
#define SPIS_1_STS_RX_BUF_EMPTY               ((uint8)(0x01u << SPIS_1_STS_RX_BUF_EMPTY_SHIFT))
#define SPIS_1_STS_RX_BUF_OVERRUN             ((uint8)(0x01u << SPIS_1_STS_RX_BUF_OVERRUN_SHIFT))

#define SPIS_1_DataWidth                  (SPIS_1_DATA_WIDTH)
#define SPIS_1_InternalClockUsed          (SPIS_1_INTERNAL_CLOCK)
#define SPIS_1_InternalTxInterruptEnabled (SPIS_1_INTERNAL_TX_INT_ENABLED)
#define SPIS_1_InternalRxInterruptEnabled (SPIS_1_INTERNAL_RX_INT_ENABLED)
#define SPIS_1_ModeUseZero                (SPIS_1_MODE_USE_ZERO)
#define SPIS_1_BidirectionalMode          (SPIS_1_BIDIRECTIONAL_MODE)
#define SPIS_1_Mode                       (SPIS_1_MODE)
#define SPIS_1_DATAWIDHT                  (SPIS_1_DATA_WIDTH)
#define SPIS_1_InternalInterruptEnabled   (0u)

#define SPIS_1_TXBUFFERSIZE   (SPIS_1_TX_BUFFER_SIZE)
#define SPIS_1_RXBUFFERSIZE   (SPIS_1_RX_BUFFER_SIZE)

#define SPIS_1_TXBUFFER       SPIS_1_txBuffer
#define SPIS_1_RXBUFFER       SPIS_1_rxBuffer

#endif  /* CY_SPIS_SPIS_1_H */

/* [] END OF FILE */
