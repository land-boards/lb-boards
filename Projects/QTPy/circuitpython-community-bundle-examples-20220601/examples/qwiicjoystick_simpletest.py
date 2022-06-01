# SPDX-FileCopyrightText: Copyright (c) 2019-2021 Gaston Williams
#
# SPDX-License-Identifier: MIT

#  This is example is for the SparkFun Qwiic Joystick.
#  SparkFun sells these at its website: www.sparkfun.com
#  Do you like this library? Help support SparkFun. Buy a board!
#  https://www.sparkfun.com/products/15168

"""
 Qwiic Joystick Simple Test - qwiicjoystick_simpletest.py
 Written by Gaston Williams, June 13th, 2019
 The Qwiic Joystick is a I2C controlled analog joystick

 Simple Test:
 This program uses the Qwiic Joystick CircuitPython Library to read
 and print out the joystick position.
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

print("Press Joystick button to exit program.")

# joystick.button goes to 0 when pressed
while joystick.button == 1:
    print("X = " + str(joystick.horizontal) + " Y = " + str(joystick.vertical))
    sleep(0.200)  # sleep a bit to slow down messages

print("Button pressed.")
