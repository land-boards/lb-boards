#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# CircuitPython

"""Develop and Test TLC5957."""

__doc__ = """
Develop and Test TLC5957.

this script contains a bunch of tests and debug outputs.
its mainly the playground during the development of the library.
"""

import board
# import busio
import bitbangio
import digitalio
import pulseio
import supervisor

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
# gsclk_freqency = (2 * 1000)  # 2kHz
gsclk = pulseio.PWMOut(
    board.D9,
    duty_cycle=(2 ** 15),
    frequency=gsclk_freqency,
    variable_frequency=True)
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

##########################################
print(42 * '*')
print("set colors")
# for index in range(4):
#     # pixels[index] = (0.0, 0.0, 0.00002)
#     pixels[index] = (1, 1, 1)
pixels[0] = (1, 1, 1)
pixels[1] = (1, 1, 1)
pixels[2] = (2, 2, 2)
pixels[3] = (2, 2, 2)
pixels.show()

##########################################
print(42 * '*')
print("loop..")

if supervisor.runtime.serial_connected:
    print("you can change the gsclk.frequency:")
    print("new frequency in MHz: ")
while True:
    if supervisor.runtime.serial_bytes_available:
        new_value = input()
        new_freq_Hz = gsclk.frequency
        try:
            new_freq_Hz = int(float(new_value) * 1000 * 1000)
        except ValueError as e:
            print("Exception: ", e)
        print(
            "calculated frequency: {:}MHz (= {:}Hz)".format(
                new_freq_Hz / (1000*1000),
                new_freq_Hz
            )
        )
        gsclk.frequency = new_freq_Hz
        # reset duty_cycle to half
        # https://circuitpython.readthedocs.io/en/latest/shared-bindings/pulseio/PWMOut.html#pulseio.PWMOut.duty_cycle
        gsclk.duty_cycle = 0x7fff
        # gsclk.duty_cycle = (2 ** 15)
        print("gsclk.frequency: {:}MHz".format(gsclk.frequency / (1000*1000)))
        # prepare new input
        print("\nenter new frequency in MHz: ")
