/*******************************************************************************
* File Name: SPI_MODE_REG.h  
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

#if !defined(CY_CONTROL_REG_SPI_MODE_REG_H) /* CY_CONTROL_REG_SPI_MODE_REG_H */
#define CY_CONTROL_REG_SPI_MODE_REG_H

#include "cytypes.h"

    
/***************************************
*     Data Struct Definitions
***************************************/

/* Sleep Mode API Support */
typedef struct
{
    uint8 controlState;

} SPI_MODE_REG_BACKUP_STRUCT;


/***************************************
*         Function Prototypes 
***************************************/

void    SPI_MODE_REG_Write(uint8 control) ;
uint8   SPI_MODE_REG_Read(void) ;

void SPI_MODE_REG_SaveConfig(void) ;
void SPI_MODE_REG_RestoreConfig(void) ;
void SPI_MODE_REG_Sleep(void) ; 
void SPI_MODE_REG_Wakeup(void) ;


/***************************************
*            Registers        
***************************************/

/* Control Register */
#define SPI_MODE_REG_Control        (* (reg8 *) SPI_MODE_REG_Sync_ctrl_reg__CONTROL_REG )
#define SPI_MODE_REG_Control_PTR    (  (reg8 *) SPI_MODE_REG_Sync_ctrl_reg__CONTROL_REG )

#endif /* End CY_CONTROL_REG_SPI_MODE_REG_H */


/* [] END OF FILE */
