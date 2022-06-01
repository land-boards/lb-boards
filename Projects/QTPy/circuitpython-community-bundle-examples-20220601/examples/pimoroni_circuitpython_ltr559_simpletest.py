# SPDX-FileCopyrightText: 2017 Scott Shawcroft, written for Adafruit Industries
#
# SPDX-License-Identifier: Unlicense
"""Simple example of the LTR559 library."""
import time
from board import SCL, SDA
from busio import I2C
from pimoroni_circuitpython_ltr559 import Pimoroni_LTR559

I2C_BUS = I2C(SCL, SDA)
LTR559 = Pimoroni_LTR559(I2C_BUS)

while True:
    print(LTR559.lux)  # Get Lux value from light sensor
    print(LTR559.prox)  # Get Proximity value from proximity sensor
    time.sleep(1.0)
