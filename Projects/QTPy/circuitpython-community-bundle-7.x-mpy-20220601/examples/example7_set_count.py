# SPDX-FileCopyrightText: Copyright (c) 2019-2021 Gaston Williams
#
# SPDX-License-Identifier: MIT

#  This is example is for the SparkFun Qwiic Single Twist.
#  SparkFun sells these at its website: www.sparkfun.com
#  Do you like this library? Help support SparkFun. Buy a board!
#  https://www.sparkfun.com/products/15083

"""
 Qwiic Twist Example 7 - example7_set_count.py
 Written by Gaston Williams, June 21st, 2019
 Based on Arduino code written by
 Nathan Seidle @ Sparkfun, December 3rd, 2018
 The Qwiic Twist is an I2C controlled RGB Rotary Encoder produced by sparkfun

 Example 7 - Set Count:
 This program uses the Qwiic Twist CircuitPython Library to
 control the Qwiic Twist RGB Rotrary Encoder over I2C to set
 the encoder count. There are times when it's necessary encoder
 count to a specific value. Useful when the encoder value is mapped directly
 onto a volume setting, FM freq, etc.
"""
import sys
from time import sleep
import board
import sparkfun_qwiictwist

# Create bus object using our board's I2C port
i2c = board.I2C()

# Create twist object
twist = sparkfun_qwiictwist.Sparkfun_QwiicTwist(i2c)

print("Qwicc Twist Example 7 Set Count")

# Check if connected
if twist.connected:
    print("Twist connected.")
else:
    print("Twist does not appear to be connected. Please check wiring.")
    sys.exit()

# Set initial value to 1000. Not stored to non-volatile memory.
twist.count = 1000

print("Type Ctrl-C to exit program.")

try:
    while True:
        print("Count: " + str(twist.count))
        print("Difference: " + str(twist.difference))
        sleep(0.250)

except KeyboardInterrupt:
    pass
