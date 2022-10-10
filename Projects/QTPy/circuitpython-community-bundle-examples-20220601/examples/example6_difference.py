# SPDX-FileCopyrightText: Copyright (c) 2019-2021 Gaston Williams
#
# SPDX-License-Identifier: MIT

#  This is example is for the SparkFun Qwiic Single Twist.
#  SparkFun sells these at its website: www.sparkfun.com
#  Do you like this library? Help support SparkFun. Buy a board!
#  https://www.sparkfun.com/products/15083

"""
 Qwiic Twist Example 6 - example6_difference.py
 Written by Gaston Williams, June 19th, 2019
 Based on Arduino code written by
 Nathan Seidle @ Sparkfun, December 3rd, 2018
 The Qwiic Twist is an I2C controlled RGB Rotary Encoder produced by sparkfun

 Example 6 - Difference:
 This program uses the Qwiic Twist CircuitPython Library to
 control the Qwiic Twist RGB Rotrary Encoder over I2C to display
 the difference since the last reading. This is helpful if you
 don't care what the cumulative value is, just difference.

 Things like volume control, brightness, etc. your system may
 not need to know an absolute value like 417, but instead that
 the user has  moved the encoder 4 ticks since the last reading.
"""
import sys
from time import sleep
import board
import sparkfun_qwiictwist

# Create bus object using our board's I2C port
i2c = board.I2C()

# Create twist object
twist = sparkfun_qwiictwist.Sparkfun_QwiicTwist(i2c)

print("Qwicc Twist Example 6 Difference")

# Check if connected
if twist.connected:
    print("Twist connected.")
else:
    print("Twist does not appear to be connected. Please check wiring.")
    sys.exit()

print("Type Ctrl-C to exit program.")

try:
    while True:
        print("Count: " + str(twist.count))
        print("Difference: " + str(twist.difference))
        sleep(0.250)

except KeyboardInterrupt:
    pass
