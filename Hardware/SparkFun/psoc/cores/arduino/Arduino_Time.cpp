/* ========================================
 *
 * Copyright YOUR COMPANY, THE YEAR
 * All Rights Reserved
 * UNPUBLISHED, LICENSED SOFTWARE.
 *
 * CONFIDENTIAL AND PROPRIETARY INFORMATION
 * WHICH IS THE PROPERTY OF your company.
 *
 * ========================================
*/

extern "C" {
#include <Project.h>
}
#include <Arduino_Time.h>
#include <Arduino.h>
#include <UARTClass.h>

static void exitToBootloader(void);
CY_ISR_PROTO(BootloaderReset_ISR);

void initTimebase(void)
{
    Micros_Counter_Start();
    Millis_Counter_Start();
    BootloaderResetTimer_Start();
    BootloaderResetInterrupt_StartEx(BootloaderReset_ISR);
}

void delay(unsigned int delayms)
{
  CyDelay(delayms);
}

void delayMicroseconds(unsigned int delayus)
{
  CyDelayUs(delayus);
}

CY_ISR(BootloaderReset_ISR)
{
  BootloaderResetInterrupt_ClearPending();         
  if(USBUART_GetConfiguration() != 0u)
  {
    if(USBUART_DataIsReady() != 0u)
    {   
      Serial.buffer();
    }  
  }
  if (USBUART_GetDTERate() == 1200)
  {
    exitToBootloader();
  }
}

void exitToBootloader(void)
{
  Bootloader_SET_RUN_TYPE(Bootloader_SCHEDULE_BTLDR);
  CySoftwareReset();
}


/* [] END OF FILE */

