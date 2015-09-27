#ifndef PSOC_WS281x_H
#define PSOC_WS281x_H

#include <Arduino.h>

enum COLOR_ORDER {RGB=0x00, GRB=0x01};
#define COLOR_ORDER_MASK 0x01
enum BIT_RATE {_400K=0x00, _800K=0x02};
#define BIT_RATE_MASK 0x02

class WS281x 
{
 public:

  WS281x(uint8_t nLEDs, uint8_t pin=0, COLOR_ORDER order=GRB,
         BIT_RATE speed=_800K);

  void begin(void);
  void end(void);

  void refresh(void);
  void setPixelColor(uint8_t LEDNum, uint8_t r, uint8_t g, uint8_t b);
  void setPixelColor(uint8_t LEDNum, uint32_t c);
  void setBrightness(uint8_t brightness);
  uint8_t getNumPixels(void);
  static uint32_t makeColor(uint8_t r, uint8_t g, uint8_t b);
  uint32_t getPixelColor(uint16_t n);

 private:

  uint16_t _numLEDs;   // Number of RGB LEDs in strip
  uint16_t _numBytes;  // Size of 'pixels' buffer below
  uint8_t _pin;        // Output pin number
  struct partInfo 
  {
    COLOR_ORDER order;
    BIT_RATE speed;
  } _type;
  uint8_t *_pixels;
  uint8_t _brightness;
};

#endif

