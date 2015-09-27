/*
  Copyright (c) 2011 Arduino.  All right reserved.

  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
  See the GNU Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with this library; if not, write to the Free Software
  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*/

#ifndef _UART_CLASS_
#define _UART_CLASS_

#include "HardwareSerial.h"
#include <stdbool.h>
#include <Project.h>

struct SerialHelperFuncs
{
  int16_t (*bufferSize)(void);
  bool (*portEnable)(void);
  void (*portDisable)(void);
  void (*clockAdjust)(uint16_t newDivider);
  void (*sendData)(const uint8_t* buffer, uint16_t size);
  uint16_t (*getData)(uint8_t* buffer, uint16_t size);
  char (*peekData)(void);
  void (*blockForWriteComplete)(void);
  uint8_t (*blockForReadyToWrite)(void);
};
  

class UARTClass : public HardwareSerial
{
  public:
    UARTClass(bool isUSB, SerialHelperFuncs *helpers);
    ~UARTClass(){}
    void begin(const uint32_t dwBaudRate);
    void end(void);
    int available(void);
    int peek(void);
    int read(void);
    void flush(void);
    uint8_t buffer(void);
    size_t write(const uint8_t c);
    using Print::write; // pull in write(str) and write(buf, size) from Print

    operator bool() { return _portIsActive; };

  private:
    bool _isUSB;
    uint32_t _baudRate;
    bool _portIsActive;
    SerialHelperFuncs *_myHelpers;
    uint8_t _appBuffer[64];
    int8_t _appBuffSize;   
    int8_t _appBuffIndex;
    uint16_t _timeout;
};

#endif // _UART_CLASS_
