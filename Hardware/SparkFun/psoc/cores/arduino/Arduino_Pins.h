#ifndef _arduino_pins_h
#define _arduino_pins_h
  
#include <stdint.h>
#include <Project.h>
#include <Arduino_Extended_IO.h>

#define NUM_BASE_PINS 20

#define D0 DA_0 
#define D1 DA_1 
#define D2 DA_2 
#define D3 DA_3 
#define D4 DA_4 
#define D5 DA_5 
#define D6 DA_6 
#define D7 DA_7 
#define D8 DB_0 
#define D9 DB_1 
#define D10 DB_2
#define D11 DB_3
#define D12 DB_4
#define D13 DB_5
#define D14 A_0
#define D15 A_1
#define D16 A_2
#define D17 A_3
#define D18 A_4
#define D19 A_5
#define A0 D14 
#define A1 D15 
#define A2 D16 
#define A3 D17 
#define A4 D18 
#define A5 D19
  
#define P1_D2 UserButton_0


#define HIGH 1u
#define LOW 0u

enum PIN_MODE {OUTPUT, INPUT, INPUT_PULLUP, PERIPHERAL, PERIPHERAL_OUT,
               PERIPHERAL_IN, PERIPHERAL_OD};
enum BYPASS_MODE {PIN_ENABLE_BYPASS = 0x80, PIN_DISABLE_BYPASS = 0x7f};

extern uint32_t pinNameToPointers[NUM_BASE_PINS];

void digitalWrite(uint32_t pin, uint8_t level);
void pinMode(uint32_t pin, enum PIN_MODE mode);
uint8_t digitalRead(uint32_t pin);
  
#endif

/* [] END OF FILE */
