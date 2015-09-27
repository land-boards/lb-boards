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

#ifndef _SPI_H_INCLUDED
#define _SPI_H_INCLUDED

#include <stdio.h>
#include "Arduino.h"

#define SPI_HAS_TRANSACTION 0
#define SPI_HAS_EXTENDED_CS_PIN_HANDLING 0

enum SPI_MODE {
  SPI_MODE0 = 0,
  SPI_MODE1,
  SPI_MODE2,
  SPI_MODE3
};

enum BITORDER {
  MSB_FIRST,
  LSB_FIRST
};

class SPIClass 
{
  public:
	SPIClass();
  ~SPIClass();

	// Transfer functions
	uint8_t transfer(uint8_t _data);
	void transfer(uint8_t *_buf, size_t _count);

	void begin(void);
	void end(void);

	// These methods sets a parameter on a single pin
	void setBitOrder(enum BITORDER _order);
	void setDataMode(enum SPI_MODE spiMode);
	void setClockDivider(uint8_t);

  private:
  
};

extern SPIClass SPI;

// For compatibility with sketches designed for AVR @ 16 MHz
// New programs should use SPI.beginTransaction to set the SPI clock
#define SPI_CLOCK_DIV2	 3     // yields 8MHz
#define SPI_CLOCK_DIV4	 6     // yields 4MHz
#define SPI_CLOCK_DIV8	 12    // yields 2MHz
#define SPI_CLOCK_DIV16	 24    // yields 1MHz
#define SPI_CLOCK_DIV32	 48    // yields 500kHz
#define SPI_CLOCK_DIV64	 96    // yields 250kHz
#define SPI_CLOCK_DIV128 192   // yields 125hHz

#endif
