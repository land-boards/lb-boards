/*******************************************************************************
* File Name: MOSI.h  
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

#if !defined(CY_PINS_MOSI_H) /* Pins MOSI_H */
#define CY_PINS_MOSI_H

#include "cytypes.h"
#include "cyfitter.h"
#include "cypins.h"
#include "MOSI_aliases.h"

/* Check to see if required defines such as CY_PSOC5A are available */
/* They are defined starting with cy_boot v3.0 */
#if !defined (CY_PSOC5A)
    #error Component cy_pins_v2_10 requires cy_boot v3.0 or later
#endif /* (CY_PSOC5A) */

/* APIs are not generated for P15[7:6] */
#if !(CY_PSOC5A &&\
	 MOSI__PORT == 15 && ((MOSI__MASK & 0xC0) != 0))


/***************************************
*        Function Prototypes             
***************************************/    

void    MOSI_Write(uint8 value) ;
void    MOSI_SetDriveMode(uint8 mode) ;
uint8   MOSI_ReadDataReg(void) ;
uint8   MOSI_Read(void) ;
uint8   MOSI_ClearInterrupt(void) ;


/***************************************
*           API Constants        
***************************************/

/* Drive Modes */
#define MOSI_DM_ALG_HIZ         PIN_DM_ALG_HIZ
#define MOSI_DM_DIG_HIZ         PIN_DM_DIG_HIZ
#define MOSI_DM_RES_UP          PIN_DM_RES_UP
#define MOSI_DM_RES_DWN         PIN_DM_RES_DWN
#define MOSI_DM_OD_LO           PIN_DM_OD_LO
#define MOSI_DM_OD_HI           PIN_DM_OD_HI
#define MOSI_DM_STRONG          PIN_DM_STRONG
#define MOSI_DM_RES_UPDWN       PIN_DM_RES_UPDWN

/* Digital Port Constants */
#define MOSI_MASK               MOSI__MASK
#define MOSI_SHIFT              MOSI__SHIFT
#define MOSI_WIDTH              1u


/***************************************
*             Registers        
***************************************/

/* Main Port Registers */
/* Pin State */
#define MOSI_PS                     (* (reg8 *) MOSI__PS)
/* Data Register */
#define MOSI_DR                     (* (reg8 *) MOSI__DR)
/* Port Number */
#define MOSI_PRT_NUM                (* (reg8 *) MOSI__PRT) 
/* Connect to Analog Globals */                                                  
#define MOSI_AG                     (* (reg8 *) MOSI__AG)                       
/* Analog MUX bux enable */
#define MOSI_AMUX                   (* (reg8 *) MOSI__AMUX) 
/* Bidirectional Enable */                                                        
#define MOSI_BIE                    (* (reg8 *) MOSI__BIE)
/* Bit-mask for Aliased Register Access */
#define MOSI_BIT_MASK               (* (reg8 *) MOSI__BIT_MASK)
/* Bypass Enable */
#define MOSI_BYP                    (* (reg8 *) MOSI__BYP)
/* Port wide control signals */                                                   
#define MOSI_CTL                    (* (reg8 *) MOSI__CTL)
/* Drive Modes */
#define MOSI_DM0                    (* (reg8 *) MOSI__DM0) 
#define MOSI_DM1                    (* (reg8 *) MOSI__DM1)
#define MOSI_DM2                    (* (reg8 *) MOSI__DM2) 
/* Input Buffer Disable Override */
#define MOSI_INP_DIS                (* (reg8 *) MOSI__INP_DIS)
/* LCD Common or Segment Drive */
#define MOSI_LCD_COM_SEG            (* (reg8 *) MOSI__LCD_COM_SEG)
/* Enable Segment LCD */
#define MOSI_LCD_EN                 (* (reg8 *) MOSI__LCD_EN)
/* Slew Rate Control */
#define MOSI_SLW                    (* (reg8 *) MOSI__SLW)

/* DSI Port Registers */
/* Global DSI Select Register */
#define MOSI_PRTDSI__CAPS_SEL       (* (reg8 *) MOSI__PRTDSI__CAPS_SEL) 
/* Double Sync Enable */
#define MOSI_PRTDSI__DBL_SYNC_IN    (* (reg8 *) MOSI__PRTDSI__DBL_SYNC_IN) 
/* Output Enable Select Drive Strength */
#define MOSI_PRTDSI__OE_SEL0        (* (reg8 *) MOSI__PRTDSI__OE_SEL0) 
#define MOSI_PRTDSI__OE_SEL1        (* (reg8 *) MOSI__PRTDSI__OE_SEL1) 
/* Port Pin Output Select Registers */
#define MOSI_PRTDSI__OUT_SEL0       (* (reg8 *) MOSI__PRTDSI__OUT_SEL0) 
#define MOSI_PRTDSI__OUT_SEL1       (* (reg8 *) MOSI__PRTDSI__OUT_SEL1) 
/* Sync Output Enable Registers */
#define MOSI_PRTDSI__SYNC_OUT       (* (reg8 *) MOSI__PRTDSI__SYNC_OUT) 


#if defined(MOSI__INTSTAT)  /* Interrupt Registers */

    #define MOSI_INTSTAT                (* (reg8 *) MOSI__INTSTAT)
    #define MOSI_SNAP                   (* (reg8 *) MOSI__SNAP)

#endif /* Interrupt Registers */

#endif /* CY_PSOC5A... */

#endif /*  CY_PINS_MOSI_H */


/* [] END OF FILE */
