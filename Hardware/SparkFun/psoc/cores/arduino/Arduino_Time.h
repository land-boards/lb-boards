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

#ifndef _arduino_time_h
#define _arduino_time_h
    
#include <Project.h>
  
    #define millis() Millis_Counter_ReadCounter()
    #define micros() Micros_Counter_ReadCounter()
    
    void initTimebase(void);
    void delay(unsigned int delayms);
    void delayMicroseconds(unsigned int delayus);
    
#endif
/* [] END OF FILE */
