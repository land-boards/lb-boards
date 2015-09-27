/*******************************************************************************
* File Name: ADC_Mux.h
* Version 1.80
*
*  Description:
*    This file contains the constants and function prototypes for the Analog
*    Multiplexer User Module AMux.
*
*   Note:
*
********************************************************************************
* Copyright 2008-2010, Cypress Semiconductor Corporation.  All rights reserved.
* You may use this file only in accordance with the license, terms, conditions, 
* disclaimers, and limitations in the end user license agreement accompanying 
* the software package with which this file was provided.
********************************************************************************/

#if !defined(CY_AMUX_ADC_Mux_H)
#define CY_AMUX_ADC_Mux_H

#include "cytypes.h"
#include "cyfitter.h"
#include "cyfitter_cfg.h"


/***************************************
*        Function Prototypes
***************************************/

void ADC_Mux_Start(void) ;
#define ADC_Mux_Init() ADC_Mux_Start()
void ADC_Mux_FastSelect(uint8 channel) ;
/* The Stop, Select, Connect, Disconnect and DisconnectAll functions are declared elsewhere */
/* void ADC_Mux_Stop(void); */
/* void ADC_Mux_Select(uint8 channel); */
/* void ADC_Mux_Connect(uint8 channel); */
/* void ADC_Mux_Disconnect(uint8 channel); */
/* void ADC_Mux_DisconnectAll(void) */


/***************************************
*         Parameter Constants
***************************************/

#define ADC_Mux_CHANNELS  6u
#define ADC_Mux_MUXTYPE   1
#define ADC_Mux_ATMOSTONE 1

/***************************************
*             API Constants
***************************************/

#define ADC_Mux_NULL_CHANNEL 0xFFu
#define ADC_Mux_MUX_SINGLE   1
#define ADC_Mux_MUX_DIFF     2


/***************************************
*        Conditional Functions
***************************************/

#if ADC_Mux_MUXTYPE == ADC_Mux_MUX_SINGLE
# if !ADC_Mux_ATMOSTONE
#  define ADC_Mux_Connect(channel) ADC_Mux_Set(channel)
# endif
# define ADC_Mux_Disconnect(channel) ADC_Mux_Unset(channel)
#else
# if !ADC_Mux_ATMOSTONE
void ADC_Mux_Connect(uint8 channel) ;
# endif
void ADC_Mux_Disconnect(uint8 channel) ;
#endif

#if ADC_Mux_ATMOSTONE
# define ADC_Mux_Stop() ADC_Mux_DisconnectAll()
# define ADC_Mux_Select(channel) ADC_Mux_FastSelect(channel)
void ADC_Mux_DisconnectAll(void) ;
#else
# define ADC_Mux_Stop() ADC_Mux_Start()
void ADC_Mux_Select(uint8 channel) ;
# define ADC_Mux_DisconnectAll() ADC_Mux_Start()
#endif

#endif /* CY_AMUX_ADC_Mux_H */


/* [] END OF FILE */
