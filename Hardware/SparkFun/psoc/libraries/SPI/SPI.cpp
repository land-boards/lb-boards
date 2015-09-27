/*
 * Copyright (c) 2010 by Cristian Maglie <c.maglie@arduino.cc>
 * Copyright (c) 2014 by Paul Stoffregen <paul@pjrc.com> (Transaction API)
 * SPI Master library for arduino.
 *
 * This file is free software; you can redistribute it and/or modify
 * it under the terms of either the GNU General Public License version 2
 * or the GNU Lesser General Public License version 2.1, both as
 * published by the Free Software Foundation.
 */

#include "Arduino.h"
#include "SPI.h"

SPIClass SPI;


SPIClass::SPIClass()
{
	SPIM_Start();
}

SPIClass::~SPIClass()
{
}

void SPIClass::begin() 
{
  // D10_Ctrl and D11_Ctrl are registers which select between PWM and SPI for
  //  those two pins. 0 is PWM, 1 is SPI. Do this *first* so if the PWM is on
  //  these pins don't see a bunch of gibberish transitions when we hook the
  //  peripheral bus up to them.
  D10_Ctrl_Write(0x01);
  D11_Ctrl_Write(0x01);
  pinMode(10, PERIPHERAL_OUT);
  pinMode(11, PERIPHERAL_OUT);
  pinMode(12, PERIPHERAL_IN);
  pinMode(13, PERIPHERAL_OUT);
  SPI_MODE_REG_Write(0x00);
}

void SPIClass::end()
{
  pinMode(10, INPUT);
  pinMode(11, INPUT);
  pinMode(12, INPUT);
  pinMode(13, INPUT);
}

void SPIClass::setBitOrder(BITORDER _bitOrder) 
{
  // This is not supported by the native SPI master device provided by
  //  Cypress. Future support may occur but for now, MSB first only!
}

void SPIClass::setDataMode(SPI_MODE spiMode) 
{
  // The SPI_M peripheral provided by Cypress doesn't support dynamic mode
  //  changing; however, we can game it a bit by running the output through
  //  some digital logic on the way off chip.
  //  We run the clock output of the SPI module through an XOR gate, and MISO
  //  and MOSI through a MUX which allows to select either the native signal
  //  or the signal run through a D flip flop which is clocked by the clock
  //  going into the SPI module. The SCLK of the SPI module is 1/2 the input
  //  frequency, so the one-cycle delay of the D-ff is actually a 1/2 SCLK
  //  cycle delay.
  //  These changes are controlled by the SPI_MODE_REG register; writing the
  //  MODE value (0, 1, 2, 3) to that register will configure the logic for
  //  the signal properly.
  SPI_MODE_REG_Write(spiMode);
}

void SPIClass::setClockDivider(uint8_t _divider) 
{
  /* The clock output is determined by the input clock to the SPI module. That
   *  is, in turn, determined by the divider we write here. The output freq is
   *  (IMO / _divider) / 2; IMO is nominally 24MHz. 
   *  The maximum frequency out is 9 MHz; maximum in is thus 18MHz
   *  However, since IMO is 24MHz, and the divider is an integer, we can't do
   *  better than 12 MHz input, or a by-two division.*/
  if (_divider < 2)
  {
    return;
  }
  SPI_Clock_In_SetDividerValue(_divider);
}

uint8_t SPIClass::transfer(uint8_t _data) 
{
  SPIM_WriteTxData(_data);
  while (SPIM_GetTxBufferSize() > 0)
  { /* wait for data to be sent */}
  return SPIM_ReadRxData(); 
}

void SPIClass::transfer(uint8_t *_buf, size_t _count)
{
  SPI_SS_Stretch_Write(0x00);
  uint8_t fullPackets = _count/4;
  uint8_t strayBytes = _count%4;
  uint8_t i = 0;
  while (fullPackets > 0)
  {
    SPIM_PutArray((const uint8_t*)(_buf + i), 4);
    while (SPIM_GetTxBufferSize() > 0)
    { /* wait for data to be sent */ }
    for (int j = 0; j<4; j++)
    {
      *(_buf + i + j) = SPIM_ReadRxData();
    }
    ++i;
    --fullPackets;
  }
  if (strayBytes > 0)
  {
    SPIM_PutArray((const uint8_t*)(_buf + i), strayBytes);
    while (SPIM_GetTxBufferSize() > 0)
    { /* wait for data to be sent */ }
    for (int j = 0; j<strayBytes; j++)
    {
      *(_buf + i + j) = SPIM_ReadRxData();
    }
  }
  SPI_SS_Stretch_Write(0x01);
}

