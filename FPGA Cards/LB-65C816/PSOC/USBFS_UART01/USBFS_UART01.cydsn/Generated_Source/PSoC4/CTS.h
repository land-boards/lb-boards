/*******************************************************************************
* File Name: CTS.h  
* Version 2.20
*
* Description:
*  This file contains Pin function prototypes and register defines
*
********************************************************************************
* Copyright 2008-2015, Cypress Semiconductor Corporation.  All rights reserved.
* You may use this file only in accordance with the license, terms, conditions, 
* disclaimers, and limitations in the end user license agreement accompanying 
* the software package with which this file was provided.
*******************************************************************************/

#if !defined(CY_PINS_CTS_H) /* Pins CTS_H */
#define CY_PINS_CTS_H

#include "cytypes.h"
#include "cyfitter.h"
#include "CTS_aliases.h"


/***************************************
*     Data Struct Definitions
***************************************/

/**
* \addtogroup group_structures
* @{
*/
    
/* Structure for sleep mode support */
typedef struct
{
    uint32 pcState; /**< State of the port control register */
    uint32 sioState; /**< State of the SIO configuration */
    uint32 usbState; /**< State of the USBIO regulator */
} CTS_BACKUP_STRUCT;

/** @} structures */


/***************************************
*        Function Prototypes             
***************************************/
/**
* \addtogroup group_general
* @{
*/
uint8   CTS_Read(void);
void    CTS_Write(uint8 value);
uint8   CTS_ReadDataReg(void);
#if defined(CTS__PC) || (CY_PSOC4_4200L) 
    void    CTS_SetDriveMode(uint8 mode);
#endif
void    CTS_SetInterruptMode(uint16 position, uint16 mode);
uint8   CTS_ClearInterrupt(void);
/** @} general */

/**
* \addtogroup group_power
* @{
*/
void CTS_Sleep(void); 
void CTS_Wakeup(void);
/** @} power */


/***************************************
*           API Constants        
***************************************/
#if defined(CTS__PC) || (CY_PSOC4_4200L) 
    /* Drive Modes */
    #define CTS_DRIVE_MODE_BITS        (3)
    #define CTS_DRIVE_MODE_IND_MASK    (0xFFFFFFFFu >> (32 - CTS_DRIVE_MODE_BITS))

    /**
    * \addtogroup group_constants
    * @{
    */
        /** \addtogroup driveMode Drive mode constants
         * \brief Constants to be passed as "mode" parameter in the CTS_SetDriveMode() function.
         *  @{
         */
        #define CTS_DM_ALG_HIZ         (0x00u) /**< \brief High Impedance Analog   */
        #define CTS_DM_DIG_HIZ         (0x01u) /**< \brief High Impedance Digital  */
        #define CTS_DM_RES_UP          (0x02u) /**< \brief Resistive Pull Up       */
        #define CTS_DM_RES_DWN         (0x03u) /**< \brief Resistive Pull Down     */
        #define CTS_DM_OD_LO           (0x04u) /**< \brief Open Drain, Drives Low  */
        #define CTS_DM_OD_HI           (0x05u) /**< \brief Open Drain, Drives High */
        #define CTS_DM_STRONG          (0x06u) /**< \brief Strong Drive            */
        #define CTS_DM_RES_UPDWN       (0x07u) /**< \brief Resistive Pull Up/Down  */
        /** @} driveMode */
    /** @} group_constants */
#endif

/* Digital Port Constants */
#define CTS_MASK               CTS__MASK
#define CTS_SHIFT              CTS__SHIFT
#define CTS_WIDTH              1u

/**
* \addtogroup group_constants
* @{
*/
    /** \addtogroup intrMode Interrupt constants
     * \brief Constants to be passed as "mode" parameter in CTS_SetInterruptMode() function.
     *  @{
     */
        #define CTS_INTR_NONE      ((uint16)(0x0000u)) /**< \brief Disabled             */
        #define CTS_INTR_RISING    ((uint16)(0x5555u)) /**< \brief Rising edge trigger  */
        #define CTS_INTR_FALLING   ((uint16)(0xaaaau)) /**< \brief Falling edge trigger */
        #define CTS_INTR_BOTH      ((uint16)(0xffffu)) /**< \brief Both edge trigger    */
    /** @} intrMode */
/** @} group_constants */

/* SIO LPM definition */
#if defined(CTS__SIO)
    #define CTS_SIO_LPM_MASK       (0x03u)
#endif

/* USBIO definitions */
#if !defined(CTS__PC) && (CY_PSOC4_4200L)
    #define CTS_USBIO_ENABLE               ((uint32)0x80000000u)
    #define CTS_USBIO_DISABLE              ((uint32)(~CTS_USBIO_ENABLE))
    #define CTS_USBIO_SUSPEND_SHIFT        CYFLD_USBDEVv2_USB_SUSPEND__OFFSET
    #define CTS_USBIO_SUSPEND_DEL_SHIFT    CYFLD_USBDEVv2_USB_SUSPEND_DEL__OFFSET
    #define CTS_USBIO_ENTER_SLEEP          ((uint32)((1u << CTS_USBIO_SUSPEND_SHIFT) \
                                                        | (1u << CTS_USBIO_SUSPEND_DEL_SHIFT)))
    #define CTS_USBIO_EXIT_SLEEP_PH1       ((uint32)~((uint32)(1u << CTS_USBIO_SUSPEND_SHIFT)))
    #define CTS_USBIO_EXIT_SLEEP_PH2       ((uint32)~((uint32)(1u << CTS_USBIO_SUSPEND_DEL_SHIFT)))
    #define CTS_USBIO_CR1_OFF              ((uint32)0xfffffffeu)
#endif


/***************************************
*             Registers        
***************************************/
/* Main Port Registers */
#if defined(CTS__PC)
    /* Port Configuration */
    #define CTS_PC                 (* (reg32 *) CTS__PC)
#endif
/* Pin State */
#define CTS_PS                     (* (reg32 *) CTS__PS)
/* Data Register */
#define CTS_DR                     (* (reg32 *) CTS__DR)
/* Input Buffer Disable Override */
#define CTS_INP_DIS                (* (reg32 *) CTS__PC2)

/* Interrupt configuration Registers */
#define CTS_INTCFG                 (* (reg32 *) CTS__INTCFG)
#define CTS_INTSTAT                (* (reg32 *) CTS__INTSTAT)

/* "Interrupt cause" register for Combined Port Interrupt (AllPortInt) in GSRef component */
#if defined (CYREG_GPIO_INTR_CAUSE)
    #define CTS_INTR_CAUSE         (* (reg32 *) CYREG_GPIO_INTR_CAUSE)
#endif

/* SIO register */
#if defined(CTS__SIO)
    #define CTS_SIO_REG            (* (reg32 *) CTS__SIO)
#endif /* (CTS__SIO_CFG) */

/* USBIO registers */
#if !defined(CTS__PC) && (CY_PSOC4_4200L)
    #define CTS_USB_POWER_REG       (* (reg32 *) CYREG_USBDEVv2_USB_POWER_CTRL)
    #define CTS_CR1_REG             (* (reg32 *) CYREG_USBDEVv2_CR1)
    #define CTS_USBIO_CTRL_REG      (* (reg32 *) CYREG_USBDEVv2_USB_USBIO_CTRL)
#endif    
    
    
/***************************************
* The following code is DEPRECATED and 
* must not be used in new designs.
***************************************/
/**
* \addtogroup group_deprecated
* @{
*/
#define CTS_DRIVE_MODE_SHIFT       (0x00u)
#define CTS_DRIVE_MODE_MASK        (0x07u << CTS_DRIVE_MODE_SHIFT)
/** @} deprecated */

#endif /* End Pins CTS_H */


/* [] END OF FILE */
