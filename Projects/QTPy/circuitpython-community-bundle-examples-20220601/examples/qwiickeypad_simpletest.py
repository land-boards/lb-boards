# SPDX-FileCopyrightText: Copyright (c) 2019-2021 Gaston Williams
#
# SPDX-License-Identifier: MIT

#  This is example is for the SparkFun Qwiic Keypad.
#  SparkFun sells these at its website: www.sparkfun.com
#  Do you like this library? Help support SparkFun. Buy a board!
#  https://www.sparkfun.com/products/15290

"""
 Qwiic Keypad Simple Test - qwiickeypad_simpletest.py
 Written by Gaston Williams, July 2nd, 2019
 The Qwiic Keypad is an I2C controlled 12-Button Keypad produced by Sparkfun.

 Qwiic Keypad - Simple Test:
 This program uses the Qwiic Keypad CircuitPython Library to
 control the Qwiic Keypad over I2C to read the button.
"""
import sys
from time import sleep
import board
import sparkfun_qwiickeypad

# Create bus object using our board's I2C port
i2c = board.I2C()

# Create keypad object
keypad = sparkfun_qwiickeypad.Sparkfun_QwiicKeypad(i2c)

print("Qwicc Keypad Simple Test")

# Check if connected
if keypad.connected:
    print("Keypad connected. Firmware: ", keypad.version)
else:
    print("Keypad does not appear to be connected. Please check wiring.")
    sys.exit()

print("Press any button on the keypad.")

# button value -1 is error/busy, 0 is no key pressed
button = -1

# while no key is pressed
while button <= 0:
    # request a button
    keypad.update_fifo()
    button = keypad.button
    # Display the button value
    if button > 0:
        print("Button '" + chr(button) + "' was pressed.")
    # wait a bit before trying again
    sleep(0.100)
