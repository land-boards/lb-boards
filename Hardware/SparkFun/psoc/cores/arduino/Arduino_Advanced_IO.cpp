extern "C" {
#include <Project.h>
}

#include <stdint.h>
#include "Arduino_Advanced_IO.h"
#include <Arduino.h>
#include "Arduino_Time.h"

uint32_t pulseIn(uint8_t pin, uint8_t level, uint32_t timeout)
{
    pinMode(pin, INPUT);
    uint32_t clockStart = micros();
    while (digitalRead(pin) != level)
    {
        if (micros() - clockStart >= timeout) return 0;
    }
    clockStart = micros();
    while (digitalRead(pin) == level){};
    return micros() - clockStart;
}

void shiftOut(uint8_t dataPin, uint8_t clockPin, uint8_t bitOrder, \
    uint8_t value)
{
    pinMode(dataPin, OUTPUT);
    pinMode(clockPin, OUTPUT);
    uint8_t i;
    if (bitOrder == LSBFIRST)
    {
        for(i = 0; i<8; i++)
        {
            if (value>>i & 0x01) digitalWrite(dataPin, HIGH);
            else                 digitalWrite(dataPin, LOW);
            digitalWrite(clockPin, digitalRead(clockPin) ^ 0x01);
            digitalWrite(clockPin, digitalRead(clockPin) ^ 0x01);
        }
    }
    else
    {
        for(i = 0; i<8; i++)
        {
            if (value<<i & 0x80) digitalWrite(dataPin, HIGH);
            else                 digitalWrite(dataPin, LOW);
            digitalWrite(clockPin, digitalRead(clockPin) ^ 0x01);
            digitalWrite(clockPin, digitalRead(clockPin) ^ 0x01);
        }
    }
}

uint8_t shiftIn(uint8_t dataPin, uint8_t clockPin, uint8_t bitOrder)
{
    pinMode(dataPin, INPUT);
    pinMode(clockPin, OUTPUT);
    uint8_t i;
    uint8_t rxByte = 0;
    if (bitOrder == LSBFIRST)
    {
        for(i = 0; i<8; i++)
        {
            rxByte = rxByte << 1;
            if (digitalRead(dataPin)) rxByte |= 0x01;
            digitalWrite(clockPin, digitalRead(clockPin) ^ 0x01);
            digitalWrite(clockPin, digitalRead(clockPin) ^ 0x01);
        }
    }
    else
    {
        for(i = 0; i<8; i++)
        {
            rxByte = rxByte >> 1;
            if (digitalRead(dataPin)) rxByte |= 0x80;
            digitalWrite(clockPin, digitalRead(clockPin) ^ 0x01);
            digitalWrite(clockPin, digitalRead(clockPin) ^ 0x01);
        }
    }
    return rxByte;
}
/* [] END OF FILE */
