#ifndef _arduino_hw_int_h_
#define _arduino_hw_int_h_


enum HW_INT_MODE {DISABLE = 0, 
                  RISING = 1,
                  FALLING = 2,
                  CHANGE = 3};
  
void attachInterrupt(int interrupt, void (*isr)(), enum HW_INT_MODE mode);
void detachInterrupt(int interrupt);

#endif
  
