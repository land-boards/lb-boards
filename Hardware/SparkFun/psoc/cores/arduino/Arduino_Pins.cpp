/****************************************************************************
 * Arduino_Pins.cpp
 * Arduino Uno pin compatibility support for the PSoC5LP
 * Mike Hord @ SparkFun Electronics
 * 14 April 2015
 *
 * Implements the "standard" Arduino per-pin IO functionality on the PSoC5LP.
 *
 * Development environment specifics:
 * Code developed in PSoC Creator 3.1
 * Tested in Arduino IDE 1.6.3
 *
 * This code is beerware; if you see me (or any other SparkFun employee) at the
 * local, and you've found our code helpful, please buy us a round!
 * ****************************************************************************/

extern "C" {
#include <Project.h>
}

#include <Arduino_Pins.h>
#include <Arduino_Extended_IO.h>

// Map the I/O pin number to the actual address of the register as defined by
//  the IDE. These constants are mapped to the IDE constants in the header.
uint32_t pinNumberToPointer[NUM_BASE_PINS] = 
  { D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10,
    D11, D12, D13, D14, D15, D16, D17, D18, D19};
    
/* Port of the digitalWrite function used by Arduino. Includes a check to
 * ensure that the value passed is within the valid range for the aliases
 * or for the registers in question. */
void digitalWrite(uint32_t pin, uint8_t level)
{
  if ( pin < NUM_BASE_PINS )
  {
    pin = pinNumberToPointer[pin];
  }
  // See the TRM for the PSoC5LP for why these numbers were chosen.
  else if (pin < 0x40005000 || pin > 0x40005067)
  {
    return;
  }
  if (level == HIGH)
  {
    CyPins_SetPin(pin);
  }
  else
  {
    CyPins_ClearPin(pin);
  }
}
    
// See digitalWrite for explanation.
uint8_t digitalRead(uint32_t pin)
{
  if ( pin < NUM_BASE_PINS )
  {
    pin = pinNumberToPointer[pin];
  }
  else if (pin < 0x40005000 || pin > 0x40005067)
  {
    return 0;
  }
  return CyPins_ReadPin(pin);
}

/* A little more advanced than pinMode for the Arduino, as it needs to handle
 *  the case where we want to bypass the normal IO circuitry and attach the
 *  pin to the peripheral bus. */
void pinMode(uint32_t pin, enum PIN_MODE mode)
{
  if ( pin < NUM_BASE_PINS )
  {
    pin = pinNumberToPointer[pin];
  }
  else if (pin < 0x40005000 || pin > 0x40005067)
  {
    return;
  }
  uint8_t registerValue = *(reg8*)(pin);
  switch(mode)
  {
      case OUTPUT:
        registerValue &= PIN_DISABLE_BYPASS;
        registerValue |= PIN_DM_STRONG;
      break;
      case INPUT_PULLUP:
        registerValue &= PIN_DISABLE_BYPASS;
        registerValue |= PIN_DM_RES_UP;
      break;
      case PERIPHERAL:
        registerValue |= PIN_ENABLE_BYPASS;
      break;
      case PERIPHERAL_IN:
        registerValue |= PIN_ENABLE_BYPASS;
        registerValue |= PIN_DM_DIG_HIZ;
      break;
      case PERIPHERAL_OUT:
        registerValue |= PIN_ENABLE_BYPASS;
        registerValue |= PIN_DM_STRONG;
      break;
      case PERIPHERAL_OD:
        registerValue |= PIN_ENABLE_BYPASS;
        registerValue |= PIN_DM_OD_LO;
        CyPins_SetPin(pin);
      break;
      case INPUT:
      default:
        registerValue &= PIN_DISABLE_BYPASS;
        registerValue |= PIN_DM_DIG_HIZ;
      break; 
  }
  *(reg8*)(pin) = registerValue;
}

/* [] END OF FILE */
