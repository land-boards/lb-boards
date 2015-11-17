/*******************************************************************************
* File Name: MISO.h  
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

#if !defined(CY_PINS_MISO_H) /* Pins MISO_H */
#define CY_PINS_MISO_H

#include "cytypes.h"
#include "cyfitter.h"
#include "cypins.h"
#include "MISO_aliases.h"

/* Check to see if required defines such as CY_PSOC5A are available */
/* They are defined starting with cy_boot v3.0 */
#if !defined (CY_PSOC5A)
    #error Component cy_pins_v2_10 requires cy_boot v3.0 or later
#endif /* (CY_PSOC5A) */

/* APIs are not generated for P15[7:6] */
#if !(CY_PSOC5A &&\
	 MISO__PORT == 15 && ((MISO__MASK & 0xC0) != 0))


/***************************************
*        Function Prototypes             
***************************************/    

void    MISO_Write(uint8 value) ;
void    MISO_SetDriveMode(uint8 mode) ;
uint8   MISO_ReadDataReg(void) ;
uint8   MISO_Read(void) ;
uint8   MISO_ClearInterrupt(void) ;


/***************************************
*           API Constants        
***************************************/

/* Drive Modes */
#define MISO_DM_ALG_HIZ         PIN_DM_ALG_HIZ
#define MISO_DM_DIG_HIZ         PIN_DM_DIG_HIZ
#define MISO_DM_RES_UP          PIN_DM_RES_UP
#define MISO_DM_RES_DWN         PIN_DM_RES_DWN
#define MISO_DM_OD_LO           PIN_DM_OD_LO
#define MISO_DM_OD_HI           PIN_DM_OD_HI
#define MISO_DM_STRONG          PIN_DM_STRONG
#define MISO_DM_RES_UPDWN       PIN_DM_RES_UPDWN

/* Digital Port Constants */
#define MISO_MASK               MISO__MASK
#define MISO_SHIFT              MISO__SHIFT
#define MISO_WIDTH              1u


/***************************************
*             Registers        
***************************************/

/* Main Port Registers */
/* Pin State */
#define MISO_PS                     (* (reg8 *) MISO__PS)
/* Data Register */
#define MISO_DR                     (* (reg8 *) MISO__DR)
/* Port Number */
#define MISO_PRT_NUM                (* (reg8 *) MISO__PRT) 
/* Connect to Analog Globals */                                                  
#define MISO_AG                     (* (reg8 *) MISO__AG)                       
/* Analog MUX bux enable */
#define MISO_AMUX                   (* (reg8 *) MISO__AMUX) 
/* Bidirectional Enable */                                                        
#define MISO_BIE                    (* (reg8 *) MISO__BIE)
/* Bit-mask for Aliased Register Access */
#define MISO_BIT_MASK               (* (reg8 *) MISO__BIT_MASK)
/* Bypass Enable */
#define MISO_BYP                    (* (reg8 *) MISO__BYP)
/* Port wide control signals */                                                   
#define MISO_CTL                    (* (reg8 *) MISO__CTL)
/* Drive Modes */
#define MISO_DM0                    (* (reg8 *) MISO__DM0) 
#define MISO_DM1                    (* (reg8 *) MISO__DM1)
#define MISO_DM2                    (* (reg8 *) MISO__DM2) 
/* Input Buffer Disable Override */
#define MISO_INP_DIS                (* (reg8 *) MISO__INP_DIS)
/* LCD Common or Segment Drive */
#define MISO_LCD_COM_SEG            (* (reg8 *) MISO__LCD_COM_SEG)
/* Enable Segment LCD */
#define MISO_LCD_EN                 (* (reg8 *) MISO__LCD_EN)
/* Slew Rate Control */
#define MISO_SLW                    (* (reg8 *) MISO__SLW)

/* DSI Port Registers */
/* Global DSI Select Register */
#define MISO_PRTDSI__CAPS_SEL       (* (reg8 *) MISO__PRTDSI__CAPS_SEL) 
/* Double Sync Enable */
#define MISO_PRTDSI__DBL_SYNC_IN    (* (reg8 *) MISO__PRTDSI__DBL_SYNC_IN) 
/* Output Enable Select Drive Strength */
#define MISO_PRTDSI__OE_SEL0        (* (reg8 *) MISO__PRTDSI__OE_SEL0) 
#define MISO_PRTDSI__OE_SEL1        (* (reg8 *) MISO__PRTDSI__OE_SEL1) 
/* Port Pin Output Select Registers */
#define MISO_PRTDSI__OUT_SEL0       (* (reg8 *) MISO__PRTDSI__OUT_SEL0) 
#define MISO_PRTDSI__OUT_SEL1       (* (reg8 *) MISO__PRTDSI__OUT_SEL1) 
/* Sync Output Enable Registers */
#define MISO_PRTDSI__SYNC_OUT       (* (reg8 *) MISO__PRTDSI__SYNC_OUT) 


#if defined(MISO__INTSTAT)  /* Interrupt Registers */

    #define MISO_INTSTAT                (* (reg8 *) MISO__INTSTAT)
    #define MISO_SNAP                   (* (reg8 *) MISO__SNAP)

#endif /* Interrupt Registers */

#endif /* CY_PSOC5A... */

#endif /*  CY_PINS_MISO_H */


/* [] END OF FILE */
