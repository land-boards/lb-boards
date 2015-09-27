/*******************************************************************************
* File Name: I2C_Enable.h  
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

#if !defined(CY_CONTROL_REG_I2C_Enable_H) /* CY_CONTROL_REG_I2C_Enable_H */
#define CY_CONTROL_REG_I2C_Enable_H

#include "cytypes.h"

    
/***************************************
*     Data Struct Definitions
***************************************/

/* Sleep Mode API Support */
typedef struct
{
    uint8 controlState;

} I2C_Enable_BACKUP_STRUCT;


/***************************************
*         Function Prototypes 
***************************************/

void    I2C_Enable_Write(uint8 control) ;
uint8   I2C_Enable_Read(void) ;

void I2C_Enable_SaveConfig(void) ;
void I2C_Enable_RestoreConfig(void) ;
void I2C_Enable_Sleep(void) ; 
void I2C_Enable_Wakeup(void) ;


/***************************************
*            Registers        
***************************************/

/* Control Register */
#define I2C_Enable_Control        (* (reg8 *) I2C_Enable_Sync_ctrl_reg__CONTROL_REG )
#define I2C_Enable_Control_PTR    (  (reg8 *) I2C_Enable_Sync_ctrl_reg__CONTROL_REG )

#endif /* End CY_CONTROL_REG_I2C_Enable_H */


/* [] END OF FILE */
