/*******************************************************************************
* File Name: BootloaderResetTimer.h
* Version 2.70
*
*  Description:
*     Contains the function prototypes and constants available to the timer
*     user module.
*
*   Note:
*     None
*
********************************************************************************
* Copyright 2008-2014, Cypress Semiconductor Corporation.  All rights reserved.
* You may use this file only in accordance with the license, terms, conditions,
* disclaimers, and limitations in the end user license agreement accompanying
* the software package with which this file was provided.
********************************************************************************/

#if !defined(CY_Timer_v2_60_BootloaderResetTimer_H)
#define CY_Timer_v2_60_BootloaderResetTimer_H

#include "cytypes.h"
#include "cyfitter.h"
#include "CyLib.h" /* For CyEnterCriticalSection() and CyExitCriticalSection() functions */

extern uint8 BootloaderResetTimer_initVar;

/* Check to see if required defines such as CY_PSOC5LP are available */
/* They are defined starting with cy_boot v3.0 */
#if !defined (CY_PSOC5LP)
    #error Component Timer_v2_70 requires cy_boot v3.0 or later
#endif /* (CY_ PSOC5LP) */


/**************************************
*           Parameter Defaults
**************************************/

#define BootloaderResetTimer_Resolution                 16u
#define BootloaderResetTimer_UsingFixedFunction         1u
#define BootloaderResetTimer_UsingHWCaptureCounter      0u
#define BootloaderResetTimer_SoftwareCaptureMode        0u
#define BootloaderResetTimer_SoftwareTriggerMode        0u
#define BootloaderResetTimer_UsingHWEnable              0u
#define BootloaderResetTimer_EnableTriggerMode          0u
#define BootloaderResetTimer_InterruptOnCaptureCount    0u
#define BootloaderResetTimer_RunModeUsed                0u
#define BootloaderResetTimer_ControlRegRemoved          0u

#if defined(BootloaderResetTimer_TimerUDB_sCTRLReg_SyncCtl_ctrlreg__CONTROL_REG)
    #define BootloaderResetTimer_UDB_CONTROL_REG_REMOVED            (0u)
#elif  (BootloaderResetTimer_UsingFixedFunction)
    #define BootloaderResetTimer_UDB_CONTROL_REG_REMOVED            (0u)
#else 
    #define BootloaderResetTimer_UDB_CONTROL_REG_REMOVED            (1u)
#endif /* End BootloaderResetTimer_TimerUDB_sCTRLReg_SyncCtl_ctrlreg__CONTROL_REG */


/***************************************
*       Type defines
***************************************/


/**************************************************************************
 * Sleep Wakeup Backup structure for Timer Component
 *************************************************************************/
typedef struct
{
    uint8 TimerEnableState;
    #if(!BootloaderResetTimer_UsingFixedFunction)

        uint16 TimerUdb;
        uint8 InterruptMaskValue;
        #if (BootloaderResetTimer_UsingHWCaptureCounter)
            uint8 TimerCaptureCounter;
        #endif /* variable declarations for backing up non retention registers in CY_UDB_V1 */

        #if (!BootloaderResetTimer_UDB_CONTROL_REG_REMOVED)
            uint8 TimerControlRegister;
        #endif /* variable declaration for backing up enable state of the Timer */
    #endif /* define backup variables only for UDB implementation. Fixed function registers are all retention */

}BootloaderResetTimer_backupStruct;


/***************************************
*       Function Prototypes
***************************************/

void    BootloaderResetTimer_Start(void) ;
void    BootloaderResetTimer_Stop(void) ;

void    BootloaderResetTimer_SetInterruptMode(uint8 interruptMode) ;
uint8   BootloaderResetTimer_ReadStatusRegister(void) ;
/* Deprecated function. Do not use this in future. Retained for backward compatibility */
#define BootloaderResetTimer_GetInterruptSource() BootloaderResetTimer_ReadStatusRegister()

#if(!BootloaderResetTimer_UDB_CONTROL_REG_REMOVED)
    uint8   BootloaderResetTimer_ReadControlRegister(void) ;
    void    BootloaderResetTimer_WriteControlRegister(uint8 control) ;
#endif /* (!BootloaderResetTimer_UDB_CONTROL_REG_REMOVED) */

uint16  BootloaderResetTimer_ReadPeriod(void) ;
void    BootloaderResetTimer_WritePeriod(uint16 period) ;
uint16  BootloaderResetTimer_ReadCounter(void) ;
void    BootloaderResetTimer_WriteCounter(uint16 counter) ;
uint16  BootloaderResetTimer_ReadCapture(void) ;
void    BootloaderResetTimer_SoftwareCapture(void) ;

#if(!BootloaderResetTimer_UsingFixedFunction) /* UDB Prototypes */
    #if (BootloaderResetTimer_SoftwareCaptureMode)
        void    BootloaderResetTimer_SetCaptureMode(uint8 captureMode) ;
    #endif /* (!BootloaderResetTimer_UsingFixedFunction) */

    #if (BootloaderResetTimer_SoftwareTriggerMode)
        void    BootloaderResetTimer_SetTriggerMode(uint8 triggerMode) ;
    #endif /* (BootloaderResetTimer_SoftwareTriggerMode) */

    #if (BootloaderResetTimer_EnableTriggerMode)
        void    BootloaderResetTimer_EnableTrigger(void) ;
        void    BootloaderResetTimer_DisableTrigger(void) ;
    #endif /* (BootloaderResetTimer_EnableTriggerMode) */


    #if(BootloaderResetTimer_InterruptOnCaptureCount)
        void    BootloaderResetTimer_SetInterruptCount(uint8 interruptCount) ;
    #endif /* (BootloaderResetTimer_InterruptOnCaptureCount) */

    #if (BootloaderResetTimer_UsingHWCaptureCounter)
        void    BootloaderResetTimer_SetCaptureCount(uint8 captureCount) ;
        uint8   BootloaderResetTimer_ReadCaptureCount(void) ;
    #endif /* (BootloaderResetTimer_UsingHWCaptureCounter) */

    void BootloaderResetTimer_ClearFIFO(void) ;
#endif /* UDB Prototypes */

/* Sleep Retention APIs */
void BootloaderResetTimer_Init(void)          ;
void BootloaderResetTimer_Enable(void)        ;
void BootloaderResetTimer_SaveConfig(void)    ;
void BootloaderResetTimer_RestoreConfig(void) ;
void BootloaderResetTimer_Sleep(void)         ;
void BootloaderResetTimer_Wakeup(void)        ;


/***************************************
*   Enumerated Types and Parameters
***************************************/

/* Enumerated Type B_Timer__CaptureModes, Used in Capture Mode */
#define BootloaderResetTimer__B_TIMER__CM_NONE 0
#define BootloaderResetTimer__B_TIMER__CM_RISINGEDGE 1
#define BootloaderResetTimer__B_TIMER__CM_FALLINGEDGE 2
#define BootloaderResetTimer__B_TIMER__CM_EITHEREDGE 3
#define BootloaderResetTimer__B_TIMER__CM_SOFTWARE 4



/* Enumerated Type B_Timer__TriggerModes, Used in Trigger Mode */
#define BootloaderResetTimer__B_TIMER__TM_NONE 0x00u
#define BootloaderResetTimer__B_TIMER__TM_RISINGEDGE 0x04u
#define BootloaderResetTimer__B_TIMER__TM_FALLINGEDGE 0x08u
#define BootloaderResetTimer__B_TIMER__TM_EITHEREDGE 0x0Cu
#define BootloaderResetTimer__B_TIMER__TM_SOFTWARE 0x10u


/***************************************
*    Initialial Parameter Constants
***************************************/

#define BootloaderResetTimer_INIT_PERIOD             65535u
#define BootloaderResetTimer_INIT_CAPTURE_MODE       ((uint8)((uint8)0u << BootloaderResetTimer_CTRL_CAP_MODE_SHIFT))
#define BootloaderResetTimer_INIT_TRIGGER_MODE       ((uint8)((uint8)0u << BootloaderResetTimer_CTRL_TRIG_MODE_SHIFT))
#if (BootloaderResetTimer_UsingFixedFunction)
    #define BootloaderResetTimer_INIT_INTERRUPT_MODE (((uint8)((uint8)0u << BootloaderResetTimer_STATUS_TC_INT_MASK_SHIFT)) | \
                                                  ((uint8)((uint8)0 << BootloaderResetTimer_STATUS_CAPTURE_INT_MASK_SHIFT)))
#else
    #define BootloaderResetTimer_INIT_INTERRUPT_MODE (((uint8)((uint8)0u << BootloaderResetTimer_STATUS_TC_INT_MASK_SHIFT)) | \
                                                 ((uint8)((uint8)0 << BootloaderResetTimer_STATUS_CAPTURE_INT_MASK_SHIFT)) | \
                                                 ((uint8)((uint8)0 << BootloaderResetTimer_STATUS_FIFOFULL_INT_MASK_SHIFT)))
#endif /* (BootloaderResetTimer_UsingFixedFunction) */
#define BootloaderResetTimer_INIT_CAPTURE_COUNT      (2u)
#define BootloaderResetTimer_INIT_INT_CAPTURE_COUNT  ((uint8)((uint8)(1u - 1u) << BootloaderResetTimer_CTRL_INTCNT_SHIFT))


/***************************************
*           Registers
***************************************/

#if (BootloaderResetTimer_UsingFixedFunction) /* Implementation Specific Registers and Register Constants */


    /***************************************
    *    Fixed Function Registers
    ***************************************/

    #define BootloaderResetTimer_STATUS         (*(reg8 *) BootloaderResetTimer_TimerHW__SR0 )
    /* In Fixed Function Block Status and Mask are the same register */
    #define BootloaderResetTimer_STATUS_MASK    (*(reg8 *) BootloaderResetTimer_TimerHW__SR0 )
    #define BootloaderResetTimer_CONTROL        (*(reg8 *) BootloaderResetTimer_TimerHW__CFG0)
    #define BootloaderResetTimer_CONTROL2       (*(reg8 *) BootloaderResetTimer_TimerHW__CFG1)
    #define BootloaderResetTimer_CONTROL2_PTR   ( (reg8 *) BootloaderResetTimer_TimerHW__CFG1)
    #define BootloaderResetTimer_RT1            (*(reg8 *) BootloaderResetTimer_TimerHW__RT1)
    #define BootloaderResetTimer_RT1_PTR        ( (reg8 *) BootloaderResetTimer_TimerHW__RT1)

    #if (CY_PSOC3 || CY_PSOC5LP)
        #define BootloaderResetTimer_CONTROL3       (*(reg8 *) BootloaderResetTimer_TimerHW__CFG2)
        #define BootloaderResetTimer_CONTROL3_PTR   ( (reg8 *) BootloaderResetTimer_TimerHW__CFG2)
    #endif /* (CY_PSOC3 || CY_PSOC5LP) */
    #define BootloaderResetTimer_GLOBAL_ENABLE  (*(reg8 *) BootloaderResetTimer_TimerHW__PM_ACT_CFG)
    #define BootloaderResetTimer_GLOBAL_STBY_ENABLE  (*(reg8 *) BootloaderResetTimer_TimerHW__PM_STBY_CFG)

    #define BootloaderResetTimer_CAPTURE_LSB         (* (reg16 *) BootloaderResetTimer_TimerHW__CAP0 )
    #define BootloaderResetTimer_CAPTURE_LSB_PTR       ((reg16 *) BootloaderResetTimer_TimerHW__CAP0 )
    #define BootloaderResetTimer_PERIOD_LSB          (* (reg16 *) BootloaderResetTimer_TimerHW__PER0 )
    #define BootloaderResetTimer_PERIOD_LSB_PTR        ((reg16 *) BootloaderResetTimer_TimerHW__PER0 )
    #define BootloaderResetTimer_COUNTER_LSB         (* (reg16 *) BootloaderResetTimer_TimerHW__CNT_CMP0 )
    #define BootloaderResetTimer_COUNTER_LSB_PTR       ((reg16 *) BootloaderResetTimer_TimerHW__CNT_CMP0 )


    /***************************************
    *    Register Constants
    ***************************************/

    /* Fixed Function Block Chosen */
    #define BootloaderResetTimer_BLOCK_EN_MASK                     BootloaderResetTimer_TimerHW__PM_ACT_MSK
    #define BootloaderResetTimer_BLOCK_STBY_EN_MASK                BootloaderResetTimer_TimerHW__PM_STBY_MSK

    /* Control Register Bit Locations */
    /* Interrupt Count - Not valid for Fixed Function Block */
    #define BootloaderResetTimer_CTRL_INTCNT_SHIFT                  0x00u
    /* Trigger Polarity - Not valid for Fixed Function Block */
    #define BootloaderResetTimer_CTRL_TRIG_MODE_SHIFT               0x00u
    /* Trigger Enable - Not valid for Fixed Function Block */
    #define BootloaderResetTimer_CTRL_TRIG_EN_SHIFT                 0x00u
    /* Capture Polarity - Not valid for Fixed Function Block */
    #define BootloaderResetTimer_CTRL_CAP_MODE_SHIFT                0x00u
    /* Timer Enable - As defined in Register Map, part of TMRX_CFG0 register */
    #define BootloaderResetTimer_CTRL_ENABLE_SHIFT                  0x00u

    /* Control Register Bit Masks */
    #define BootloaderResetTimer_CTRL_ENABLE                        ((uint8)((uint8)0x01u << BootloaderResetTimer_CTRL_ENABLE_SHIFT))

    /* Control2 Register Bit Masks */
    /* As defined in Register Map, Part of the TMRX_CFG1 register */
    #define BootloaderResetTimer_CTRL2_IRQ_SEL_SHIFT                 0x00u
    #define BootloaderResetTimer_CTRL2_IRQ_SEL                      ((uint8)((uint8)0x01u << BootloaderResetTimer_CTRL2_IRQ_SEL_SHIFT))

    #if (CY_PSOC5A)
        /* Use CFG1 Mode bits to set run mode */
        /* As defined by Verilog Implementation */
        #define BootloaderResetTimer_CTRL_MODE_SHIFT                 0x01u
        #define BootloaderResetTimer_CTRL_MODE_MASK                 ((uint8)((uint8)0x07u << BootloaderResetTimer_CTRL_MODE_SHIFT))
    #endif /* (CY_PSOC5A) */
    #if (CY_PSOC3 || CY_PSOC5LP)
        /* Control3 Register Bit Locations */
        #define BootloaderResetTimer_CTRL_RCOD_SHIFT        0x02u
        #define BootloaderResetTimer_CTRL_ENBL_SHIFT        0x00u
        #define BootloaderResetTimer_CTRL_MODE_SHIFT        0x00u

        /* Control3 Register Bit Masks */
        #define BootloaderResetTimer_CTRL_RCOD_MASK  ((uint8)((uint8)0x03u << BootloaderResetTimer_CTRL_RCOD_SHIFT)) /* ROD and COD bit masks */
        #define BootloaderResetTimer_CTRL_ENBL_MASK  ((uint8)((uint8)0x80u << BootloaderResetTimer_CTRL_ENBL_SHIFT)) /* HW_EN bit mask */
        #define BootloaderResetTimer_CTRL_MODE_MASK  ((uint8)((uint8)0x03u << BootloaderResetTimer_CTRL_MODE_SHIFT)) /* Run mode bit mask */

        #define BootloaderResetTimer_CTRL_RCOD       ((uint8)((uint8)0x03u << BootloaderResetTimer_CTRL_RCOD_SHIFT))
        #define BootloaderResetTimer_CTRL_ENBL       ((uint8)((uint8)0x80u << BootloaderResetTimer_CTRL_ENBL_SHIFT))
    #endif /* (CY_PSOC3 || CY_PSOC5LP) */

    /*RT1 Synch Constants: Applicable for PSoC3 and PSoC5LP */
    #define BootloaderResetTimer_RT1_SHIFT                       0x04u
    /* Sync TC and CMP bit masks */
    #define BootloaderResetTimer_RT1_MASK                        ((uint8)((uint8)0x03u << BootloaderResetTimer_RT1_SHIFT))
    #define BootloaderResetTimer_SYNC                            ((uint8)((uint8)0x03u << BootloaderResetTimer_RT1_SHIFT))
    #define BootloaderResetTimer_SYNCDSI_SHIFT                   0x00u
    /* Sync all DSI inputs with Mask  */
    #define BootloaderResetTimer_SYNCDSI_MASK                    ((uint8)((uint8)0x0Fu << BootloaderResetTimer_SYNCDSI_SHIFT))
    /* Sync all DSI inputs */
    #define BootloaderResetTimer_SYNCDSI_EN                      ((uint8)((uint8)0x0Fu << BootloaderResetTimer_SYNCDSI_SHIFT))

    #define BootloaderResetTimer_CTRL_MODE_PULSEWIDTH            ((uint8)((uint8)0x01u << BootloaderResetTimer_CTRL_MODE_SHIFT))
    #define BootloaderResetTimer_CTRL_MODE_PERIOD                ((uint8)((uint8)0x02u << BootloaderResetTimer_CTRL_MODE_SHIFT))
    #define BootloaderResetTimer_CTRL_MODE_CONTINUOUS            ((uint8)((uint8)0x00u << BootloaderResetTimer_CTRL_MODE_SHIFT))

    /* Status Register Bit Locations */
    /* As defined in Register Map, part of TMRX_SR0 register */
    #define BootloaderResetTimer_STATUS_TC_SHIFT                 0x07u
    /* As defined in Register Map, part of TMRX_SR0 register, Shared with Compare Status */
    #define BootloaderResetTimer_STATUS_CAPTURE_SHIFT            0x06u
    /* As defined in Register Map, part of TMRX_SR0 register */
    #define BootloaderResetTimer_STATUS_TC_INT_MASK_SHIFT        (BootloaderResetTimer_STATUS_TC_SHIFT - 0x04u)
    /* As defined in Register Map, part of TMRX_SR0 register, Shared with Compare Status */
    #define BootloaderResetTimer_STATUS_CAPTURE_INT_MASK_SHIFT   (BootloaderResetTimer_STATUS_CAPTURE_SHIFT - 0x04u)

    /* Status Register Bit Masks */
    #define BootloaderResetTimer_STATUS_TC                       ((uint8)((uint8)0x01u << BootloaderResetTimer_STATUS_TC_SHIFT))
    #define BootloaderResetTimer_STATUS_CAPTURE                  ((uint8)((uint8)0x01u << BootloaderResetTimer_STATUS_CAPTURE_SHIFT))
    /* Interrupt Enable Bit-Mask for interrupt on TC */
    #define BootloaderResetTimer_STATUS_TC_INT_MASK              ((uint8)((uint8)0x01u << BootloaderResetTimer_STATUS_TC_INT_MASK_SHIFT))
    /* Interrupt Enable Bit-Mask for interrupt on Capture */
    #define BootloaderResetTimer_STATUS_CAPTURE_INT_MASK         ((uint8)((uint8)0x01u << BootloaderResetTimer_STATUS_CAPTURE_INT_MASK_SHIFT))

#else   /* UDB Registers and Register Constants */


    /***************************************
    *           UDB Registers
    ***************************************/

    #define BootloaderResetTimer_STATUS              (* (reg8 *) BootloaderResetTimer_TimerUDB_rstSts_stsreg__STATUS_REG )
    #define BootloaderResetTimer_STATUS_MASK         (* (reg8 *) BootloaderResetTimer_TimerUDB_rstSts_stsreg__MASK_REG)
    #define BootloaderResetTimer_STATUS_AUX_CTRL     (* (reg8 *) BootloaderResetTimer_TimerUDB_rstSts_stsreg__STATUS_AUX_CTL_REG)
    #define BootloaderResetTimer_CONTROL             (* (reg8 *) BootloaderResetTimer_TimerUDB_sCTRLReg_SyncCtl_ctrlreg__CONTROL_REG )
    
    #if(BootloaderResetTimer_Resolution <= 8u) /* 8-bit Timer */
        #define BootloaderResetTimer_CAPTURE_LSB         (* (reg8 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__F0_REG )
        #define BootloaderResetTimer_CAPTURE_LSB_PTR       ((reg8 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__F0_REG )
        #define BootloaderResetTimer_PERIOD_LSB          (* (reg8 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__D0_REG )
        #define BootloaderResetTimer_PERIOD_LSB_PTR        ((reg8 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__D0_REG )
        #define BootloaderResetTimer_COUNTER_LSB         (* (reg8 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__A0_REG )
        #define BootloaderResetTimer_COUNTER_LSB_PTR       ((reg8 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__A0_REG )
    #elif(BootloaderResetTimer_Resolution <= 16u) /* 8-bit Timer */
        #if(CY_PSOC3) /* 8-bit addres space */
            #define BootloaderResetTimer_CAPTURE_LSB         (* (reg16 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__F0_REG )
            #define BootloaderResetTimer_CAPTURE_LSB_PTR       ((reg16 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__F0_REG )
            #define BootloaderResetTimer_PERIOD_LSB          (* (reg16 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__D0_REG )
            #define BootloaderResetTimer_PERIOD_LSB_PTR        ((reg16 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__D0_REG )
            #define BootloaderResetTimer_COUNTER_LSB         (* (reg16 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__A0_REG )
            #define BootloaderResetTimer_COUNTER_LSB_PTR       ((reg16 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__A0_REG )
        #else /* 16-bit address space */
            #define BootloaderResetTimer_CAPTURE_LSB         (* (reg16 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__16BIT_F0_REG )
            #define BootloaderResetTimer_CAPTURE_LSB_PTR       ((reg16 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__16BIT_F0_REG )
            #define BootloaderResetTimer_PERIOD_LSB          (* (reg16 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__16BIT_D0_REG )
            #define BootloaderResetTimer_PERIOD_LSB_PTR        ((reg16 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__16BIT_D0_REG )
            #define BootloaderResetTimer_COUNTER_LSB         (* (reg16 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__16BIT_A0_REG )
            #define BootloaderResetTimer_COUNTER_LSB_PTR       ((reg16 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__16BIT_A0_REG )
        #endif /* CY_PSOC3 */
    #elif(BootloaderResetTimer_Resolution <= 24u)/* 24-bit Timer */
        #define BootloaderResetTimer_CAPTURE_LSB         (* (reg32 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__F0_REG )
        #define BootloaderResetTimer_CAPTURE_LSB_PTR       ((reg32 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__F0_REG )
        #define BootloaderResetTimer_PERIOD_LSB          (* (reg32 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__D0_REG )
        #define BootloaderResetTimer_PERIOD_LSB_PTR        ((reg32 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__D0_REG )
        #define BootloaderResetTimer_COUNTER_LSB         (* (reg32 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__A0_REG )
        #define BootloaderResetTimer_COUNTER_LSB_PTR       ((reg32 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__A0_REG )
    #else /* 32-bit Timer */
        #if(CY_PSOC3 || CY_PSOC5) /* 8-bit address space */
            #define BootloaderResetTimer_CAPTURE_LSB         (* (reg32 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__F0_REG )
            #define BootloaderResetTimer_CAPTURE_LSB_PTR       ((reg32 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__F0_REG )
            #define BootloaderResetTimer_PERIOD_LSB          (* (reg32 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__D0_REG )
            #define BootloaderResetTimer_PERIOD_LSB_PTR        ((reg32 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__D0_REG )
            #define BootloaderResetTimer_COUNTER_LSB         (* (reg32 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__A0_REG )
            #define BootloaderResetTimer_COUNTER_LSB_PTR       ((reg32 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__A0_REG )
        #else /* 32-bit address space */
            #define BootloaderResetTimer_CAPTURE_LSB         (* (reg32 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__32BIT_F0_REG )
            #define BootloaderResetTimer_CAPTURE_LSB_PTR       ((reg32 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__32BIT_F0_REG )
            #define BootloaderResetTimer_PERIOD_LSB          (* (reg32 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__32BIT_D0_REG )
            #define BootloaderResetTimer_PERIOD_LSB_PTR        ((reg32 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__32BIT_D0_REG )
            #define BootloaderResetTimer_COUNTER_LSB         (* (reg32 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__32BIT_A0_REG )
            #define BootloaderResetTimer_COUNTER_LSB_PTR       ((reg32 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__32BIT_A0_REG )
        #endif /* CY_PSOC3 || CY_PSOC5 */ 
    #endif

    #define BootloaderResetTimer_COUNTER_LSB_PTR_8BIT       ((reg8 *) BootloaderResetTimer_TimerUDB_sT16_timerdp_u0__A0_REG )
    
    #if (BootloaderResetTimer_UsingHWCaptureCounter)
        #define BootloaderResetTimer_CAP_COUNT              (*(reg8 *) BootloaderResetTimer_TimerUDB_sCapCount_counter__PERIOD_REG )
        #define BootloaderResetTimer_CAP_COUNT_PTR          ( (reg8 *) BootloaderResetTimer_TimerUDB_sCapCount_counter__PERIOD_REG )
        #define BootloaderResetTimer_CAPTURE_COUNT_CTRL     (*(reg8 *) BootloaderResetTimer_TimerUDB_sCapCount_counter__CONTROL_AUX_CTL_REG )
        #define BootloaderResetTimer_CAPTURE_COUNT_CTRL_PTR ( (reg8 *) BootloaderResetTimer_TimerUDB_sCapCount_counter__CONTROL_AUX_CTL_REG )
    #endif /* (BootloaderResetTimer_UsingHWCaptureCounter) */


    /***************************************
    *       Register Constants
    ***************************************/

    /* Control Register Bit Locations */
    #define BootloaderResetTimer_CTRL_INTCNT_SHIFT              0x00u       /* As defined by Verilog Implementation */
    #define BootloaderResetTimer_CTRL_TRIG_MODE_SHIFT           0x02u       /* As defined by Verilog Implementation */
    #define BootloaderResetTimer_CTRL_TRIG_EN_SHIFT             0x04u       /* As defined by Verilog Implementation */
    #define BootloaderResetTimer_CTRL_CAP_MODE_SHIFT            0x05u       /* As defined by Verilog Implementation */
    #define BootloaderResetTimer_CTRL_ENABLE_SHIFT              0x07u       /* As defined by Verilog Implementation */

    /* Control Register Bit Masks */
    #define BootloaderResetTimer_CTRL_INTCNT_MASK               ((uint8)((uint8)0x03u << BootloaderResetTimer_CTRL_INTCNT_SHIFT))
    #define BootloaderResetTimer_CTRL_TRIG_MODE_MASK            ((uint8)((uint8)0x03u << BootloaderResetTimer_CTRL_TRIG_MODE_SHIFT))
    #define BootloaderResetTimer_CTRL_TRIG_EN                   ((uint8)((uint8)0x01u << BootloaderResetTimer_CTRL_TRIG_EN_SHIFT))
    #define BootloaderResetTimer_CTRL_CAP_MODE_MASK             ((uint8)((uint8)0x03u << BootloaderResetTimer_CTRL_CAP_MODE_SHIFT))
    #define BootloaderResetTimer_CTRL_ENABLE                    ((uint8)((uint8)0x01u << BootloaderResetTimer_CTRL_ENABLE_SHIFT))

    /* Bit Counter (7-bit) Control Register Bit Definitions */
    /* As defined by the Register map for the AUX Control Register */
    #define BootloaderResetTimer_CNTR_ENABLE                    0x20u

    /* Status Register Bit Locations */
    #define BootloaderResetTimer_STATUS_TC_SHIFT                0x00u  /* As defined by Verilog Implementation */
    #define BootloaderResetTimer_STATUS_CAPTURE_SHIFT           0x01u  /* As defined by Verilog Implementation */
    #define BootloaderResetTimer_STATUS_TC_INT_MASK_SHIFT       BootloaderResetTimer_STATUS_TC_SHIFT
    #define BootloaderResetTimer_STATUS_CAPTURE_INT_MASK_SHIFT  BootloaderResetTimer_STATUS_CAPTURE_SHIFT
    #define BootloaderResetTimer_STATUS_FIFOFULL_SHIFT          0x02u  /* As defined by Verilog Implementation */
    #define BootloaderResetTimer_STATUS_FIFONEMP_SHIFT          0x03u  /* As defined by Verilog Implementation */
    #define BootloaderResetTimer_STATUS_FIFOFULL_INT_MASK_SHIFT BootloaderResetTimer_STATUS_FIFOFULL_SHIFT

    /* Status Register Bit Masks */
    /* Sticky TC Event Bit-Mask */
    #define BootloaderResetTimer_STATUS_TC                      ((uint8)((uint8)0x01u << BootloaderResetTimer_STATUS_TC_SHIFT))
    /* Sticky Capture Event Bit-Mask */
    #define BootloaderResetTimer_STATUS_CAPTURE                 ((uint8)((uint8)0x01u << BootloaderResetTimer_STATUS_CAPTURE_SHIFT))
    /* Interrupt Enable Bit-Mask */
    #define BootloaderResetTimer_STATUS_TC_INT_MASK             ((uint8)((uint8)0x01u << BootloaderResetTimer_STATUS_TC_SHIFT))
    /* Interrupt Enable Bit-Mask */
    #define BootloaderResetTimer_STATUS_CAPTURE_INT_MASK        ((uint8)((uint8)0x01u << BootloaderResetTimer_STATUS_CAPTURE_SHIFT))
    /* NOT-Sticky FIFO Full Bit-Mask */
    #define BootloaderResetTimer_STATUS_FIFOFULL                ((uint8)((uint8)0x01u << BootloaderResetTimer_STATUS_FIFOFULL_SHIFT))
    /* NOT-Sticky FIFO Not Empty Bit-Mask */
    #define BootloaderResetTimer_STATUS_FIFONEMP                ((uint8)((uint8)0x01u << BootloaderResetTimer_STATUS_FIFONEMP_SHIFT))
    /* Interrupt Enable Bit-Mask */
    #define BootloaderResetTimer_STATUS_FIFOFULL_INT_MASK       ((uint8)((uint8)0x01u << BootloaderResetTimer_STATUS_FIFOFULL_SHIFT))

    #define BootloaderResetTimer_STATUS_ACTL_INT_EN             0x10u   /* As defined for the ACTL Register */

    /* Datapath Auxillary Control Register definitions */
    #define BootloaderResetTimer_AUX_CTRL_FIFO0_CLR             0x01u   /* As defined by Register map */
    #define BootloaderResetTimer_AUX_CTRL_FIFO1_CLR             0x02u   /* As defined by Register map */
    #define BootloaderResetTimer_AUX_CTRL_FIFO0_LVL             0x04u   /* As defined by Register map */
    #define BootloaderResetTimer_AUX_CTRL_FIFO1_LVL             0x08u   /* As defined by Register map */
    #define BootloaderResetTimer_STATUS_ACTL_INT_EN_MASK        0x10u   /* As defined for the ACTL Register */

#endif /* Implementation Specific Registers and Register Constants */

#endif  /* CY_Timer_v2_30_BootloaderResetTimer_H */


/* [] END OF FILE */
