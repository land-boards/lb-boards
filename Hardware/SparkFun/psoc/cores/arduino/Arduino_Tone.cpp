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
extern "C" {
#include <project.h>
}

#include <Arduino_Tone.h>
#include <Arduino_Time.h>
#include <Arduino_Pins.h>

volatile uint8_t  tonePin;          // What pin are we playing the note on?
volatile uint32_t toneLength;       // How long should the tone last?
volatile uint32_t toneStart;        // When did the tone start?
volatile uint32_t toneElapsed;      // How long have we been playing our tone?
                                    //  When this is equal to toneLength, we
                                    //  should stop playing our tone.


void initTone(void)
{
    Tone_Interrupt_StartEx(ToneInterruptHandler);
    tonePin = 255;
}

void tone(uint8_t pin, uint16_t freq, uint32_t duration)
{
    if (tonePin >= 20) return;
    tonePin = pin;
    pinMode(pin, OUTPUT);
    toneLength = duration;
    toneStart = millis();
    ToneTimer_Start();
    uint32_t period = 1000000/freq;
    ToneTimer_WritePeriod((uint16_t)period);
}

void noTone(uint8_t pin)
{
    if (pin != tonePin) return;
    ToneTimer_Stop();
    digitalWrite(tonePin, LOW);
    tonePin = 255;
}
    

CY_ISR(ToneInterruptHandler)
{
    digitalWrite(tonePin, 0x01 ^ digitalRead(tonePin));
    if (toneLength == 0) return;
    toneElapsed = millis() - toneStart;
    if (toneLength <= toneElapsed) ToneTimer_Stop();
    tonePin = 255;
}

/* [] END OF FILE */
