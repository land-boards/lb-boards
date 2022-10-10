# SPDX-FileCopyrightText: Copyright (c) 2019-2021 Gaston Williams
#
# SPDX-License-Identifier: MIT

#  This is example is for the SparkFun Qwiic Keypad.
#  SparkFun sells these at its website: www.sparkfun.com
#  Do you like this library? Help support SparkFun. Buy a board!
#  https://www.sparkfun.com/products/15290

"""
  Qwiic Keypad Example 3 - example3_change_i2c_address.py
  Written by Gaston Williams, July 1st, 2019
  Based on Arduino code written by
  Kevin Kuwata @ SparkX, March 21, 2019
  The Qwiic Keypad is an I2C controlled 12-button keypad from Sparkfun.

  Example 3 - Change I2C Address:
  This program uses the Qwiic Keypad CircuitPython Library to change
  the I2C address for the device. You enter in the DEC value (8-119) or
  HEX value (0x08-0x77) for the new Keypad address.  After the i2c address
  is changed, you can run the example4_i2c_scanner.py program to validate
  the i2c address.

  Syntax: python3 change_i2c_address.py [address]
    where address is an optional current address value in decimal or hex

    The default value for the address is 75 [0x4B]
"""

import sys
import board
import sparkfun_qwiickeypad

# The default QwiicKeypad i2c address is 0x4B (75)
i2c_address = 0x4B

# print('Arguement count: ' , len(sys.argv))
# print('List: ' + str(sys.argv))

# If we were passed an arguement, then use it as the address
if len(sys.argv) > 1:
    try:
        # check to see if hex or decimal arguement
        if "0x" in sys.argv[1]:
            i2c_address = int(sys.argv[1], 16)
        else:
            i2c_address = int(sys.argv[1])
    except ValueError:
        print("Ignoring invalid arguement: " + str(sys.argv[1]))

# Show the initial address
print("Current i2c address = " + str(i2c_address) + " [" + hex(i2c_address) + "]")

# Create library object using our Bus I2C port
i2c = board.I2C()
keypad = sparkfun_qwiickeypad.Sparkfun_QwiicKeypad(i2c, i2c_address)

if keypad.connected:
    print("Qwiic Keypad Example.")
else:
    # if we can't connecct, something is wrong so just quit
    print("Keypad does not appear to be connected. Please check wiring.")
    sys.exit()

print("Address: " + str(i2c_address) + " [" + hex(i2c_address) + "]")

text = input(
    "Enter a new I2C address (as a decimal from 8 to 119 or hex 0x08 to 0x77):"
)

# check to see if hex or decimal value
if "0x" in text:
    new_address = int(text, 16)
else:
    new_address = int(text)

print("Changing address to " + str(new_address) + " [" + hex(new_address) + "]")

result = keypad.set_i2c_address(new_address)

if result:
    print("Address changed to " + str(new_address) + " [" + hex(new_address) + "]")
    # After the change check the new connection and show firmware version
    if keypad.connected:
        print("Connected to Keypad after address change.")
    else:
        print("Error after address change. Cannot connect to Keypad.")

else:
    print("Address change failed.")

# good advice whether the address changed worked or not
print("Run example4_i2c_scanner.py to verify the Qwiic Keypad address.")
