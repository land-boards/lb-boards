# SPDX-FileCopyrightText: Copyright (c) 2019-2021 Gaston Williams
#
# SPDX-License-Identifier: MIT

#  This is example is for the SparkFun Qwiic Single Twist.
#  SparkFun sells these at its website: www.sparkfun.com
#  Do you like this library? Help support SparkFun. Buy a board!
#  https://www.sparkfun.com/products/15083

"""
 Qwiic Twist Example 5 - example5_timestamps.py
 Written by Gaston Williams, June 21st, 2019
 Based on Arduino code written by
 Nathan Seidle @ Sparkfun, December 3rd, 2018
 The Qwiic Twist is an I2C controlled RGB Rotary Encoder produced by sparkfun

 Example 5 - Timestamps:
 This program uses the Qwiic Twist CircuitPython Library to
 control the Qwiic Twist RGB Rotrary Encoder over I2C to display
 the time between when the user did an action (such as twist
 knob or press button) and when we queried the device. You don't
 need to constantly poll the Qwiic Twist to see if the user has
 twisted the knob or pressed the button. Instead, check every so
 often and when the isMoved or isClick goes true, then read the
 timestamp and you'll know when the user did their thing.
"""
import sys
from time import sleep
import board
import sparkfun_qwiictwist

# Create bus object using our board's I2C port
i2c = board.I2C()

# Create twist object
twist = sparkfun_qwiictwist.Sparkfun_QwiicTwist(i2c)

print("Qwicc Twist Example 5 Timestamps")

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
        if twist.moved:
            print("Last Twist time: " + str(twist.time_since_last_movement))
        if twist.clicked:
            print("Last Button time: " + str(twist.time_since_last_press))
        if twist.pressed:
            print("Pressed!")
        sleep(1)

except KeyboardInterrupt:
    pass
