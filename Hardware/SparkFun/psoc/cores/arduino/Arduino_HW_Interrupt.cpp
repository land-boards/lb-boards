extern "C" {
#include <project.h>
}

#include "Arduino.h"
#include "Arduino_HW_Interrupt.h"
#include <cydevice_trm.h>

void (*INT0Function)(void);
void (*INT1Function)(void);

#define INT0_MASK 0x04
#define INT1_MASK 0x08

CY_ISR_PROTO(HW_INT_ISR);

void attachInterrupt(int interrupt, void (*isr)(), enum HW_INT_MODE mode)
{
  uint8_t intStat = *(uint8_t*)CYREG_PICU2_INTSTAT;
  if (intStat == 0);
  if (interrupt == 0)
  {
    *(uint8_t*)CYREG_PICU2_INTTYPE2 = mode & 0x03;
    INT0Function = isr;
  }
  else if (interrupt == 1)
  {
    *(uint8_t*)CYREG_PICU2_INTTYPE3 = mode & 0x03;
    INT1Function = isr;
  }    
  HW_INT_StartEx(HW_INT_ISR);
}

void detachInterrupt(int interrupt)
{
  if (interrupt == 0)
  {
    *(uint8_t*)CYREG_PICU2_INTTYPE2 = DISABLE;
  }
  else if (interrupt == 1)
  {
    *(uint8_t*)CYREG_PICU2_INTTYPE3 = DISABLE;
  }
}

CY_ISR(HW_INT_ISR)
{
  uint8_t intStat = *(uint8_t*)CYREG_PICU2_INTSTAT;
  if ((intStat & INT0_MASK) != 0)
  {
    INT0Function();
  }
  if ((intStat & INT1_MASK) != 0)
  {
    INT1Function();
  }
}

