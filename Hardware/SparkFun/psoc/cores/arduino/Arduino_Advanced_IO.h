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

#ifndef _arduino_advanced_io
    #define _arduino_advanced_io
    
    #include <Project.h>
    
    #define MSBFIRST 0u
    #define LSBFIRST 1u
    
    uint32_t pulseIn(uint8_t pin, uint8_t level, uint32_t timeout);
    void shiftOut(uint8_t dataPin, uint8_t clockPin, uint8_t bitOrder, \
        uint8_t value);
    uint8_t shiftIn(uint8_t dataPin, uint8_t clockPin, uint8_t bitOrder);
    
#endif
/* [] END OF FILE */
