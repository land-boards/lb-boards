# SPDX-FileCopyrightText: Copyright (c) 2019-2021 Gaston Williams
#
# SPDX-License-Identifier: Unlicense

#  This is example is for the SparkFun Qwiic Single Relay.
#  SparkFun sells these at its website: www.sparkfun.com
#  Do you like this library? Help support SparkFun. Buy a board!
#  https://www.sparkfun.com/products/15093

"""
 Qwiic Relay Example 6 - example6_set_relay_status.py
 Written by Gaston Williams, June 21st, 2019
 The Qwiic Single Relay is an I2C controlled relay produced by sparkfun

 Example 6 - Set Relay Status:
 This program uses the Qwiic Relay CircuitPython Library to
 set the relay status property to turn the relay on and off.


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

print("Qwiic Relay Example 6 Set Relay Status")

# Check if connected
if relay.connected:
    print("Relay connected.")
else:
    print("Relay does not appear to be connected. Please check wiring.")
    sys.exit()

print("Type Ctrl-C to exit program.")

try:
    while True:
        # Set status = 1/True is the same as relay.relay_on()
        relay.status = True
        print("The relay status is", bool(relay.status))
        sleep(2)

        # Set status = 0/False is the same as relay.relay_off()
        relay.status = False
        print("The relay status is", bool(relay.status))
        sleep(2)

except KeyboardInterrupt:
    pass
