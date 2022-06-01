# SPDX-FileCopyrightText: Copyright (c) 2019-2021 Gaston Williams
#
# SPDX-License-Identifier: Unlicense

#  This is example is for the SparkFun Qwiic Relay.
#  SparkFun sells these at its website: www.sparkfun.com
#  Do you like this library? Help support SparkFun. Buy a board!
#  https://www.sparkfun.com/products/15168

"""
 Qwiic Relay Simple Test - qwiicrelay_simpletest.py
 Written by Gaston Williams, June 17th, 2019
 The Qwiic Single Relay is a I2C controlled relay

 Simple Test:
 This program uses the Qwiic Relay CircuitPython Library to toggle
 that status of the Qwiic Single Relay.
"""
import sys
from time import sleep
import board
import sparkfun_qwiicrelay

# Create bus object using our board's I2C port
i2c = board.I2C()

# Create joystick object
relay = sparkfun_qwiicrelay.Sparkfun_QwiicRelay(i2c)

# Check if connected
if relay.connected:
    print("Relay connected.")
else:
    print("Relay does not appear to be connected. Please check wiring.")
    sys.exit()

# Print firmware version and current status
print("Firmware version " + relay.version)
print("Relay status ", relay.status)

# Turn the relay on and off
print("Press Ctrl-C to exit program")
while True:
    relay.relay_on()
    print("Relay status ", relay.status)
    sleep(2)
    relay.relay_off()
    print("Relay status ", relay.status)
    sleep(2)
