# SPDX-FileCopyrightText: Copyright (c) 2019-2021 Gaston Williams
#
# SPDX-License-Identifier: MIT

#  This is example is for the SparkFun Qwiic Keypad.
#  SparkFun sells these at its website: www.sparkfun.com
#  Do you like this library? Help support SparkFun. Buy a board!
#  https://www.sparkfun.com/products/15290

"""
 Qwiic Keypad Example 1 - example1_read_button.py
 Written by Gaston Williams, July 1st, 2019
 Based on Arduino code written by
 Nathan Seidle @ Sparkfun, January 21, 2018
 and updated by
 Pete Lewis @ Sparkfun, March 16, 2019

 The Qwiic Keypad is an I2C controlled 12-button keypad produced by sparkfun

 Example 1 - Read Button:
 This program uses the Qwiic Keypad CircuitPython Library to
 control the Qwiic Keypad over I2C and prints which button was pressed.
 Qwiic KeyPad records any button presses to a stack. It can remember up to
 15 button presses. The master I2C device (for example, an Uno) can ask for
 the oldest button pressed. If the master continues to read in button presses,
 it will receive the entire stack (from oldest to newest). This is handy if
 you need to go and do something else with your code, you can then come back
 to the keypad and pull in the last 15 button presses.
"""

import sys
from time import sleep
import board
import sparkfun_qwiickeypad

# Create bus object using our board's I2C port
i2c = board.I2C()

# Create relay object
keypad = sparkfun_qwiickeypad.Sparkfun_QwiicKeypad(i2c)

print("Qwicc Keypad Example 1 Read Button")

# Check if connected
if keypad.connected:
    print("Keypad connected. Firmware: ", keypad.version)
else:
    print("Keypad does not appear to be connected. Please check wiring.")
    sys.exit()

print("Type Ctrl-C to exit program.")
print("Press a button. Press * to do a space. Press # to go to next line.")

try:
    while True:
        # request the next key pressed
        keypad.update_fifo()
        button = keypad.button

        if button == -1:
            print("Keypad error. Try again.")
            sleep(1)
        elif button != 0:
            c = chr(button)
            if c == "#":
                print()
            elif c == "*":
                sys.stdout.write(" ")
                sys.stdout.flush()
            else:
                sys.stdout.write(c)
                sys.stdout.flush()

        sleep(0.250)

except KeyboardInterrupt:
    pass
