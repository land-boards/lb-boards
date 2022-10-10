# SPDX-FileCopyrightText: 2021 ladyada for Adafruit Industries
# SPDX-License-Identifier: MIT

import time
import board
import adafruit_msa301

i2c = board.I2C()  # uses board.SCL and board.SDA
msa = adafruit_msa301.MSA301(i2c)

msa.enable_tap_detection()

while True:
    if msa.tapped:
        print("Single Tap!")
    time.sleep(0.01)
