#ifndef __arduino_h_
#define __arduino_h_
  

extern "C" {
#include <project.h>
}

#include "Arduino_HW_Interrupt.h"
#include "Arduino_Advanced_IO.h"
#include "Arduino_Analog_In.h"
#include "Arduino_Analog_Out.h"
#include "Arduino_Pins.h"
#include "Arduino_Random.h"
#include "Arduino_Time.h"
#include "Arduino_Tone.h"
#include "Arduino_Serial.h"
#include "Wstring.h"
#include "UARTClass.h"
#include "Stream.h"
#include "avr/pgmspace.h"
#include "Arduino_Extended_IO.h"
#include <math.h>
#include <pins_arduino.h>

void setup();
void loop();
long map(long, long, long, long, long);
long constrain(long, long, long);
long min(long, long);
long max(long, long);

extern UARTClass Serial;
extern UARTClass Serial1;

#define boolean bool
#define byte uint8_t
#define PI 3.1415
#define _BV(bit) (1 << (bit))
#define F_CPU 16000000L
#define Bootloader_SCHEDULE_BTLDR   (0x40u)
#define Bootloader_SCHEDULE_BTLDB   (0x80u)
#define Bootloader_RESET_SR0_REG    (* (reg8 *) CYREG_RESET_SR0)
#define Bootloader_SET_RUN_TYPE(x)  (Bootloader_RESET_SR0_REG = (x))

#endif
/* [] END OF FILE */

