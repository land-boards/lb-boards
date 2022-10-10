# SPDX-FileCopyrightText: 2017 Scott Shawcroft, written for Adafruit Industries
# SPDX-FileCopyrightText: Copyright (c) 2021 John Woolsey for Woolsey Workshop
#
# SPDX-License-Identifier: Unlicense


import time
import board
import digitalio
import wws_74hc165

latch_pin = digitalio.DigitalInOut(board.D5)
sr = wws_74hc165.ShiftRegister74HC165(board.SPI(), latch_pin)

pin1 = sr.get_pin(1)

while True:
    print(f"pin 1 = {pin1.value}")
    time.sleep(1)
