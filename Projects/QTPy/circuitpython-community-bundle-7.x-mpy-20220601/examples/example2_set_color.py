# SPDX-FileCopyrightText: Copyright (c) 2019-2021 Gaston Williams
#
# SPDX-License-Identifier: MIT

#  This is example is for the SparkFun Qwiic Single Twist.
#  SparkFun sells these at its website: www.sparkfun.com
#  Do you like this library? Help support SparkFun. Buy a board!
#  https://www.sparkfun.com/products/15083

"""
 Qwiic Twist Example 2 - example2_set_color.py
 Written by Gaston Williams, June 20th, 2019
 Based on Arduino code written by
 Nathan Seidle @ Sparkfun, December 3rd, 2018
 The Qwiic Twist is an I2C controlled RGB Rotary Encoder produced by sparkfun

 Example 2 - Set Color:
 This program uses the Qwiic Twist CircuitPython Library to
 control the Qwiic Twist RGB Rotrary Encoder over I2C to set
 the knob color to pink.  This value is stored in the Qwiic Twist
 and will be loaded after each power-on.
"""
import sys
from time import sleep
import board
import sparkfun_qwiictwist

# Create bus object using our board's I2C port
i2c = board.I2C()

# Create twist object
twist = sparkfun_qwiictwist.Sparkfun_QwiicTwist(i2c)

print("Qwicc Twist Example 2 Set Color")

# Check if connected
if twist.connected:
    print("Twist connected.")
else:
    print("Twist does not appear to be connected. Please check wiring.")
    sys.exit()

print("Type Ctrl-C to exit program.")

# Turn off any color connections
twist.connect_color(0, 0, 0)

# Set the knob color to pink (r =100, g=10, b=50)
twist.set_color(100, 10, 50)

# Set a flag to toggle color
is_pink = True

try:
    while True:
        print("Count: " + str(twist.count))
        if twist.pressed:
            print("Pressed!")
            if is_pink:
                # Set the knob color to blue (r =10, g=10, b=100)
                print("Change color to blue.")
                twist.set_color(10, 10, 100)
                is_pink = False
            else:
                # Set the knob color to pink (r =100, g=10, b=50)
                print("Change color to pink.")
                twist.set_color(100, 10, 50)
                is_pink = True

        sleep(0.2)

except KeyboardInterrupt:
    pass
