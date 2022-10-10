# SPDX-FileCopyrightText: Copyright (c) 2019-2021 Gaston Williams
#
# SPDX-License-Identifier: MIT

#  This is example is for the SparkFun Qwiic Keypad.
#  SparkFun sells these at its website: www.sparkfun.com
#  Do you like this library? Help support SparkFun. Buy a board!
#  https://www.sparkfun.com/products/15290

"""
 Qwiic Keypad Example 6 - example6_key_code.py
 Written by Gaston Williams, July 1st, 2019
 Based on Arduino code written by
 Nathan Seidle @ Sparkfun, January 21, 2018
 and updated by
 Pete Lewis @ Sparkfun, March 16, 2019

 The Qwiic Keypad is an I2C controlled 12-button keypad produced by Sparkfun.

 Example 6 - Key Code:
 This program uses the Qwiic Keypad CircuitPython Library to control the Qwiic
 Keypad over I2C and waits for the user to input the correct 4 digit keycode.
 It then responds with a nice message on serial if they get it right.

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

# List with secret keycode (Hey, that's the same code as my luggage!)
code = ["1", "2", "3", "4"]

# List for user input
guess = []

# Number of tries
count = 0

#
# Create bus object using our board's I2C port
i2c = board.I2C()

# Create relay object
keypad = sparkfun_qwiickeypad.Sparkfun_QwiicKeypad(i2c)

print("Qwicc Keypad Example 6 Key Code")

# Check if connected
if keypad.connected:
    print("Keypad connected. Firmware: ", keypad.version)
else:
    print("Keypad does not appear to be connected. Please check wiring.")
    sys.exit()

print("Type the correct Keycode or Ctrl-C to exit program.")
print("Please type in the correct 4 digit Keycode.")


try:
    while True:
        # request the next key pressed
        keypad.update_fifo()
        button = keypad.button

        if button > 0:
            guess.append(chr(button))

        if len(guess) == 4:
            count += 1
            if guess == code:
                print("Keycode correct. Wahooooooooooo!")
                break
            else:
                print("Sorry, please try again.")
                guess.clear()
                print("Please type in the correct 4 digit Keycode.")
                if count > 2:
                    print("Hint: try", code)

        sleep(0.250)


except KeyboardInterrupt:
    pass
