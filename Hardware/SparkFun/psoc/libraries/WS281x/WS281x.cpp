#include <Arduino.h>
#ifdef __cplusplus
extern "C"
{
#endif
  #include <project.h>
#ifdef __cplusplus
}
#endif
#include "WS281x.h"

WS281x::WS281x(uint8_t nLEDs, uint8_t pin, COLOR_ORDER order,
       BIT_RATE speed):
  _numLEDs(nLEDs), _pin(pin), _brightness(255)
{
  _type.order = order;
  _type.speed = speed;
  _pixels = new uint8_t [3*_numLEDs];
}

void WS281x::begin()
{
  pinMode(_pin + P0_D0, PERIPHERAL_OUT);
  WSDriver_Start();
  for (int i = 0; i < _numLEDs; i++)
  {
    WSDriver_Pixel(i, _pin, 0);
  }
  WSDriver_Dim(0);
}

void WS281x::end()
{
  WSDriver_Stop();
  pinMode(_pin + P0_D0, INPUT);
}

void WS281x::refresh()
{
  WSDriver_Trigger(1);
}

void WS281x::setPixelColor(uint8_t LEDNum, uint8_t r, uint8_t g, uint8_t b)
{
  *(_pixels+(LEDNum*3)) = r;
  *(_pixels+(LEDNum*3)+1) = g;
  *(_pixels+(LEDNum*3)+2) = b;
  uint32_t color = 0;
  if (_brightness == 0)
  {
    color = 0;
  }
  else if (_brightness == 255)
  {
    // The under-the-hood component writes the data out in the order received,
    //  so store it according to the byte order.
    if ( (_type.order & COLOR_ORDER_MASK) == RGB)
    {
      color = (r) + (g<<8) + (b<<16);
    }
    else 
    {
      color = (r<<8) + (g) + (b<<16);
    }
  }
  else
  {
    r *= _brightness;
    g *= _brightness;
    b *= _brightness;
    if ( (_type.order & COLOR_ORDER_MASK) == RGB)
    {
      color = (r) + (g<<8) + (b<<16);
    }
    else 
    {
      color = (r<<8) + (g) + (b<<16);
    }
  }
  WSDriver_Pixel(LEDNum, _pin, color);
}

void WS281x::setPixelColor(uint8_t LEDNum, uint32_t c)
{
  setPixelColor(LEDNum, (uint8_t)c>>16, (uint8_t)c>>8, (uint8_t)c);
}

void WS281x::setBrightness(uint8_t brightness)
{
  _brightness = brightness;
}

uint8_t WS281x::getNumPixels(void)
{
  return _numLEDs;
}

uint32_t WS281x::makeColor(uint8_t r, uint8_t g, uint8_t b)
{
  return (r<<16) + (g<<8) + b;
}

uint32_t WS281x::getPixelColor(uint16_t n)
{
  uint32_t color;
  color = *(_pixels+(n*3))<<16;
  color += *(_pixels+(n*3)+1)<<8;
  color += *(_pixels+(n*3)+2);
  return color;
}

