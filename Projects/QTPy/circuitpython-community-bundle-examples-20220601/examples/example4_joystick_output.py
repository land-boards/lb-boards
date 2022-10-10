# SPDX-FileCopyrightText: Copyright (c) 2019-2021 Gaston Williams
#
# SPDX-License-Identifier: MIT

#  This is example is for the SparkFun Qwiic Joystick.
#  SparkFun sells these at its website: www.sparkfun.com
#  Do you like this library? Help support SparkFun. Buy a board!
#  https://www.sparkfun.com/products/15168

"""
 Qwiic Joystick Example 4 - example4_joystick_output.py
 Written by Gaston Williams, June 13th, 2019
 Based on Arduino code written by
 Wes Furuya @ SparkFun Electronics, February 5th, 2019
 The Qwiic Joystick is a I2C controlled analog joystick

 Example 4 - Joystick Output:
 This program uses the Qwiic Joystick CircuitPython Library to read the
 joystick position and button state, and print them out as directions.
"""
import sys
from time import sleep
import board
import sparkfun_qwiicjoystick

# Create bus object using our board's I2C port
i2c = board.I2C()

# Create joystick object
joystick = sparkfun_qwiicjoystick.Sparkfun_QwiicJoystick(i2c)
# joystick = sparkfun_qwiicjoystick.Sparkfun_QwiicJoystick(i2c, other_addr)

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
        x = joystick.horizontal
        y = joystick.vertical
        b = joystick.button

        # print horizontal direction
        if x > 575:
            print("L")
        if x < 450:
            print("R")

        # print vertical direction
        if y > 575:
            print("U")
        if y < 450:
            print("D")

        # print button state
        if b == 0:
            print("Button")

        # sleep a bit to slow down messages
        sleep(0.200)
except KeyboardInterrupt:
    pass
