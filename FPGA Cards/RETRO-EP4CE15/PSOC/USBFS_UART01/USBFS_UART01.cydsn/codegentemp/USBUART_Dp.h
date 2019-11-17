/*******************************************************************************
* File Name: USBUART_Dp.h  
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

#if !defined(CY_PINS_USBUART_Dp_H) /* Pins USBUART_Dp_H */
#define CY_PINS_USBUART_Dp_H

#include "cytypes.h"
#include "cyfitter.h"
#include "USBUART_Dp_aliases.h"


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
} USBUART_Dp_BACKUP_STRUCT;

/** @} structures */


/***************************************
*        Function Prototypes             
***************************************/
/**
* \addtogroup group_general
* @{
*/
uint8   USBUART_Dp_Read(void);
void    USBUART_Dp_Write(uint8 value);
uint8   USBUART_Dp_ReadDataReg(void);
#if defined(USBUART_Dp__PC) || (CY_PSOC4_4200L) 
    void    USBUART_Dp_SetDriveMode(uint8 mode);
#endif
void    USBUART_Dp_SetInterruptMode(uint16 position, uint16 mode);
uint8   USBUART_Dp_ClearInterrupt(void);
/** @} general */

/**
* \addtogroup group_power
* @{
*/
void USBUART_Dp_Sleep(void); 
void USBUART_Dp_Wakeup(void);
/** @} power */


/***************************************
*           API Constants        
***************************************/
#if defined(USBUART_Dp__PC) || (CY_PSOC4_4200L) 
    /* Drive Modes */
    #define USBUART_Dp_DRIVE_MODE_BITS        (3)
    #define USBUART_Dp_DRIVE_MODE_IND_MASK    (0xFFFFFFFFu >> (32 - USBUART_Dp_DRIVE_MODE_BITS))

    /**
    * \addtogroup group_constants
    * @{
    */
        /** \addtogroup driveMode Drive mode constants
         * \brief Constants to be passed as "mode" parameter in the USBUART_Dp_SetDriveMode() function.
         *  @{
         */
        #define USBUART_Dp_DM_ALG_HIZ         (0x00u) /**< \brief High Impedance Analog   */
        #define USBUART_Dp_DM_DIG_HIZ         (0x01u) /**< \brief High Impedance Digital  */
        #define USBUART_Dp_DM_RES_UP          (0x02u) /**< \brief Resistive Pull Up       */
        #define USBUART_Dp_DM_RES_DWN         (0x03u) /**< \brief Resistive Pull Down     */
        #define USBUART_Dp_DM_OD_LO           (0x04u) /**< \brief Open Drain, Drives Low  */
        #define USBUART_Dp_DM_OD_HI           (0x05u) /**< \brief Open Drain, Drives High */
        #define USBUART_Dp_DM_STRONG          (0x06u) /**< \brief Strong Drive            */
        #define USBUART_Dp_DM_RES_UPDWN       (0x07u) /**< \brief Resistive Pull Up/Down  */
        /** @} driveMode */
    /** @} group_constants */
#endif

/* Digital Port Constants */
#define USBUART_Dp_MASK               USBUART_Dp__MASK
#define USBUART_Dp_SHIFT              USBUART_Dp__SHIFT
#define USBUART_Dp_WIDTH              1u

/**
* \addtogroup group_constants
* @{
*/
    /** \addtogroup intrMode Interrupt constants
     * \brief Constants to be passed as "mode" parameter in USBUART_Dp_SetInterruptMode() function.
     *  @{
     */
        #define USBUART_Dp_INTR_NONE      ((uint16)(0x0000u)) /**< \brief Disabled             */
        #define USBUART_Dp_INTR_RISING    ((uint16)(0x5555u)) /**< \brief Rising edge trigger  */
        #define USBUART_Dp_INTR_FALLING   ((uint16)(0xaaaau)) /**< \brief Falling edge trigger */
        #define USBUART_Dp_INTR_BOTH      ((uint16)(0xffffu)) /**< \brief Both edge trigger    */
    /** @} intrMode */
/** @} group_constants */

/* SIO LPM definition */
#if defined(USBUART_Dp__SIO)
    #define USBUART_Dp_SIO_LPM_MASK       (0x03u)
#endif

/* USBIO definitions */
#if !defined(USBUART_Dp__PC) && (CY_PSOC4_4200L)
    #define USBUART_Dp_USBIO_ENABLE               ((uint32)0x80000000u)
    #define USBUART_Dp_USBIO_DISABLE              ((uint32)(~USBUART_Dp_USBIO_ENABLE))
    #define USBUART_Dp_USBIO_SUSPEND_SHIFT        CYFLD_USBDEVv2_USB_SUSPEND__OFFSET
    #define USBUART_Dp_USBIO_SUSPEND_DEL_SHIFT    CYFLD_USBDEVv2_USB_SUSPEND_DEL__OFFSET
    #define USBUART_Dp_USBIO_ENTER_SLEEP          ((uint32)((1u << USBUART_Dp_USBIO_SUSPEND_SHIFT) \
                                                        | (1u << USBUART_Dp_USBIO_SUSPEND_DEL_SHIFT)))
    #define USBUART_Dp_USBIO_EXIT_SLEEP_PH1       ((uint32)~((uint32)(1u << USBUART_Dp_USBIO_SUSPEND_SHIFT)))
    #define USBUART_Dp_USBIO_EXIT_SLEEP_PH2       ((uint32)~((uint32)(1u << USBUART_Dp_USBIO_SUSPEND_DEL_SHIFT)))
    #define USBUART_Dp_USBIO_CR1_OFF              ((uint32)0xfffffffeu)
#endif


/***************************************
*             Registers        
***************************************/
/* Main Port Registers */
#if defined(USBUART_Dp__PC)
    /* Port Configuration */
    #define USBUART_Dp_PC                 (* (reg32 *) USBUART_Dp__PC)
#endif
/* Pin State */
#define USBUART_Dp_PS                     (* (reg32 *) USBUART_Dp__PS)
/* Data Register */
#define USBUART_Dp_DR                     (* (reg32 *) USBUART_Dp__DR)
/* Input Buffer Disable Override */
#define USBUART_Dp_INP_DIS                (* (reg32 *) USBUART_Dp__PC2)

/* Interrupt configuration Registers */
#define USBUART_Dp_INTCFG                 (* (reg32 *) USBUART_Dp__INTCFG)
#define USBUART_Dp_INTSTAT                (* (reg32 *) USBUART_Dp__INTSTAT)

/* "Interrupt cause" register for Combined Port Interrupt (AllPortInt) in GSRef component */
#if defined (CYREG_GPIO_INTR_CAUSE)
    #define USBUART_Dp_INTR_CAUSE         (* (reg32 *) CYREG_GPIO_INTR_CAUSE)
#endif

/* SIO register */
#if defined(USBUART_Dp__SIO)
    #define USBUART_Dp_SIO_REG            (* (reg32 *) USBUART_Dp__SIO)
#endif /* (USBUART_Dp__SIO_CFG) */

/* USBIO registers */
#if !defined(USBUART_Dp__PC) && (CY_PSOC4_4200L)
    #define USBUART_Dp_USB_POWER_REG       (* (reg32 *) CYREG_USBDEVv2_USB_POWER_CTRL)
    #define USBUART_Dp_CR1_REG             (* (reg32 *) CYREG_USBDEVv2_CR1)
    #define USBUART_Dp_USBIO_CTRL_REG      (* (reg32 *) CYREG_USBDEVv2_USB_USBIO_CTRL)
#endif    
    
    
/***************************************
* The following code is DEPRECATED and 
* must not be used in new designs.
***************************************/
/**
* \addtogroup group_deprecated
* @{
*/
#define USBUART_Dp_DRIVE_MODE_SHIFT       (0x00u)
#define USBUART_Dp_DRIVE_MODE_MASK        (0x07u << USBUART_Dp_DRIVE_MODE_SHIFT)
/** @} deprecated */

#endif /* End Pins USBUART_Dp_H */


/* [] END OF FILE */
