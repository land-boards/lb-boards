# SPDX-FileCopyrightText: Copyright (c) 2019-2021 Gaston Williams
#
# SPDX-License-Identifier: MIT

#  This is example is for the SparkFun Qwiic Single Twist.
#  SparkFun sells these at its website: www.sparkfun.com
#  Do you like this library? Help support SparkFun. Buy a board!
#  https://www.sparkfun.com/products/15083

"""
 Qwiic Twist Example 4 - example4_connect_colors.py
 Written by Gaston Williams, June 19th, 2019
 Based on Arduino code written by
 Nathan Seidle @ Sparkfun, December 3rd, 2018
 The Qwiic Twist is an I2C controlled RGB Rotary Encoder produced by sparkfun

 Example 4 - Connect Colors:
 This program uses the Qwiic Twist CircuitPython Library to
 control the Qwiic Twist RGB Rotrary Encoder over I2C to make
 the knob change color as the user turns the device.
 We don't have to send a setColor() or setRed() command each time,
 Qwiic Twist can  change its color independently of the master.
 By connecting a -10 value to red, the red LED will go down 10 in
 brightness with each encoder tick. Connecting 10 to blue will
 increase the blue value with each tick.  These values are stored
 in the Qwiic Twist and will be loaded after each power-on.
"""
import sys
from time import sleep
import board
import sparkfun_qwiictwist

# Create bus object using our board's I2C port
i2c = board.I2C()

# Create twist object
twist = sparkfun_qwiictwist.Sparkfun_QwiicTwist(i2c)

print("Qwicc Twist Example 4 Connect Colors")

# Check if connected
if twist.connected:
    print("Twist connected.")
else:
    print("Twist does not appear to be connected. Please check wiring.")
    sys.exit()

print("Type Ctrl-C to exit program.")

# Set Red and Blue LED brightnesses to half of max.
twist.set_color(128, 0, 128)

# Set the individual color connections

# Red LED will go down 10 in brightness with each encoder tick
twist.red_connection = -10
# Blue LED will go up 10 in brightness with each encoder tick
twist.blue_connection = 10

# Or use the function below to set all color connections at once
# twist.connect_color(-10, 0, 10)

try:
    while True:
        print("Count: " + str(twist.count))
        if twist.pressed:
            print("Pressed!")
        sleep(0.5)

except KeyboardInterrupt:
    pass
