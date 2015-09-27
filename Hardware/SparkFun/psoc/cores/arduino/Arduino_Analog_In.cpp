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

#include <Arduino_Analog_In.h>

void initAnalogInput()
{
    ADC_Mux_Start();
    ADC_Start();
}

uint16_t analogRead(uint8_t pin)
{
    if (pin > 19 || pin < 14) return 0;
    ADC_Mux_Select(pin-14);
    ADC_StartConvert();
    ADC_IsEndConversion(ADC_WAIT_FOR_RESULT);
    return ADC_GetResult16();
}

/* [] END OF FILE */
