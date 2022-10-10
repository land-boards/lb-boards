#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# CircuitPython

"""Simple & Minimallistic example for the TLC5957 library."""

import board
# import busio
import bitbangio
import digitalio
import pulseio

import slight_tlc5957


spi_clock = digitalio.DigitalInOut(board.SCK)
spi_clock.direction = digitalio.Direction.OUTPUT
spi_mosi = digitalio.DigitalInOut(board.MOSI)
spi_mosi.direction = digitalio.Direction.OUTPUT
spi_miso = digitalio.DigitalInOut(board.MISO)
spi_miso.direction = digitalio.Direction.INPUT

# spi = busio.SPI(board.SCK, MOSI=board.MOSI, MISO=board.MISO)
spi = bitbangio.SPI(board.SCK, MOSI=board.MOSI, MISO=board.MISO)

# 6MHz for the grayscale clock
gsclk = pulseio.PWMOut(
    board.D9, duty_cycle=(2 ** 15), frequency=(6000 * 1000))

latch = digitalio.DigitalInOut(board.D7)
latch.direction = digitalio.Direction.OUTPUT

# define pixel array
num_leds = 16
pixels = slight_tlc5957.TLC5957(
    spi=spi,
    latch=latch,
    gsclk=gsclk,
    spi_clock=spi_clock,
    spi_mosi=spi_mosi,
    spi_miso=spi_miso,
    pixel_count=num_leds)


# set first pixel to orange
# using floating point values (0..1)
pixels[0] = (1, 0.5, 0)
# set first pixel to sky blue
# using 16bit integer values (0..65535)
pixels[1] = (0, 32000, 65535)

# write data to chips
pixels.show()

while True:
    pass
