# SPDX-FileCopyrightText: Copyright (c) 2019-2021 Gaston Williams
#
# SPDX-License-Identifier: Unlicense

#  This is example is for the SparkFun Qwiic Single Relay.
#  SparkFun sells these at its website: www.sparkfun.com
#  Do you like this library? Help support SparkFun. Buy a board!
#  https://www.sparkfun.com/products/15093

"""
 Qwiic Relay Example 4 - example4_get_relay_status.py
 Written by Gaston Williams, June 18th, 2019
 Based on Arduino code written by
 Kevin Kuwata @ SparkX, March 21, 2018
 The Qwiic Single Relay is an I2C controlled relay produced by sparkfun

 Example 4 - Get Relay Status:
 This program uses the Qwiic Relay CircuitPython Library to
 get the current status of the Qwiic Relay. The relay responds
 with a 1 for on and a 0 for off.

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

print("Qwiic Relay Example 4 Get Relay Status")

# Check if connected
if relay.connected:
    print("Relay connected.")
else:
    print("Relay does not appear to be connected. Please check wiring.")
    sys.exit()

print("Type Ctrl-C to exit program.")

try:
    while True:
        relay.relay_on()
        print("The relay status is ", relay.status)
        sleep(2)
        relay.relay_off()
        print("The relay status is ", relay.status)
        sleep(2)

except KeyboardInterrupt:
    pass
