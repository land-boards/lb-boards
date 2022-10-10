# SPDX-FileCopyrightText: Copyright (c) 2019-2021 Gaston Williams
#
# SPDX-License-Identifier: MIT

#  This is example is for the SparkFun Qwiic Single Twist.
#  SparkFun sells these at its website: www.sparkfun.com
#  Do you like this library? Help support SparkFun. Buy a board!
#  https://www.sparkfun.com/products/15083

"""
 Qwiic Twist Example 3 - example3_crazy_color.py
 Written by Gaston Williams, June 20th, 2019
 Based on Arduino code written by
 Nathan Seidle @ Sparkfun, December 3rd, 2018
 The Qwiic Twist is an I2C controlled RGB Rotary Encoder produced by sparkfun

 Example 3 - Crazy Color:
 This program uses the Qwiic Twist CircuitPython Library to
 control the Qwiic Twist RGB Rotrary Encoder over I2C to set
 the knob color to an endless number of random colors.
"""
import sys
from time import sleep
import random

import board
import sparkfun_qwiictwist

# Create bus object using our board's I2C port
i2c = board.I2C()

# Create twist object
twist = sparkfun_qwiictwist.Sparkfun_QwiicTwist(i2c)

print("Qwicc Twist Example 3 Crazy Color")

# Check if connected
if twist.connected:
    print("Twist connected.")
else:
    print("Twist does not appear to be connected. Please check wiring.")
    sys.exit()

print("Type Ctrl-C to exit program.")

# Turn off any color connections
twist.connect_color(0, 0, 0)

try:
    while True:
        print("Count: " + str(twist.count))
        if twist.pressed:
            print("Pressed!")

        # Generate a random rgb value
        red = random.randint(0, 256)
        green = random.randint(0, 256)
        blue = random.randint(0, 256)
        twist.set_color(red, green, blue)

        sleep(0.1)

except KeyboardInterrupt:
    pass
