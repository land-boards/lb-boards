/*******************************************************************************
* File Name: DA.h  
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

#if !defined(CY_PINS_DA_H) /* Pins DA_H */
#define CY_PINS_DA_H

#include "cytypes.h"
#include "cyfitter.h"
#include "cypins.h"
#include "DA_aliases.h"

/* Check to see if required defines such as CY_PSOC5A are available */
/* They are defined starting with cy_boot v3.0 */
#if !defined (CY_PSOC5A)
    #error Component cy_pins_v2_10 requires cy_boot v3.0 or later
#endif /* (CY_PSOC5A) */

/* APIs are not generated for P15[7:6] */
#if !(CY_PSOC5A &&\
	 DA__PORT == 15 && ((DA__MASK & 0xC0) != 0))


/***************************************
*        Function Prototypes             
***************************************/    

void    DA_Write(uint8 value) ;
void    DA_SetDriveMode(uint8 mode) ;
uint8   DA_ReadDataReg(void) ;
uint8   DA_Read(void) ;
uint8   DA_ClearInterrupt(void) ;


/***************************************
*           API Constants        
***************************************/

/* Drive Modes */
#define DA_DM_ALG_HIZ         PIN_DM_ALG_HIZ
#define DA_DM_DIG_HIZ         PIN_DM_DIG_HIZ
#define DA_DM_RES_UP          PIN_DM_RES_UP
#define DA_DM_RES_DWN         PIN_DM_RES_DWN
#define DA_DM_OD_LO           PIN_DM_OD_LO
#define DA_DM_OD_HI           PIN_DM_OD_HI
#define DA_DM_STRONG          PIN_DM_STRONG
#define DA_DM_RES_UPDWN       PIN_DM_RES_UPDWN

/* Digital Port Constants */
#define DA_MASK               DA__MASK
#define DA_SHIFT              DA__SHIFT
#define DA_WIDTH              8u


/***************************************
*             Registers        
***************************************/

/* Main Port Registers */
/* Pin State */
#define DA_PS                     (* (reg8 *) DA__PS)
/* Data Register */
#define DA_DR                     (* (reg8 *) DA__DR)
/* Port Number */
#define DA_PRT_NUM                (* (reg8 *) DA__PRT) 
/* Connect to Analog Globals */                                                  
#define DA_AG                     (* (reg8 *) DA__AG)                       
/* Analog MUX bux enable */
#define DA_AMUX                   (* (reg8 *) DA__AMUX) 
/* Bidirectional Enable */                                                        
#define DA_BIE                    (* (reg8 *) DA__BIE)
/* Bit-mask for Aliased Register Access */
#define DA_BIT_MASK               (* (reg8 *) DA__BIT_MASK)
/* Bypass Enable */
#define DA_BYP                    (* (reg8 *) DA__BYP)
/* Port wide control signals */                                                   
#define DA_CTL                    (* (reg8 *) DA__CTL)
/* Drive Modes */
#define DA_DM0                    (* (reg8 *) DA__DM0) 
#define DA_DM1                    (* (reg8 *) DA__DM1)
#define DA_DM2                    (* (reg8 *) DA__DM2) 
/* Input Buffer Disable Override */
#define DA_INP_DIS                (* (reg8 *) DA__INP_DIS)
/* LCD Common or Segment Drive */
#define DA_LCD_COM_SEG            (* (reg8 *) DA__LCD_COM_SEG)
/* Enable Segment LCD */
#define DA_LCD_EN                 (* (reg8 *) DA__LCD_EN)
/* Slew Rate Control */
#define DA_SLW                    (* (reg8 *) DA__SLW)

/* DSI Port Registers */
/* Global DSI Select Register */
#define DA_PRTDSI__CAPS_SEL       (* (reg8 *) DA__PRTDSI__CAPS_SEL) 
/* Double Sync Enable */
#define DA_PRTDSI__DBL_SYNC_IN    (* (reg8 *) DA__PRTDSI__DBL_SYNC_IN) 
/* Output Enable Select Drive Strength */
#define DA_PRTDSI__OE_SEL0        (* (reg8 *) DA__PRTDSI__OE_SEL0) 
#define DA_PRTDSI__OE_SEL1        (* (reg8 *) DA__PRTDSI__OE_SEL1) 
/* Port Pin Output Select Registers */
#define DA_PRTDSI__OUT_SEL0       (* (reg8 *) DA__PRTDSI__OUT_SEL0) 
#define DA_PRTDSI__OUT_SEL1       (* (reg8 *) DA__PRTDSI__OUT_SEL1) 
/* Sync Output Enable Registers */
#define DA_PRTDSI__SYNC_OUT       (* (reg8 *) DA__PRTDSI__SYNC_OUT) 


#if defined(DA__INTSTAT)  /* Interrupt Registers */

    #define DA_INTSTAT                (* (reg8 *) DA__INTSTAT)
    #define DA_SNAP                   (* (reg8 *) DA__SNAP)

#endif /* Interrupt Registers */

#endif /* CY_PSOC5A... */

#endif /*  CY_PINS_DA_H */


/* [] END OF FILE */
