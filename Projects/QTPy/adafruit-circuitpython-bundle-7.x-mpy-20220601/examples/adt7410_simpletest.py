# SPDX-FileCopyrightText: 2021 ladyada for Adafruit Industries
# SPDX-License-Identifier: MIT

import time
import board
import adafruit_adt7410

i2c = board.I2C()  # uses board.SCL and board.SDA
adt = adafruit_adt7410.ADT7410(i2c, address=0x48)
adt.high_resolution = True

while True:
    print(adt.temperature)
    time.sleep(0.5)
