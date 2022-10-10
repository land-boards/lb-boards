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

while True:
    print("Inputs: ", end="")
    for byte in sr.gpio:
        print(f"{byte:08b}", end=" ")
    print()
    time.sleep(1)
