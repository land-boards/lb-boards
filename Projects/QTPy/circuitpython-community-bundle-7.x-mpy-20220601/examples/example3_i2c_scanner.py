# SPDX-FileCopyrightText: Copyright (c) 2019-2021 Gaston Williams
#
# SPDX-License-Identifier: MIT

#  This is example is for the SparkFun Qwiic Joystick.
#  SparkFun sells these at its website: www.sparkfun.com
#  Do you like this library? Help support SparkFun. Buy a board!
#  https://www.sparkfun.com/products/15168

"""
  Qwiic Joystick Example 3 - example3_i2c_Scanner.py
  Written by Gaston Williams, June 13th, 2019
  The Qwiic Joystick is a I2C controlled analog joystick

  Example 3 - I2C Scanner
  This progam uses CircuitPython BusIO library to find the current
  address of the Qwiic Joystick. It uses the I2C Scanner Example from
  https://learn.adafruit.com/circuitpython-basics-i2c-and-spi/i2c-devices

  The factory default address is 0x20.
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
