/*******************************************************************************
* File Name: RTS.h  
* Version 2.20
*
* Description:
*  This file contains the Alias definitions for Per-Pin APIs in cypins.h. 
*  Information on using these APIs can be found in the System Reference Guide.
*
* Note:
*
********************************************************************************
* Copyright 2008-2015, Cypress Semiconductor Corporation.  All rights reserved.
* You may use this file only in accordance with the license, terms, conditions, 
* disclaimers, and limitations in the end user license agreement accompanying 
* the software package with which this file was provided.
*******************************************************************************/

#if !defined(CY_PINS_RTS_ALIASES_H) /* Pins RTS_ALIASES_H */
#define CY_PINS_RTS_ALIASES_H

#include "cytypes.h"
#include "cyfitter.h"
#include "cypins.h"


/***************************************
*              Constants        
***************************************/
#define RTS_0			(RTS__0__PC)
#define RTS_0_PS		(RTS__0__PS)
#define RTS_0_PC		(RTS__0__PC)
#define RTS_0_DR		(RTS__0__DR)
#define RTS_0_SHIFT	(RTS__0__SHIFT)
#define RTS_0_INTR	((uint16)((uint16)0x0003u << (RTS__0__SHIFT*2u)))

#define RTS_INTR_ALL	 ((uint16)(RTS_0_INTR))


#endif /* End Pins RTS_ALIASES_H */


/* [] END OF FILE */
