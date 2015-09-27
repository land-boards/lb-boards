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
#include <project.h>
}

#include <Arduino_Pins.h>
#include <Arduino_Analog_Out.h>

void analogWriteInit()
{
  D10_Ctrl_Write(0x00);
  D11_Ctrl_Write(0x00);
}

void analogWrite(uint32_t pin, uint8_t value)
{
  switch (pin)
  {
    case 3:
      pin = D3;
      PWM_Reg_3_Write(value);
      break;
    case 5:
      pin = D5;
      PWM_Reg_5_Write(value);
      break;
    case 6:
      pin = D6;
      PWM_Reg_6_Write(value);
      break;
    case 9:
      pin = D9;
      PWM_Reg_9_Write(value);
      break;
    case 10:
      pin = D10;
      PWM_Reg_10_Write(value);
      D10_Ctrl_Write(0x00);
      break;
    case 11:
      pin = D11;
      PWM_Reg_11_Write(value);
      D11_Ctrl_Write(0x00);
      break;
    default:
      return;
  }
      
  pinMode(pin, PERIPHERAL_OUT);
}
/* [] END OF FILE */

