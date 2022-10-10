#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# CircuitPython

"""TLC5957 & FancyLED & 2D-Array mapping."""

__doc__ = """
TLC5957 & FancyLED & 2D-Array mapping.

this is an example for combining the TLC5957 library with FancyLED.
Enjoy the colors :-)
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
rows = 4
cols = 4
num_leds = rows * cols
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
# helper function

def map_range(value, in_min, in_max, out_min, out_max):
    """Map Value from one range to another."""
    return (value - in_min) * (out_max - out_min) / (in_max - in_min) + out_min


def map_range_int(value, in_min, in_max, out_min, out_max):
    """Map Value from one range to another."""
    return int(
        (value - in_min) * (out_max - out_min)
        //
        (in_max - in_min) + out_min
    )


##########################################
# mapping function

pixel_map = [
    # pylint: disable=bad-whitespace
    [15, 14, 13, 12],
    [11, 10,  9,  8],
    [7,   6,  5,  4],
    [3,   2,  1,  0],
]


def get_pixel_index_from_row_col(row, col):
    """Get pixel_index from row and column index."""
    pixel_index = pixel_map[row][col]
    return pixel_index


##########################################
# print(42 * '*')
# print("set colors")
# for index in range(num_leds):
#     pixels[index] = (1, 1, 1)
# # write data to chips
# pixels.show()
# time.sleep(2)
# print("set colors2")
# for index in range(num_leds):
#     pixels[index] = (0, 100, 1000)
# # write data to chips
# pixels.show()
# time.sleep(2)

##########################################
print(42 * '*')
print("set colors")
# set first pixel to orange
pixels[get_pixel_index_from_row_col(0, 0)] = (1.0, 0.5, 0.0)
pixels[get_pixel_index_from_row_col(0, 3)] = (0.1, 0.0, 1.0)
pixels[get_pixel_index_from_row_col(3, 0)] = (0.1, 0.5, 0.0)
pixels[get_pixel_index_from_row_col(3, 3)] = (0.0, 0.5, 1.0)
pixels.show()
time.sleep(2)

print("set color range")
for x in range(cols):
    # xN = x / cols
    xN = map_range_int(x, 0, cols, 1, 100)
    for y in range(rows):
        # yN = y / rows
        yN = map_range_int(y, 0, rows, 1, 100)
        # print(
        #     "x: {:>2} xN: {:>2} "
        #     "y: {:>2} yN: {:>2} "
        #     "pixel_index: {:>2}".format(
        #         x, xN,
        #         y, yN,
        #         get_pixel_index_from_row_col(x, y)
        #     )
        # )
        pixels[get_pixel_index_from_row_col(x, y)] = (xN, yN, 0)

pixels.show()
time.sleep(2)


##########################################
# main loop
# Positional offset for blue part
offset = 0
print(42 * '*')
print("loop")
while True:
    offsetN = map_range_int(offset, 0.0, 1.0, 1, 200)
    for x in range(cols):
        xN = map_range_int(x, 0, cols, 1, 500)
        for y in range(rows):
            yN = map_range_int(y, 0, rows, 1, 500)
            pixels[get_pixel_index_from_row_col(x, y)] = (xN, yN, offsetN)
    pixels.show()
    offset += 0.01  # Bigger number = faster spin
    if offset > 1.0:
        offset = 0
