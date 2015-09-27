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

#ifndef _arduino_tone_h
    #define _arduino_tone_h
    
    #include <Project.h>
    
    void initTone();
    void tone(uint8_t pin, uint16_t freq, uint32_t duration);
    void noTone(uint8_t pin);
    CY_ISR_PROTO(ToneInterruptHandler);
    
#endif
/* [] END OF FILE */
