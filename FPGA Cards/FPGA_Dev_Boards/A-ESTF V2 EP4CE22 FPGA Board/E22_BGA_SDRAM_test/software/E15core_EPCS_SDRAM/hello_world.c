//A-ESTF core Board
//test SDRAM ,if test OK £¬LED8 will light

#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "alt_types.h"


int main (void) __attribute__ ((weak, alias ("alt_main")));

      
int alt_main (void)
{
  alt_u8 led = 0x2;
  alt_u8 dir = 0;
  volatile int i;
     
  while (1) 
  {
    if (led & 0x81) 
    {
      dir = (dir ^ 0x1);
    }

    if (dir) 
    {
      led = led >> 1;
    } 
    else 
    {
      led = led << 1;
    }
    IOWR_ALTERA_AVALON_PIO_DATA(LED_BASE, led);
 
    i = 0;
    while (i<20000)
      i++;
  }

  return 0;
}

