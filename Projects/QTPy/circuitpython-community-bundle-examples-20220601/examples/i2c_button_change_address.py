# SPDX-FileCopyrightText: Copyright (c) 2020,2021 Greg Paris
#
# SPDX-License-Identifier: MIT

"""
`i2c_button_change_address`
================================================================================

Demo changing the I2C address of a Sparkfun Qwiic Button/Switch/Arcade

* Author(s): Greg Paris
"""

# imports
import sys
import board
import busio
from i2c_button import I2C_Button

DEF_ADDR = 0x6F
NEW_ADDR = 0x60

# initialize I2C
i2c = busio.I2C(board.SCL, board.SDA)

# make sure we're not going to cause a conflict
while not i2c.try_lock():
    pass
collision = NEW_ADDR in i2c.scan()
i2c.unlock()
if collision:
    print("there is already a device at address", hex(NEW_ADDR))
    sys.exit()

# initialize the button at the default I2C address
button = I2C_Button(i2c, DEF_ADDR)
print("found button at", hex(button.i2c_addr))

# change the address
# once this happens, the button object is broken
button.i2c_addr = NEW_ADDR

# initialize at the new address
button = I2C_Button(i2c, NEW_ADDR)
print("button now at", hex(button.i2c_addr))

# put it back to default
button.i2c_addr = DEF_ADDR
button = I2C_Button(i2c, DEF_ADDR)
print("button restored to address", hex(button.i2c_addr))
