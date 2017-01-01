/*******************************************************************************
* File Name: SS.h  
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

#if !defined(CY_PINS_SS_H) /* Pins SS_H */
#define CY_PINS_SS_H

#include "cytypes.h"
#include "cyfitter.h"
#include "cypins.h"
#include "SS_aliases.h"

/* Check to see if required defines such as CY_PSOC5A are available */
/* They are defined starting with cy_boot v3.0 */
#if !defined (CY_PSOC5A)
    #error Component cy_pins_v2_10 requires cy_boot v3.0 or later
#endif /* (CY_PSOC5A) */

/* APIs are not generated for P15[7:6] */
#if !(CY_PSOC5A &&\
	 SS__PORT == 15 && ((SS__MASK & 0xC0) != 0))


/***************************************
*        Function Prototypes             
***************************************/    

void    SS_Write(uint8 value) ;
void    SS_SetDriveMode(uint8 mode) ;
uint8   SS_ReadDataReg(void) ;
uint8   SS_Read(void) ;
uint8   SS_ClearInterrupt(void) ;


/***************************************
*           API Constants        
***************************************/

/* Drive Modes */
#define SS_DM_ALG_HIZ         PIN_DM_ALG_HIZ
#define SS_DM_DIG_HIZ         PIN_DM_DIG_HIZ
#define SS_DM_RES_UP          PIN_DM_RES_UP
#define SS_DM_RES_DWN         PIN_DM_RES_DWN
#define SS_DM_OD_LO           PIN_DM_OD_LO
#define SS_DM_OD_HI           PIN_DM_OD_HI
#define SS_DM_STRONG          PIN_DM_STRONG
#define SS_DM_RES_UPDWN       PIN_DM_RES_UPDWN

/* Digital Port Constants */
#define SS_MASK               SS__MASK
#define SS_SHIFT              SS__SHIFT
#define SS_WIDTH              1u


/***************************************
*             Registers        
***************************************/

/* Main Port Registers */
/* Pin State */
#define SS_PS                     (* (reg8 *) SS__PS)
/* Data Register */
#define SS_DR                     (* (reg8 *) SS__DR)
/* Port Number */
#define SS_PRT_NUM                (* (reg8 *) SS__PRT) 
/* Connect to Analog Globals */                                                  
#define SS_AG                     (* (reg8 *) SS__AG)                       
/* Analog MUX bux enable */
#define SS_AMUX                   (* (reg8 *) SS__AMUX) 
/* Bidirectional Enable */                                                        
#define SS_BIE                    (* (reg8 *) SS__BIE)
/* Bit-mask for Aliased Register Access */
#define SS_BIT_MASK               (* (reg8 *) SS__BIT_MASK)
/* Bypass Enable */
#define SS_BYP                    (* (reg8 *) SS__BYP)
/* Port wide control signals */                                                   
#define SS_CTL                    (* (reg8 *) SS__CTL)
/* Drive Modes */
#define SS_DM0                    (* (reg8 *) SS__DM0) 
#define SS_DM1                    (* (reg8 *) SS__DM1)
#define SS_DM2                    (* (reg8 *) SS__DM2) 
/* Input Buffer Disable Override */
#define SS_INP_DIS                (* (reg8 *) SS__INP_DIS)
/* LCD Common or Segment Drive */
#define SS_LCD_COM_SEG            (* (reg8 *) SS__LCD_COM_SEG)
/* Enable Segment LCD */
#define SS_LCD_EN                 (* (reg8 *) SS__LCD_EN)
/* Slew Rate Control */
#define SS_SLW                    (* (reg8 *) SS__SLW)

/* DSI Port Registers */
/* Global DSI Select Register */
#define SS_PRTDSI__CAPS_SEL       (* (reg8 *) SS__PRTDSI__CAPS_SEL) 
/* Double Sync Enable */
#define SS_PRTDSI__DBL_SYNC_IN    (* (reg8 *) SS__PRTDSI__DBL_SYNC_IN) 
/* Output Enable Select Drive Strength */
#define SS_PRTDSI__OE_SEL0        (* (reg8 *) SS__PRTDSI__OE_SEL0) 
#define SS_PRTDSI__OE_SEL1        (* (reg8 *) SS__PRTDSI__OE_SEL1) 
/* Port Pin Output Select Registers */
#define SS_PRTDSI__OUT_SEL0       (* (reg8 *) SS__PRTDSI__OUT_SEL0) 
#define SS_PRTDSI__OUT_SEL1       (* (reg8 *) SS__PRTDSI__OUT_SEL1) 
/* Sync Output Enable Registers */
#define SS_PRTDSI__SYNC_OUT       (* (reg8 *) SS__PRTDSI__SYNC_OUT) 


#if defined(SS__INTSTAT)  /* Interrupt Registers */

    #define SS_INTSTAT                (* (reg8 *) SS__INTSTAT)
    #define SS_SNAP                   (* (reg8 *) SS__SNAP)

#endif /* Interrupt Registers */

#endif /* CY_PSOC5A... */

#endif /*  CY_PINS_SS_H */


/* [] END OF FILE */
