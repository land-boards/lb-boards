/*******************************************************************************
* File Name: PWM_Reg_10.h  
* Version 1.80
*
* Description:
*  This file containts Control Register function prototypes and register defines
*
* Note:
*
********************************************************************************
* Copyright 2008-2015, Cypress Semiconductor Corporation.  All rights reserved.
* You may use this file only in accordance with the license, terms, conditions, 
* disclaimers, and limitations in the end user license agreement accompanying 
* the software package with which this file was provided.
*******************************************************************************/

#if !defined(CY_CONTROL_REG_PWM_Reg_10_H) /* CY_CONTROL_REG_PWM_Reg_10_H */
#define CY_CONTROL_REG_PWM_Reg_10_H

#include "cytypes.h"

    
/***************************************
*     Data Struct Definitions
***************************************/

/* Sleep Mode API Support */
typedef struct
{
    uint8 controlState;

} PWM_Reg_10_BACKUP_STRUCT;


/***************************************
*         Function Prototypes 
***************************************/

void    PWM_Reg_10_Write(uint8 control) ;
uint8   PWM_Reg_10_Read(void) ;

void PWM_Reg_10_SaveConfig(void) ;
void PWM_Reg_10_RestoreConfig(void) ;
void PWM_Reg_10_Sleep(void) ; 
void PWM_Reg_10_Wakeup(void) ;


/***************************************
*            Registers        
***************************************/

/* Control Register */
#define PWM_Reg_10_Control        (* (reg8 *) PWM_Reg_10_Sync_ctrl_reg__CONTROL_REG )
#define PWM_Reg_10_Control_PTR    (  (reg8 *) PWM_Reg_10_Sync_ctrl_reg__CONTROL_REG )

#endif /* End CY_CONTROL_REG_PWM_Reg_10_H */


/* [] END OF FILE */
