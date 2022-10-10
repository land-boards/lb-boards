# SPDX-FileCopyrightText: Copyright (c) 2019-2021 Gaston Williams
#
# SPDX-License-Identifier: MIT

#  This is example is for the SparkFun Qwiic Joystick.
#  SparkFun sells these at its website: www.sparkfun.com
#  Do you like this library? Help support SparkFun. Buy a board!
#  https://www.sparkfun.com/products/15168

"""
  Qwiic Joystick Example 2 - example2_change_i2c_address.py
  Written by Gaston Williams, June 13th, 2019
  Based on Arduino code written by
  Wes Furuya @ SparkFun Electronics, February 5th, 2019
  The Qwiic Joystick is a I2C controlled analog joystick

  Example 2 - Change I2C Address and Read Firmware Version:
  This program uses the Qwiic Joystick CircuitPython Library to change
  the I2C address for the device. You enter in the DEC value (8-119) or

  HEX value (0x08-0x77) for the new Joystick address.  The address is
  changed and the firmware version is printed out to validate the connection.
  You can run i2c_scanner.py to validate the address after the change.

  Syntax: python3 change_i2c_address.py [address]
    where address is an optional address value in decimal or hex
    The default value for the address is 32 [0x20]
"""

import sys
import board
import sparkfun_qwiicjoystick

# The default QwiicJoystick i2c address is 0x20 (32)
i2c_address = 0x20

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
joystick = sparkfun_qwiicjoystick.Sparkfun_QwiicJoystick(i2c, i2c_address)

if joystick.connected:
    print("Qwiic Joystick Example.")
else:
    # if we can't connecct, something is wrong so just quit
    print("Joystick does not appear to be connected. Please check wiring.")
    sys.exit()

print(
    "Address: "
    + str(i2c_address)
    + " ["
    + hex(i2c_address)
    + "]"
    + " Version: "
    + joystick.version
)

text = input(
    "Enter a new I2C address (as a decimal from 8 to 119 or hex 0x08 to 0x77):"
)

# check to see if hex or decimal value
if "0x" in text:
    new_address = int(text, 16)
else:
    new_address = int(text)

print("Changing address to " + str(new_address) + " [" + hex(new_address) + "]")

result = joystick.set_i2c_address(new_address)

if result:
    print("Address changed to " + str(new_address) + " [" + hex(new_address) + "]")
    # After the change check the new connection and show firmware version
    if joystick.connected:
        print("Connected to Joystick after address change.")
        print("Firmware Version: " + joystick.version)
    else:
        print("Error after address change. Cannot connect to Joystick.")

else:
    print("Address change failed.")

# good advice whether the address changed worked or not
print("Run example3_i2c_scanner.py to verify the Qwiic Joystick address.")
