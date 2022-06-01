#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# CircuitPython

"""Develop and Test TLC5957."""

__doc__ = """
Develop and Test TLC5957.

this script contains a bunch of tests and debug outputs.
its mainly the playground during the development of the library.
"""

import time

import board
# import busio
import bitbangio
import digitalio
import pulseio

import slight_tlc5957

##########################################
print(
    "\n" +
    (42 * '*') + "\n" +
    __doc__ + "\n" +
    (42 * '*') + "\n" +
    "\n"
)

##########################################
print(42 * '*')
print("initialise digitalio pins for SPI")
spi_clock = digitalio.DigitalInOut(board.SCK)
spi_clock.direction = digitalio.Direction.OUTPUT
spi_mosi = digitalio.DigitalInOut(board.MOSI)
spi_mosi.direction = digitalio.Direction.OUTPUT
spi_miso = digitalio.DigitalInOut(board.MISO)
spi_miso.direction = digitalio.Direction.INPUT

# print((42 * '*') + "\n" + "init busio.SPI")
# spi = busio.SPI(board.SCK, MOSI=board.MOSI, MISO=board.MISO)
print("init bitbangio.SPI")
spi = bitbangio.SPI(board.SCK, MOSI=board.MOSI, MISO=board.MISO)

# maximum frequency is currently hardcoded to 6MHz
# https://github.com/adafruit/circuitpython/blob/master/ports/atmel-samd/common-hal/pulseio/PWMOut.c#L119
gsclk_freqency = (6000 * 1000)  # 6MHz
gsclk = pulseio.PWMOut(
    board.D9, duty_cycle=(2 ** 15), frequency=gsclk_freqency)
print("gsclk.frequency: {:}MHz".format(gsclk.frequency / (1000*1000)))

latch = digitalio.DigitalInOut(board.D7)
latch.direction = digitalio.Direction.OUTPUT

##########################################
print(42 * '*')
print("define pixel array / init TLC5957")
num_leds = 16
pixels = slight_tlc5957.TLC5957(
    spi=spi,
    latch=latch,
    gsclk=gsclk,
    spi_clock=spi_clock,
    spi_mosi=spi_mosi,
    spi_miso=spi_miso,
    pixel_count=num_leds)

print("pixel_count", pixels.pixel_count)
print("chip_count", pixels.chip_count)
print("channel_count", pixels.channel_count)


##########################################
print(42 * '*')
print("set colors")
for index in range(num_leds):
    pixels[index] = (1, 1, 1)
# write data to chips
pixels.show()
time.sleep(10)

##########################################
print(42 * '*')
print("loop..")
value_high = 1000
value_low = 1
while True:
    pixel_active_index = 0
    for index in range(pixels.channel_count):
        if index == pixel_active_index:
            pixels.set_channel(index, value_high)
            pixels.set_channel((index - 1) % pixels.channel_count, value_low)
        pixel_active_index += 1
        # write data to chips
        pixels.show()
        # wait a second
        time.sleep(0.5)
    # set all to minimal
    for index in range(num_leds):
        pixels[index] = (value_low, value_low, value_low)
    # write data to chips
    pixels.show()
    time.sleep(2)
