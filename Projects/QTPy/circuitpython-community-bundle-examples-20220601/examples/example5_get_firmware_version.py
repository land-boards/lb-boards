# SPDX-FileCopyrightText: Copyright (c) 2019-2021 Gaston Williams
#
# SPDX-License-Identifier: Unlicense

#  This is example is for the SparkFun Qwiic Single Relay.
#  SparkFun sells these at its website: www.sparkfun.com
#  Do you like this library? Help support SparkFun. Buy a board!
#  https://www.sparkfun.com/products/15093

"""
 Qwiic Relay Example 5 - example5_get_firmware_version.py
 Written by Gaston Williams, June 13th, 2019
 Based on Arduino code written by
 Kevin Kuwata @ SparkX, April 3, 2018
 The Qwiic Single Relay is an I2C controlled relay produced by sparkfun

 Example 5 - Get Firmware Version:
 This program uses the Qwiic Relay CircuitPython Library to get the
 firmware version of Qwiic Single Relay breakout.  If using version prior
 to version 1.0 the version number will be 25.5 or 26.5. Starting at
 version 1.0, the relay will respond with the correct firmware version.

 Default Qwiic relay address is 0x18.
"""
import sys
from time import sleep
import board
import sparkfun_qwiicrelay

# Create bus object using our board's I2C port
i2c = board.I2C()

# Create relay object
relay = sparkfun_qwiicrelay.Sparkfun_QwiicRelay(i2c)

print("Qwicc Relay Example 5 Get Firmware Version")

# Check if connected
if relay.connected:
    print("Relay connected.")
else:
    print("Relay does not appear to be connected. Please check wiring.")
    sys.exit()

print("Type Ctrl-C to exit program.")

try:
    while True:
        print("Firmware version: " + relay.version)
        sleep(2)

except KeyboardInterrupt:
    pass
