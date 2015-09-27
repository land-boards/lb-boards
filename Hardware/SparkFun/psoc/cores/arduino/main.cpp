extern "C" {
#include <project.h>
}

#include "Arduino.h"

//#define I2C      0
//#define ANALOG   1
//#define DIGITAL  2

struct SerialHelperFuncs USBUART_Helpers;
struct SerialHelperFuncs UART_Helpers;
UARTClass Serial(true, &USBUART_Helpers);
UARTClass Serial1(false, &UART_Helpers);

int main()
{
    
  CyGlobalIntEnable;  
  Bootloader_SET_RUN_TYPE(Bootloader_SCHEDULE_BTLDB);
  USBUART_FunctionAttach();
  enableUSBCDC();
  UART_FunctionAttach();
  initTimebase();
  
  setup();
    
  for(;;)
  {
    loop();    
  }
}



/* [] END OF FILE */

