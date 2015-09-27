/*******************************************************************************
* File Name: UserButton.h  
* Version 2.10
*
* Description:
*  This file containts Control Register function prototypes and register defines
*
* Note:
*
********************************************************************************
* Copyright 2008-2014, Cypress Semiconductor Corporation.  All rights reserved.
* You may use this file only in accordance with the license, terms, conditions, 
* disclaimers, and limitations in the end user license agreement accompanying 
* the software package with which this file was provided.
*******************************************************************************/

#if !defined(CY_PINS_UserButton_H) /* Pins UserButton_H */
#define CY_PINS_UserButton_H

#include "cytypes.h"
#include "cyfitter.h"
#include "cypins.h"
#include "UserButton_aliases.h"

/* Check to see if required defines such as CY_PSOC5A are available */
/* They are defined starting with cy_boot v3.0 */
#if !defined (CY_PSOC5A)
    #error Component cy_pins_v2_10 requires cy_boot v3.0 or later
#endif /* (CY_PSOC5A) */

/* APIs are not generated for P15[7:6] */
#if !(CY_PSOC5A &&\
	 UserButton__PORT == 15 && ((UserButton__MASK & 0xC0) != 0))


/***************************************
*        Function Prototypes             
***************************************/    

void    UserButton_Write(uint8 value) ;
void    UserButton_SetDriveMode(uint8 mode) ;
uint8   UserButton_ReadDataReg(void) ;
uint8   UserButton_Read(void) ;
uint8   UserButton_ClearInterrupt(void) ;


/***************************************
*           API Constants        
***************************************/

/* Drive Modes */
#define UserButton_DM_ALG_HIZ         PIN_DM_ALG_HIZ
#define UserButton_DM_DIG_HIZ         PIN_DM_DIG_HIZ
#define UserButton_DM_RES_UP          PIN_DM_RES_UP
#define UserButton_DM_RES_DWN         PIN_DM_RES_DWN
#define UserButton_DM_OD_LO           PIN_DM_OD_LO
#define UserButton_DM_OD_HI           PIN_DM_OD_HI
#define UserButton_DM_STRONG          PIN_DM_STRONG
#define UserButton_DM_RES_UPDWN       PIN_DM_RES_UPDWN

/* Digital Port Constants */
#define UserButton_MASK               UserButton__MASK
#define UserButton_SHIFT              UserButton__SHIFT
#define UserButton_WIDTH              1u


/***************************************
*             Registers        
***************************************/

/* Main Port Registers */
/* Pin State */
#define UserButton_PS                     (* (reg8 *) UserButton__PS)
/* Data Register */
#define UserButton_DR                     (* (reg8 *) UserButton__DR)
/* Port Number */
#define UserButton_PRT_NUM                (* (reg8 *) UserButton__PRT) 
/* Connect to Analog Globals */                                                  
#define UserButton_AG                     (* (reg8 *) UserButton__AG)                       
/* Analog MUX bux enable */
#define UserButton_AMUX                   (* (reg8 *) UserButton__AMUX) 
/* Bidirectional Enable */                                                        
#define UserButton_BIE                    (* (reg8 *) UserButton__BIE)
/* Bit-mask for Aliased Register Access */
#define UserButton_BIT_MASK               (* (reg8 *) UserButton__BIT_MASK)
/* Bypass Enable */
#define UserButton_BYP                    (* (reg8 *) UserButton__BYP)
/* Port wide control signals */                                                   
#define UserButton_CTL                    (* (reg8 *) UserButton__CTL)
/* Drive Modes */
#define UserButton_DM0                    (* (reg8 *) UserButton__DM0) 
#define UserButton_DM1                    (* (reg8 *) UserButton__DM1)
#define UserButton_DM2                    (* (reg8 *) UserButton__DM2) 
/* Input Buffer Disable Override */
#define UserButton_INP_DIS                (* (reg8 *) UserButton__INP_DIS)
/* LCD Common or Segment Drive */
#define UserButton_LCD_COM_SEG            (* (reg8 *) UserButton__LCD_COM_SEG)
/* Enable Segment LCD */
#define UserButton_LCD_EN                 (* (reg8 *) UserButton__LCD_EN)
/* Slew Rate Control */
#define UserButton_SLW                    (* (reg8 *) UserButton__SLW)

/* DSI Port Registers */
/* Global DSI Select Register */
#define UserButton_PRTDSI__CAPS_SEL       (* (reg8 *) UserButton__PRTDSI__CAPS_SEL) 
/* Double Sync Enable */
#define UserButton_PRTDSI__DBL_SYNC_IN    (* (reg8 *) UserButton__PRTDSI__DBL_SYNC_IN) 
/* Output Enable Select Drive Strength */
#define UserButton_PRTDSI__OE_SEL0        (* (reg8 *) UserButton__PRTDSI__OE_SEL0) 
#define UserButton_PRTDSI__OE_SEL1        (* (reg8 *) UserButton__PRTDSI__OE_SEL1) 
/* Port Pin Output Select Registers */
#define UserButton_PRTDSI__OUT_SEL0       (* (reg8 *) UserButton__PRTDSI__OUT_SEL0) 
#define UserButton_PRTDSI__OUT_SEL1       (* (reg8 *) UserButton__PRTDSI__OUT_SEL1) 
/* Sync Output Enable Registers */
#define UserButton_PRTDSI__SYNC_OUT       (* (reg8 *) UserButton__PRTDSI__SYNC_OUT) 


#if defined(UserButton__INTSTAT)  /* Interrupt Registers */

    #define UserButton_INTSTAT                (* (reg8 *) UserButton__INTSTAT)
    #define UserButton_SNAP                   (* (reg8 *) UserButton__SNAP)

#endif /* Interrupt Registers */

#endif /* CY_PSOC5A... */

#endif /*  CY_PINS_UserButton_H */


/* [] END OF FILE */
