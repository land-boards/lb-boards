# SPDX-FileCopyrightText: Copyright (c) 2019-2021 Gaston Williams
#
# SPDX-License-Identifier: MIT

#  This is example is for the SparkFun Qwiic Joystick.
#  SparkFun sells these at its website: www.sparkfun.com
#  Do you like this library? Help support SparkFun. Buy a board!
#  https://www.sparkfun.com/products/15168

"""
 Qwiic Joystick Example 1 - example1_basic_readings.py
 Written by Gaston Williams, June 13th, 2019
 Based on Arduino code written by
 Wes Furuya @ SparkFun Electronics, February 5th, 2019
 The Qwiic Joystick is a I2C controlled analog joystick

 Example 1 - Basic Readings:
 This program uses the Qwiic Joystick CircuitPython Library to read and
 print the current joystick position and button state.
"""
import sys
from time import sleep
import board
import sparkfun_qwiicjoystick

# Create bus object using our board's I2C port
i2c = board.I2C()

# Create joystick object
joystick = sparkfun_qwiicjoystick.Sparkfun_QwiicJoystick(i2c)

# Check if connected
if joystick.connected:
    print("Joystick connected.")
else:
    print("Joystick does not appear to be connected. Please check wiring.")
    sys.exit()

print("Joystick Version: " + joystick.version)
print("Type Ctrl-C to exit program.")

try:
    while True:
        print(
            "X: "
            + str(joystick.horizontal)
            + " Y: "
            + str(joystick.vertical)
            + " Button: "
            + str(joystick.button)
        )
        # sleep a bit to slow down messages
        sleep(0.200)
except KeyboardInterrupt:
    pass
