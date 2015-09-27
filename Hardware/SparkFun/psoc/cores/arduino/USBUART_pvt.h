/*******************************************************************************
* File Name: .h
* Version 2.80
*
* Description:
*  This private file provides constants and parameter values for the
*  USBFS Component.
*  Please do not use this file or its content in your project.
*
* Note:
*
********************************************************************************
* Copyright 2013-2014, Cypress Semiconductor Corporation. All rights reserved.
* You may use this file only in accordance with the license, terms, conditions,
* disclaimers, and limitations in the end user license agreement accompanying
* the software package with which this file was provided.
*******************************************************************************/

#if !defined(CY_USBFS_USBUART_pvt_H)
#define CY_USBFS_USBUART_pvt_H


/***************************************
*     Private Variables
***************************************/

/* Generated external references for descriptors*/
extern const uint8 CYCODE USBUART_DEVICE0_DESCR[18u];
extern const uint8 CYCODE USBUART_DEVICE0_CONFIGURATION0_DESCR[67u];
extern const T_USBUART_EP_SETTINGS_BLOCK CYCODE USBUART_DEVICE0_CONFIGURATION0_EP_SETTINGS_TABLE[3u];
extern const uint8 CYCODE USBUART_DEVICE0_CONFIGURATION0_INTERFACE_CLASS[2u];
extern const T_USBUART_LUT CYCODE USBUART_DEVICE0_CONFIGURATION0_TABLE[5u];
extern const T_USBUART_LUT CYCODE USBUART_DEVICE0_TABLE[2u];
extern const T_USBUART_LUT CYCODE USBUART_TABLE[1u];
extern const uint8 CYCODE USBUART_SN_STRING_DESCRIPTOR[2];
extern const uint8 CYCODE USBUART_STRING_DESCRIPTORS[159u];


extern const uint8 CYCODE USBUART_MSOS_DESCRIPTOR[USBUART_MSOS_DESCRIPTOR_LENGTH];
extern const uint8 CYCODE USBUART_MSOS_CONFIGURATION_DESCR[USBUART_MSOS_CONF_DESCR_LENGTH];
#if defined(USBUART_ENABLE_IDSN_STRING)
    extern uint8 USBUART_idSerialNumberStringDescriptor[USBUART_IDSN_DESCR_LENGTH];
#endif /* USBUART_ENABLE_IDSN_STRING */

extern volatile uint8 USBUART_interfaceNumber;
extern volatile uint8 USBUART_interfaceSetting[USBUART_MAX_INTERFACES_NUMBER];
extern volatile uint8 USBUART_interfaceSetting_last[USBUART_MAX_INTERFACES_NUMBER];
extern volatile uint8 USBUART_deviceAddress;
extern volatile uint8 USBUART_interfaceStatus[USBUART_MAX_INTERFACES_NUMBER];
extern const uint8 CYCODE *USBUART_interfaceClass;

extern volatile T_USBUART_EP_CTL_BLOCK USBUART_EP[USBUART_MAX_EP];
extern volatile T_USBUART_TD USBUART_currentTD;

#if(USBUART_EP_MM != USBUART__EP_MANUAL)
    extern uint8 USBUART_DmaChan[USBUART_MAX_EP];
    extern uint8 USBUART_DmaTd[USBUART_MAX_EP];
#endif /*  USBUART_EP_MM */
#if((USBUART_EP_MM == USBUART__EP_DMAAUTO) && (USBUART_EP_DMA_AUTO_OPT == 0u))
    extern uint8 USBUART_DmaNextTd[USBUART_MAX_EP];
    extern const uint8 USBUART_epX_TD_TERMOUT_EN[USBUART_MAX_EP];
    extern volatile uint16 USBUART_inLength[USBUART_MAX_EP];
    extern const uint8 *USBUART_inDataPointer[USBUART_MAX_EP];
    extern volatile uint8 USBUART_inBufFull[USBUART_MAX_EP];
#endif /*  ((USBUART_EP_MM == USBUART__EP_DMAAUTO) && (USBUART_EP_DMA_AUTO_OPT == 0u)) */

extern volatile uint8 USBUART_ep0Toggle;
extern volatile uint8 USBUART_lastPacketSize;
extern volatile uint8 USBUART_ep0Mode;
extern volatile uint8 USBUART_ep0Count;
extern volatile uint16 USBUART_transferByteCount;


/***************************************
*     Private Function Prototypes
***************************************/
void  USBUART_ReInitComponent(void) ;
void  USBUART_HandleSetup(void) ;
void  USBUART_HandleIN(void) ;
void  USBUART_HandleOUT(void) ;
void  USBUART_LoadEP0(void) ;
uint8 USBUART_InitControlRead(void) ;
uint8 USBUART_InitControlWrite(void) ;
void  USBUART_ControlReadDataStage(void) ;
void  USBUART_ControlReadStatusStage(void) ;
void  USBUART_ControlReadPrematureStatus(void)
                                                ;
uint8 USBUART_InitControlWrite(void) ;
uint8 USBUART_InitZeroLengthControlTransfer(void)
                                                ;
void  USBUART_ControlWriteDataStage(void) ;
void  USBUART_ControlWriteStatusStage(void) ;
void  USBUART_ControlWritePrematureStatus(void)
                                                ;
uint8 USBUART_InitNoDataControlTransfer(void) ;
void  USBUART_NoDataControlStatusStage(void) ;
void  USBUART_InitializeStatusBlock(void) ;
void  USBUART_UpdateStatusBlock(uint8 completionCode) ;
uint8 USBUART_DispatchClassRqst(void) ;

void USBUART_Config(uint8 clearAltSetting) ;
void USBUART_ConfigAltChanged(void) ;
void USBUART_ConfigReg(void) ;

const T_USBUART_LUT CYCODE *USBUART_GetConfigTablePtr(uint8 confIndex)
                                                            ;
const T_USBUART_LUT CYCODE *USBUART_GetDeviceTablePtr(void)
                                                            ;
const uint8 CYCODE *USBUART_GetInterfaceClassTablePtr(void)
                                                    ;
uint8 USBUART_ClearEndpointHalt(void) ;
uint8 USBUART_SetEndpointHalt(void) ;
uint8 USBUART_ValidateAlternateSetting(void) ;

void USBUART_SaveConfig(void) ;
void USBUART_RestoreConfig(void) ;

#if ((USBUART_EP_MM == USBUART__EP_DMAAUTO) && (USBUART_EP_DMA_AUTO_OPT == 0u))
    void USBUART_LoadNextInEP(uint8 epNumber, uint8 mode) ;
#endif /* (USBUART_EP_MM == USBUART__EP_DMAAUTO) && (USBUART_EP_DMA_AUTO_OPT == 0u) */

#if defined(USBUART_ENABLE_IDSN_STRING)
    void USBUART_ReadDieID(uint8 descr[]) ;
#endif /* USBUART_ENABLE_IDSN_STRING */

#if defined(USBUART_ENABLE_HID_CLASS)
    uint8 USBUART_DispatchHIDClassRqst(void);
#endif /*  USBUART_ENABLE_HID_CLASS */
#if defined(USBUART_ENABLE_AUDIO_CLASS)
    uint8 USBUART_DispatchAUDIOClassRqst(void);
#endif /*  USBUART_ENABLE_HID_CLASS */
#if defined(USBUART_ENABLE_CDC_CLASS)
    uint8 USBUART_DispatchCDCClassRqst(void);
#endif /*  USBUART_ENABLE_CDC_CLASS */

CY_ISR_PROTO(USBUART_EP_0_ISR);
#if(USBUART_EP1_ISR_REMOVE == 0u)
    CY_ISR_PROTO(USBUART_EP_1_ISR);
#endif /*  USBUART_EP1_ISR_REMOVE */
#if(USBUART_EP2_ISR_REMOVE == 0u)
    CY_ISR_PROTO(USBUART_EP_2_ISR);
#endif /*  USBUART_EP2_ISR_REMOVE */
#if(USBUART_EP3_ISR_REMOVE == 0u)
    CY_ISR_PROTO(USBUART_EP_3_ISR);
#endif /*  USBUART_EP3_ISR_REMOVE */
#if(USBUART_EP4_ISR_REMOVE == 0u)
    CY_ISR_PROTO(USBUART_EP_4_ISR);
#endif /*  USBUART_EP4_ISR_REMOVE */
#if(USBUART_EP5_ISR_REMOVE == 0u)
    CY_ISR_PROTO(USBUART_EP_5_ISR);
#endif /*  USBUART_EP5_ISR_REMOVE */
#if(USBUART_EP6_ISR_REMOVE == 0u)
    CY_ISR_PROTO(USBUART_EP_6_ISR);
#endif /*  USBUART_EP6_ISR_REMOVE */
#if(USBUART_EP7_ISR_REMOVE == 0u)
    CY_ISR_PROTO(USBUART_EP_7_ISR);
#endif /*  USBUART_EP7_ISR_REMOVE */
#if(USBUART_EP8_ISR_REMOVE == 0u)
    CY_ISR_PROTO(USBUART_EP_8_ISR);
#endif /*  USBUART_EP8_ISR_REMOVE */
CY_ISR_PROTO(USBUART_BUS_RESET_ISR);
#if(USBUART_SOF_ISR_REMOVE == 0u)
    CY_ISR_PROTO(USBUART_SOF_ISR);
#endif /*  USBUART_SOF_ISR_REMOVE */
#if(USBUART_EP_MM != USBUART__EP_MANUAL)
    CY_ISR_PROTO(USBUART_ARB_ISR);
#endif /*  USBUART_EP_MM */
#if(USBUART_DP_ISR_REMOVE == 0u)
    CY_ISR_PROTO(USBUART_DP_ISR);
#endif /*  USBUART_DP_ISR_REMOVE */
#if ((USBUART_EP_MM == USBUART__EP_DMAAUTO) && (USBUART_EP_DMA_AUTO_OPT == 0u))
    CY_ISR_PROTO(USBUART_EP_DMA_DONE_ISR);
#endif /* (USBUART_EP_MM == USBUART__EP_DMAAUTO) && (USBUART_EP_DMA_AUTO_OPT == 0u) */

/***************************************
* Request Handlers
***************************************/

uint8 USBUART_HandleStandardRqst(void) ;
uint8 USBUART_DispatchClassRqst(void) ;
uint8 USBUART_HandleVendorRqst(void) ;


/***************************************
*    HID Internal references
***************************************/

#if defined(USBUART_ENABLE_HID_CLASS)
    void USBUART_FindReport(void) ;
    void USBUART_FindReportDescriptor(void) ;
    void USBUART_FindHidClassDecriptor(void) ;
#endif /* USBUART_ENABLE_HID_CLASS */


/***************************************
*    MIDI Internal references
***************************************/

#if defined(USBUART_ENABLE_MIDI_STREAMING)
    void USBUART_MIDI_IN_EP_Service(void) ;
#endif /* USBUART_ENABLE_MIDI_STREAMING */


#endif /* CY_USBFS_USBUART_pvt_H */


/* [] END OF FILE */
