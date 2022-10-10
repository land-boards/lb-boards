# SPDX-FileCopyrightText: 2017 Scott Shawcroft, written for Adafruit Industries
# SPDX-FileCopyrightText: Copyright (c) 2022 Neradoc
#
# SPDX-License-Identifier: Unlicense

import time
import board
from rainbowio import colorwheel
import waveshare_LCD1602

"""Default I2C ports on boards that have one"""
i2c = board.I2C()

lcd = waveshare_LCD1602.LCD1602(i2c, 16, 2)
lcd.setRGB(255, 255, 0)
lcd.setCursor(0, 0)
lcd.printout("Waveshare")
lcd.setCursor(0, 1)
lcd.printout("Hello World !")

while True:
    color = colorwheel(time.monotonic() * 16)
    lcd.setRGB(color >> 16, (color >> 8) % 0x100, color % 0x100)
    time.sleep(1)
