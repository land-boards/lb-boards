# SPDX-FileCopyrightText: 2017 Scott Shawcroft, written for Adafruit Industries
# SPDX-FileCopyrightText: Copyright (c) 2019-2021 Gaston Williams
#
# SPDX-License-Identifier: MIT

#  This is example is for the SparkFun Qwiic Twist.
#  SparkFun sells these at its website: www.sparkfun.com
#  Do you like this library? Help support SparkFun. Buy a board!
#  https://www.sparkfun.com/products/15083

"""
  Qwiic Twist Example 10 - example10_i2c_Scanner.py
  Written by Gaston Williams, June 13th, 2019
  The Qwiic Twist is an I2C controlled RGB Rotary Encoder

  Example 10 - I2C Scanner
  This progam uses CircuitPython BusIO library to find the current
  address of the Qwiic Twist. It uses the I2C Scanner Example from
  https://learn.adafruit.com/circuitpython-basics-i2c-and-spi/i2c-devices

  The factory default address is 0x3F.
"""

import time

import board

i2c = board.I2C()

while not i2c.try_lock():
    pass

print("Press Ctrl-C to exit program")

try:
    while True:
        print(
            "I2C addresses found:",
            [hex(device_address) for device_address in i2c.scan()],
        )
        time.sleep(5)
except KeyboardInterrupt:
    pass

finally:
    i2c.unlock()
