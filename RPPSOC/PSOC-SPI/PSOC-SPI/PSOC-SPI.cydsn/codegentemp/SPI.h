/*******************************************************************************
* File Name: SPI.h
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

#if !defined(CY_SPIS_SPI_H)
#define CY_SPIS_SPI_H

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

#define SPI_DATA_WIDTH                  (8u)
#define SPI_INTERNAL_TX_INT_ENABLED     (0u)
#define SPI_INTERNAL_RX_INT_ENABLED     (0u)
#define SPI_MODE_USE_ZERO               (1u)
#define SPI_BIDIRECTIONAL_MODE          (0u)
#define SPI_MODE                        (0u)

#define SPI_FIFO_SIZE                  (4u)
/* Internal interrupt handling */
#define SPI_TX_BUFFER_SIZE             (4u)
#define SPI_RX_BUFFER_SIZE             (4u)
#define SPI_INTERNAL_TX_INT_ENABLED    (0u)
#define SPI_INTERNAL_RX_INT_ENABLED    (0u)

#define SPI_TX_SOFTWARE_BUF_ENABLED    ((0u != SPI_INTERNAL_TX_INT_ENABLED) && \
                                                     (SPI_TX_BUFFER_SIZE > SPI_FIFO_SIZE))

#define SPI_RX_SOFTWARE_BUF_ENABLED    ((0u != SPI_INTERNAL_RX_INT_ENABLED) && \
                                                     (SPI_RX_BUFFER_SIZE > SPI_FIFO_SIZE))


/***************************************
*        Data Struct Definition
***************************************/

/* Sleep Mode API Support */
typedef struct
{
    uint8 enableState;
    uint8 cntrPeriod;
} SPI_BACKUP_STRUCT;


/***************************************
*        Function Prototypes
***************************************/

void  SPI_Init(void) ;
void  SPI_Enable(void) ;
void  SPI_Start(void) ;
void  SPI_Stop(void) ;
void  SPI_EnableTxInt(void) ;
void  SPI_EnableRxInt(void) ;
void  SPI_DisableTxInt(void) ;
void  SPI_DisableRxInt(void) ;
void  SPI_SetTxInterruptMode(uint8 intSrc) ;
void  SPI_SetRxInterruptMode(uint8 intSrc) ;
uint8 SPI_ReadTxStatus(void) ;
uint8 SPI_ReadRxStatus(void) ;
void  SPI_WriteTxData(uint8 txData);

#if(SPI_MODE_USE_ZERO != 0u)
    void  SPI_WriteTxDataZero(uint8 txDataByte) \
                                              ;
#endif /* (SPI_MODE_USE_ZERO != 0u) */

uint8 SPI_ReadRxData(void) ;
uint8 SPI_GetRxBufferSize(void) ;
uint8 SPI_GetTxBufferSize(void) ;
void  SPI_ClearRxBuffer(void) ;
void  SPI_ClearTxBuffer(void) ;

#if (SPI_BIDIRECTIONAL_MODE != 0u)
    void  SPI_TxEnable(void) ;
    void  SPI_TxDisable(void) ;
#endif /* SPI_BIDIRECTIONAL_MODE != 0u */

void  SPI_PutArray(const uint8 buffer[], uint8 byteCount) ;
void  SPI_ClearFIFO(void) ;
void  SPI_Sleep(void) ;
void  SPI_Wakeup(void) ;
void  SPI_SaveConfig(void) ;
void  SPI_RestoreConfig(void) ;

/* Communication bootloader APIs */
#if defined(CYDEV_BOOTLOADER_IO_COMP) && ((CYDEV_BOOTLOADER_IO_COMP == CyBtldr_SPI) || \
                                          (CYDEV_BOOTLOADER_IO_COMP == CyBtldr_Custom_Interface))
    /* Physical layer functions */
    void    SPI_CyBtldrCommStart(void) CYSMALL ;
    void    SPI_CyBtldrCommStop(void) CYSMALL ;
    void    SPI_CyBtldrCommReset(void) CYSMALL ;
    cystatus SPI_CyBtldrCommWrite(const uint8 pData[], uint16 size, uint16 * count, uint8 timeOut) CYSMALL
             ;
    cystatus SPI_CyBtldrCommRead(uint8 pData[], uint16 size, uint16 * count, uint8 timeOut) CYSMALL
             ;

    #if (CYDEV_BOOTLOADER_IO_COMP == CyBtldr_SPI)
        #define CyBtldrCommStart    SPI_CyBtldrCommStart
        #define CyBtldrCommStop     SPI_CyBtldrCommStop
        #define CyBtldrCommReset    SPI_CyBtldrCommReset
        #define CyBtldrCommWrite    SPI_CyBtldrCommWrite
        #define CyBtldrCommRead     SPI_CyBtldrCommRead
    #endif  /* (CYDEV_BOOTLOADER_IO_COMP == CyBtldr_SPI) */

    /* Byte to Byte time out for detecting end of block data from host */
    #define SPI_BYTE2BYTE_TIME_OUT (1u)

#endif /* (CYDEV_BOOTLOADER_IO_COMP) && ((CYDEV_BOOTLOADER_IO_COMP == CyBtldr_SPI) || \
                                             (CYDEV_BOOTLOADER_IO_COMP == CyBtldr_Custom_Interface)) */


CY_ISR_PROTO(SPI_TX_ISR);
CY_ISR_PROTO(SPI_RX_ISR);

/* Macros for getting software status of SPIS Statusi Register */
#define SPI_GET_STATUS_TX(swTxSts) ( (uint8)(SPI_TX_STATUS_REG | \
                                                       ((swTxSts) & SPI_STS_CLR_ON_RD_BYTES_MASK)) )
#define SPI_GET_STATUS_RX(swRxSts) ( (uint8)(SPI_RX_STATUS_REG | \
                                                       ((swRxSts) & SPI_STS_CLR_ON_RD_BYTES_MASK)) )


/***************************************
*   Variable with external linkage
***************************************/

extern uint8 SPI_initVar;


/***************************************
*           API Constants
***************************************/

#define SPI_TX_ISR_NUMBER     ((uint8)SPI_TxInternalInterrupt__INTC_NUMBER)
#define SPI_RX_ISR_NUMBER     ((uint8)SPI_RxInternalInterrupt__INTC_NUMBER)
#define SPI_TX_ISR_PRIORITY   ((uint8)SPI_TxInternalInterrupt__INTC_PRIOR_NUM)
#define SPI_RX_ISR_PRIORITY   ((uint8)SPI_RxInternalInterrupt__INTC_PRIOR_NUM)


/***************************************
*    Initial Parameter Constants
***************************************/

#define SPI_INT_ON_SPI_DONE    (uint8)(0u << SPI_STS_SPI_DONE_SHIFT)
#define SPI_INT_ON_TX_EMPTY    (uint8)(0u << SPI_STS_TX_FIFO_EMPTY_SHIFT)
#define SPI_INT_ON_TX_NOT_FULL (uint8)(0u << SPI_STS_TX_FIFO_NOT_FULL_SHIFT)
#define SPI_INT_ON_BYTE_COMP   (uint8)(0u << SPI_STS_BYTE_COMPLETE_SHIFT)

#define SPI_TX_INIT_INTERRUPTS_MASK  (SPI_INT_ON_SPI_DONE | \
                                            SPI_INT_ON_TX_EMPTY | SPI_INT_ON_TX_NOT_FULL | \
                                            SPI_INT_ON_BYTE_COMP)

#define SPI_INT_ON_RX_EMPTY     (uint8)(0u << SPI_STS_RX_FIFO_EMPTY_SHIFT)
#define SPI_INT_ON_RX_NOT_EMPTY (uint8)(0u << SPI_STS_RX_FIFO_NOT_EMPTY_SHIFT)
#define SPI_INT_ON_RX_OVER      (uint8)(0u << SPI_STS_RX_FIFO_OVERRUN_SHIFT)
#define SPI_INT_ON_RX_FULL      (uint8)(0u << SPI_STS_RX_FIFO_FULL_SHIFT)

#define SPI_RX_INIT_INTERRUPTS_MASK (SPI_INT_ON_RX_EMPTY | \
                                            SPI_INT_ON_RX_NOT_EMPTY | SPI_INT_ON_RX_OVER | \
                                            SPI_INT_ON_RX_FULL)

#define SPI_BITCTR_INIT           (SPI_DATA_WIDTH - 1u)

#define SPI__MODE_00 0
#define SPI__MODE_01 1
#define SPI__MODE_10 2
#define SPI__MODE_11 3


#define SPI_TX_BUFFER_SIZE         (4u)
#define SPI_RX_BUFFER_SIZE         (4u)

/* Following definitions are for version Compatibility, they are obsolete.
*  Please do not use it in new projects
*/
#define SPI_INIT_INTERRUPTS_MASK  (SPI_INT_ON_SPI_DONE | SPI_INT_ON_TX_EMPTY | \
                                            SPI_INT_ON_TX_NOT_FULL | SPI_INT_ON_RX_EMPTY | \
                                            SPI_INT_ON_RX_NOT_EMPTY | SPI_INT_ON_RX_OVER | \
                                            SPI_INT_ON_BYTE_COMP)


/***************************************
*             Registers
***************************************/
#if(CY_PSOC3 || CY_PSOC5)
    #define SPI_TXDATA_ZERO_REG          (* (reg8  *) \
            SPI_BSPIS_sR8_Dp_u0__A0_REG)

    #define SPI_TXDATA_ZERO_PTR           (  (reg8  *) \
            SPI_BSPIS_sR8_Dp_u0__A0_REG)

    #define SPI_RXDATA_ZERO_REG           (* (reg8  *) \
            SPI_BSPIS_sR8_Dp_u0__A0_REG)

    #define SPI_RXDATA_ZERO_PTR           (  (reg8  *) \
            SPI_BSPIS_sR8_Dp_u0__A0_REG)

    #define SPI_TXDATA_REG                (* (reg8  *) \
            SPI_BSPIS_sR8_Dp_u0__F0_REG)

    #define SPI_TXDATA_PTR                (  (reg8  *) \
            SPI_BSPIS_sR8_Dp_u0__F0_REG)

    #define SPI_RXDATA_REG                (* (reg8  *) \
            SPI_BSPIS_sR8_Dp_u0__F1_REG)

    #define SPI_RXDATA_PTR                (  (reg8  *) \
            SPI_BSPIS_sR8_Dp_u0__F1_REG)
#else
    #if(SPI_DATA_WIDTH <= 8u) /* 8bit - SPIS */
        #define SPI_TXDATA_ZERO_REG           (* (reg8 *) \
                SPI_BSPIS_sR8_Dp_u0__A0_REG)

        #define SPI_TXDATA_ZERO_PTR           (  (reg8  *) \
                SPI_BSPIS_sR8_Dp_u0__A0_REG)

        #define SPI_RXDATA_ZERO_REG           (* (reg8  *) \
                SPI_BSPIS_sR8_Dp_u0__A0_REG)

        #define SPI_RXDATA_ZERO_PTR           (  (reg8 *) \
                SPI_BSPIS_sR8_Dp_u0__A0_REG)

        #define SPI_TXDATA_REG                (* (reg8  *) \
                SPI_BSPIS_sR8_Dp_u0__F0_REG)

        #define SPI_TXDATA_PTR                (  (reg8  *) \
                SPI_BSPIS_sR8_Dp_u0__F0_REG)

        #define SPI_RXDATA_REG                (* (reg8  *) \
                SPI_BSPIS_sR8_Dp_u0__F1_REG)

        #define SPI_RXDATA_PTR                (  (reg8  *) \
                SPI_BSPIS_sR8_Dp_u0__F1_REG)
    #else /* 16bit - SPIS */
        #define SPI_TXDATA_ZERO_REG           (* (reg16  *) \
                SPI_BSPIS_sR8_Dp_u0__16BIT_A0_REG)

        #define SPI_TXDATA_ZERO_PTR           (  (reg16  *) \
                SPI_BSPIS_sR8_Dp_u0__16BIT_A0_REG)

        #define SPI_RXDATA_ZERO_REG           (* (reg16  *) \
                SPI_BSPIS_sR8_Dp_u0__16BIT_A0_REG)

        #define SPI_RXDATA_ZERO_PTR           (  (reg16  *) \
                SPI_BSPIS_sR8_Dp_u0__16BIT_A0_REG)

        #define SPI_TXDATA_REG                (* (reg16  *) \
                SPI_BSPIS_sR8_Dp_u0__16BIT_F0_REG)

        #define SPI_TXDATA_PTR                (  (reg16  *) \
                SPI_BSPIS_sR8_Dp_u0__16BIT_F0_REG)

        #define SPI_RXDATA_REG                (* (reg16  *) \
                SPI_BSPIS_sR8_Dp_u0__16BIT_F1_REG)

        #define SPI_RXDATA_PTR                (  (reg16 *) \
                SPI_BSPIS_sR8_Dp_u0__16BIT_F1_REG)
    #endif /* (SPI_DATA_WIDTH <= 8u) */
#endif     /* (CY_PSOC3 || CY_PSOC5) */

#define SPI_TX_AUX_CONTROL_DP0_REG       (* (reg8 *) \
        SPI_BSPIS_sR8_Dp_u0__DP_AUX_CTL_REG)
#define SPI_TX_AUX_CONTROL_DP0_PTR       (  (reg8 *) \
        SPI_BSPIS_sR8_Dp_u0__DP_AUX_CTL_REG)

#define SPI_RX_AUX_CONTROL_DP0_REG       (* (reg8 *) \
        SPI_BSPIS_sR8_Dp_u0__DP_AUX_CTL_REG)
#define SPI_RX_AUX_CONTROL_DP0_PTR       (  (reg8 *) \
        SPI_BSPIS_sR8_Dp_u0__DP_AUX_CTL_REG)

#if(SPI_DATA_WIDTH > 8u)

    #define SPI_TX_AUX_CONTROL_DP1_REG   (* (reg8 *) \
            SPI_BSPIS_sR8_Dp_u1__DP_AUX_CTL_REG)
    #define SPI_TX_AUX_CONTROL_DP1_PTR   (  (reg8 *) \
            SPI_BSPIS_sR8_Dp_u1__DP_AUX_CTL_REG)

    #define SPI_RX_AUX_CONTROL_DP1_REG   (* (reg8 *) \
            SPI_BSPIS_sR8_Dp_u1__DP_AUX_CTL_REG)
    #define SPI_RX_AUX_CONTROL_DP1_PTR   (  (reg8 *) \
            SPI_BSPIS_sR8_Dp_u1__DP_AUX_CTL_REG)

#endif /* SPI_DATA_WIDTH > 8u */


#define SPI_COUNTER_PERIOD_REG    (* (reg8 *) \
        SPI_BSPIS_BitCounter__PERIOD_REG)
#define SPI_COUNTER_PERIOD_PTR    (  (reg8 *) \
        SPI_BSPIS_BitCounter__PERIOD_REG)

#define SPI_TX_STATUS_MASK_REG    (* (reg8 *) \
        SPI_BSPIS_TxStsReg__MASK_REG)
#define SPI_TX_STATUS_MASK_PTR    (  (reg8 *) \
        SPI_BSPIS_TxStsReg__MASK_REG)

#define SPI_RX_STATUS_MASK_REG    (* (reg8 *) \
        SPI_BSPIS_RxStsReg__MASK_REG)
#define SPI_RX_STATUS_MASK_PTR    (  (reg8 *) \
        SPI_BSPIS_RxStsReg__MASK_REG)

#define SPI_ONE_REG               (* (reg8 *) \
        SPI_BSPIS_SPISlave_dpCounter_u0__D1_REG)
#define SPI_ONE_PTR               (  (reg8 *) \
        SPI_BSPIS_dpCounter_u0__D1_REG)

#define SPI_TX_STATUS_REG         (* (reg8 *) \
        SPI_BSPIS_TxStsReg__STATUS_REG)
#define SPI_TX_STATUS_PTR         (  (reg8 *) \
        SPI_BSPIS__TxStsReg__STATUS_REG)

#define SPI_RX_STATUS_REG         (* (reg8 *) \
        SPI_BSPIS_RxStsReg__STATUS_REG)
#define SPI_RX_STATUS_PTR         (  (reg8 *) \
        SPI_BSPIS_RxStsReg__STATUS_REG)

#define SPI_COUNTER_CONTROL_REG   (* (reg8 *) \
        SPI_BSPIS_BitCounter__CONTROL_AUX_CTL_REG)
#define SPI_COUNTER_CONTROL_PTR   (  (reg8 *) \
        SPI_BSPIS_BitCounter__CONTROL_AUX_CTL_REG)

#define SPI_TX_STATUS_ACTL_REG    (* (reg8 *) \
        SPI_BSPIS_TxStsReg__STATUS_AUX_CTL_REG)
#define SPI_TX_STATUS_ACTL_PTR    (  (reg8 *) \
        SPI_TX_BSPIS_TxStsReg__STATUS_AUX_CTL_REG)

#define SPI_RX_STATUS_ACTL_REG    (* (reg8 *) \
        SPI_BSPIS_RxStsReg__STATUS_AUX_CTL_REG)
#define SPI_RX_STATUS_ACTL_PTR    (  (reg8 *) \
        SPI_RX_BSPIS_RxStsReg__STATUS_AUX_CTL_REG)

#if(SPI_BIDIRECTIONAL_MODE)

    #define SPI_CONTROL_REG       (* (reg8 *) \
   SPI_BSPIS_SyncCtl_CtrlReg__CONTROL_REG)
    #define SPI_CONTROL_PTR       (  (reg8 *) \
   SPI_BSPIS_SyncCtl_CtrlReg__CONTROL_REG)

#endif /* SPI_BIDIRECTIONAL_MODE */


/***************************************
*       Register Constants
***************************************/

/* Status Register Definitions */
#define SPI_STS_SPI_DONE_SHIFT             (0x00u)
#define SPI_STS_TX_FIFO_NOT_FULL_SHIFT     (0x01u)
#define SPI_STS_TX_FIFO_EMPTY_SHIFT        (0x02u)
#define SPI_STS_RX_FIFO_NOT_EMPTY_SHIFT    (0x03u)
#define SPI_STS_RX_FIFO_EMPTY_SHIFT        (0x04u)
#define SPI_STS_RX_FIFO_OVERRUN_SHIFT      (0x05u)
#define SPI_STS_RX_FIFO_FULL_SHIFT         (0x06u)
#define SPI_STS_BYTE_COMPLETE_SHIFT        (0x06u)

#define SPI_STS_SPI_DONE                   ((uint8)(0x01u << SPI_STS_SPI_DONE_SHIFT))
#define SPI_STS_TX_FIFO_EMPTY              ((uint8)(0x01u << SPI_STS_TX_FIFO_EMPTY_SHIFT))
#define SPI_STS_TX_FIFO_NOT_FULL           ((uint8)(0x01u << SPI_STS_TX_FIFO_NOT_FULL_SHIFT))
#define SPI_STS_RX_FIFO_EMPTY              ((uint8)(0x01u << SPI_STS_RX_FIFO_EMPTY_SHIFT))
#define SPI_STS_RX_FIFO_NOT_EMPTY          ((uint8)(0x01u << SPI_STS_RX_FIFO_NOT_EMPTY_SHIFT))
#define SPI_STS_RX_FIFO_OVERRUN            ((uint8)(0x01u << SPI_STS_RX_FIFO_OVERRUN_SHIFT))
#define SPI_STS_RX_FIFO_FULL               ((uint8)(0x01u << SPI_STS_RX_FIFO_FULL_SHIFT))
#define SPI_STS_BYTE_COMPLETE              ((uint8)(0x01u << SPI_STS_BYTE_COMPLETE_SHIFT))

#define SPI_STS_CLR_ON_RD_BYTES_MASK       (0x61u)

/* StatusI Register Interrupt Enable Control Bits */
/* As defined by the Register map for the AUX Control Register */
#define SPI_INT_ENABLE                     (0x10u)
#define SPI_TX_FIFO_CLR    (0x01u) /* F0 - TX FIFO */
#define SPI_RX_FIFO_CLR    (0x02u) /* F1 - RX FIFO */
#define SPI_FIFO_CLR       (SPI_TX_FIFO_CLR | SPI_RX_FIFO_CLR)

/* Bit Counter (7-bit) Control Register Bit Definitions */
/* As defined by the Register map for the AUX Control Register */
#define SPI_CNTR_ENABLE                    (0x20u)

/* Bi-Directional mode control bit */
#define SPI_CTRL_TX_SIGNAL_EN              (0x01u)

/* Datapath Auxillary Control Register definitions */
#define SPI_AUX_CTRL_FIFO0_CLR             (0x00u)
#define SPI_AUX_CTRL_FIFO1_CLR             (0x00u)
#define SPI_AUX_CTRL_FIFO0_LVL             (0x00u)
#define SPI_AUX_CTRL_FIFO1_LVL             (0x00u)
#define SPI_STATUS_ACTL_INT_EN_MASK        (0x10u)

/* Component disabled */
#define SPI_DISABLED   (0u)

/***************************************
* The following code is DEPRECATED and 
* should not be used in new projects.
***************************************/

#define SPI_TXDATA_ZERO               (SPI_TXDATA_ZERO_REG)
#define SPI_TXDATA                    (SPI_TXDATA_REG)
#define SPI_RXDATA                    (SPI_RXDATA_REG)
#define SPI_MISO_AUX_CONTROLDP0       (SPI_MISO_AUX_CTRL_DP0_REG)
#define SPI_MOSI_AUX_CONTROLDP0       (SPI_MOSI_AUX_CTRL_DP0_REG)
#define SPI_TXBUFFERREAD              (SPI_txBufferRead)
#define SPI_TXBUFFERWRITE             (SPI_txBufferWrite)
#define SPI_RXBUFFERREAD              (SPI_rxBufferRead)
#define SPI_RXBUFFERWRITE             (SPI_rxBufferWrite)

#if(SPI_DATA_WIDTH > 8u)

    #define SPI_MISO_AUX_CONTROLDP1   (SPI_MISO_AUX_CTRL_DP1_REG)
    #define SPI_MOSI_AUX_CONTROLDP1   (SPI_MOSI_AUX_CTRL_DP0_REG)

#endif /* SPI_DATA_WIDTH > 8u */

#define SPI_COUNTER_PERIOD            (SPI_COUNTER_PERIOD_REG)
#define SPI_COUNTER_CONTROL           (SPI_COUNTER_CONTROL_REG)
#define SPI_ONE                       (SPI_ONE_REG)
#define SPI_STATUS                    (SPI_TX_STATUS_REG)
#define SPI_STATUS_MASK               (SPI_TX_STATUS_MASK_REG)
#define SPI_STATUS_ACTL               (SPI_TX_STATUS_ACTL_REG)

#define SPI_WriteByte      (SPI_WriteTxData)
#define SPI_ReadByte       (SPI_ReadRxData)
#define SPI_WriteByteZero  (SPI_WriteTxDataZero)
void  SPI_SetInterruptMode(uint8 intSrc) ;
uint8 SPI_ReadStatus(void) ;
void  SPI_EnableInt(void) ;
void  SPI_DisableInt(void) ;

#define SPI_STS_TX_BUF_NOT_FULL_SHIFT      (0x01u)
#define SPI_STS_TX_BUF_FULL_SHIFT          (0x02u)
#define SPI_STS_RX_BUF_NOT_EMPTY_SHIFT     (0x03u)
#define SPI_STS_RX_BUF_EMPTY_SHIFT         (0x04u)
#define SPI_STS_RX_BUF_OVERRUN_SHIFT       (0x05u)

#define SPI_STS_TX_BUF_NOT_FULL            ((uint8)(0x01u << SPI_STS_TX_BUF_NOT_FULL_SHIFT))
#define SPI_STS_TX_BUF_FULL                ((uint8)(0x01u << SPI_STS_TX_BUF_FULL_SHIFT))
#define SPI_STS_RX_BUF_NOT_EMPTY           ((uint8)(0x01u << SPI_STS_RX_BUF_NOT_EMPTY_SHIFT))
#define SPI_STS_RX_BUF_EMPTY               ((uint8)(0x01u << SPI_STS_RX_BUF_EMPTY_SHIFT))
#define SPI_STS_RX_BUF_OVERRUN             ((uint8)(0x01u << SPI_STS_RX_BUF_OVERRUN_SHIFT))

#define SPI_DataWidth                  (SPI_DATA_WIDTH)
#define SPI_InternalClockUsed          (SPI_INTERNAL_CLOCK)
#define SPI_InternalTxInterruptEnabled (SPI_INTERNAL_TX_INT_ENABLED)
#define SPI_InternalRxInterruptEnabled (SPI_INTERNAL_RX_INT_ENABLED)
#define SPI_ModeUseZero                (SPI_MODE_USE_ZERO)
#define SPI_BidirectionalMode          (SPI_BIDIRECTIONAL_MODE)
#define SPI_Mode                       (SPI_MODE)
#define SPI_DATAWIDHT                  (SPI_DATA_WIDTH)
#define SPI_InternalInterruptEnabled   (0u)

#define SPI_TXBUFFERSIZE   (SPI_TX_BUFFER_SIZE)
#define SPI_RXBUFFERSIZE   (SPI_RX_BUFFER_SIZE)

#define SPI_TXBUFFER       SPI_txBuffer
#define SPI_RXBUFFER       SPI_rxBuffer

#endif  /* CY_SPIS_SPI_H */

/* [] END OF FILE */
