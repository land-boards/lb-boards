# SPDX-FileCopyrightText: 2017 Scott Shawcroft, written for Adafruit Industries
#
# SPDX-License-Identifier: Unlicense
"""Simple example of the MICS6814 library.

Pins are the default for the MICS6814 on the Pimoroni Enviro+ FeatherWing used with an M4 Express.

"""
import time
import analogio
import digitalio
import board
from pimoroni_mics6814 import Pimoroni_MICS6814

PIN_NH3 = analogio.AnalogIn(board.A0)
PIN_RED = analogio.AnalogIn(board.A1)
PIN_OX = analogio.AnalogIn(board.A2)
PIN_ENABLE = digitalio.DigitalInOut(board.A4)

MICS6814 = Pimoroni_MICS6814(PIN_OX, PIN_RED, PIN_NH3, PIN_ENABLE)

while True:
    print(MICS6814.read_all())
    time.sleep(1.0)
