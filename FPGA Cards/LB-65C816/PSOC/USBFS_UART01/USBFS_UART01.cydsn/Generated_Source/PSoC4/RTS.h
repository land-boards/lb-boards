/*******************************************************************************
* File Name: RTS.h  
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

#if !defined(CY_PINS_RTS_H) /* Pins RTS_H */
#define CY_PINS_RTS_H

#include "cytypes.h"
#include "cyfitter.h"
#include "RTS_aliases.h"


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
} RTS_BACKUP_STRUCT;

/** @} structures */


/***************************************
*        Function Prototypes             
***************************************/
/**
* \addtogroup group_general
* @{
*/
uint8   RTS_Read(void);
void    RTS_Write(uint8 value);
uint8   RTS_ReadDataReg(void);
#if defined(RTS__PC) || (CY_PSOC4_4200L) 
    void    RTS_SetDriveMode(uint8 mode);
#endif
void    RTS_SetInterruptMode(uint16 position, uint16 mode);
uint8   RTS_ClearInterrupt(void);
/** @} general */

/**
* \addtogroup group_power
* @{
*/
void RTS_Sleep(void); 
void RTS_Wakeup(void);
/** @} power */


/***************************************
*           API Constants        
***************************************/
#if defined(RTS__PC) || (CY_PSOC4_4200L) 
    /* Drive Modes */
    #define RTS_DRIVE_MODE_BITS        (3)
    #define RTS_DRIVE_MODE_IND_MASK    (0xFFFFFFFFu >> (32 - RTS_DRIVE_MODE_BITS))

    /**
    * \addtogroup group_constants
    * @{
    */
        /** \addtogroup driveMode Drive mode constants
         * \brief Constants to be passed as "mode" parameter in the RTS_SetDriveMode() function.
         *  @{
         */
        #define RTS_DM_ALG_HIZ         (0x00u) /**< \brief High Impedance Analog   */
        #define RTS_DM_DIG_HIZ         (0x01u) /**< \brief High Impedance Digital  */
        #define RTS_DM_RES_UP          (0x02u) /**< \brief Resistive Pull Up       */
        #define RTS_DM_RES_DWN         (0x03u) /**< \brief Resistive Pull Down     */
        #define RTS_DM_OD_LO           (0x04u) /**< \brief Open Drain, Drives Low  */
        #define RTS_DM_OD_HI           (0x05u) /**< \brief Open Drain, Drives High */
        #define RTS_DM_STRONG          (0x06u) /**< \brief Strong Drive            */
        #define RTS_DM_RES_UPDWN       (0x07u) /**< \brief Resistive Pull Up/Down  */
        /** @} driveMode */
    /** @} group_constants */
#endif

/* Digital Port Constants */
#define RTS_MASK               RTS__MASK
#define RTS_SHIFT              RTS__SHIFT
#define RTS_WIDTH              1u

/**
* \addtogroup group_constants
* @{
*/
    /** \addtogroup intrMode Interrupt constants
     * \brief Constants to be passed as "mode" parameter in RTS_SetInterruptMode() function.
     *  @{
     */
        #define RTS_INTR_NONE      ((uint16)(0x0000u)) /**< \brief Disabled             */
        #define RTS_INTR_RISING    ((uint16)(0x5555u)) /**< \brief Rising edge trigger  */
        #define RTS_INTR_FALLING   ((uint16)(0xaaaau)) /**< \brief Falling edge trigger */
        #define RTS_INTR_BOTH      ((uint16)(0xffffu)) /**< \brief Both edge trigger    */
    /** @} intrMode */
/** @} group_constants */

/* SIO LPM definition */
#if defined(RTS__SIO)
    #define RTS_SIO_LPM_MASK       (0x03u)
#endif

/* USBIO definitions */
#if !defined(RTS__PC) && (CY_PSOC4_4200L)
    #define RTS_USBIO_ENABLE               ((uint32)0x80000000u)
    #define RTS_USBIO_DISABLE              ((uint32)(~RTS_USBIO_ENABLE))
    #define RTS_USBIO_SUSPEND_SHIFT        CYFLD_USBDEVv2_USB_SUSPEND__OFFSET
    #define RTS_USBIO_SUSPEND_DEL_SHIFT    CYFLD_USBDEVv2_USB_SUSPEND_DEL__OFFSET
    #define RTS_USBIO_ENTER_SLEEP          ((uint32)((1u << RTS_USBIO_SUSPEND_SHIFT) \
                                                        | (1u << RTS_USBIO_SUSPEND_DEL_SHIFT)))
    #define RTS_USBIO_EXIT_SLEEP_PH1       ((uint32)~((uint32)(1u << RTS_USBIO_SUSPEND_SHIFT)))
    #define RTS_USBIO_EXIT_SLEEP_PH2       ((uint32)~((uint32)(1u << RTS_USBIO_SUSPEND_DEL_SHIFT)))
    #define RTS_USBIO_CR1_OFF              ((uint32)0xfffffffeu)
#endif


/***************************************
*             Registers        
***************************************/
/* Main Port Registers */
#if defined(RTS__PC)
    /* Port Configuration */
    #define RTS_PC                 (* (reg32 *) RTS__PC)
#endif
/* Pin State */
#define RTS_PS                     (* (reg32 *) RTS__PS)
/* Data Register */
#define RTS_DR                     (* (reg32 *) RTS__DR)
/* Input Buffer Disable Override */
#define RTS_INP_DIS                (* (reg32 *) RTS__PC2)

/* Interrupt configuration Registers */
#define RTS_INTCFG                 (* (reg32 *) RTS__INTCFG)
#define RTS_INTSTAT                (* (reg32 *) RTS__INTSTAT)

/* "Interrupt cause" register for Combined Port Interrupt (AllPortInt) in GSRef component */
#if defined (CYREG_GPIO_INTR_CAUSE)
    #define RTS_INTR_CAUSE         (* (reg32 *) CYREG_GPIO_INTR_CAUSE)
#endif

/* SIO register */
#if defined(RTS__SIO)
    #define RTS_SIO_REG            (* (reg32 *) RTS__SIO)
#endif /* (RTS__SIO_CFG) */

/* USBIO registers */
#if !defined(RTS__PC) && (CY_PSOC4_4200L)
    #define RTS_USB_POWER_REG       (* (reg32 *) CYREG_USBDEVv2_USB_POWER_CTRL)
    #define RTS_CR1_REG             (* (reg32 *) CYREG_USBDEVv2_CR1)
    #define RTS_USBIO_CTRL_REG      (* (reg32 *) CYREG_USBDEVv2_USB_USBIO_CTRL)
#endif    
    
    
/***************************************
* The following code is DEPRECATED and 
* must not be used in new designs.
***************************************/
/**
* \addtogroup group_deprecated
* @{
*/
#define RTS_DRIVE_MODE_SHIFT       (0x00u)
#define RTS_DRIVE_MODE_MASK        (0x07u << RTS_DRIVE_MODE_SHIFT)
/** @} deprecated */

#endif /* End Pins RTS_H */


/* [] END OF FILE */
