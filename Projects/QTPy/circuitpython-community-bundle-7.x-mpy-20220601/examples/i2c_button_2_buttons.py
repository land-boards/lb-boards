# SPDX-FileCopyrightText: Copyright (c) 2020 Greg Paris
#
# SPDX-License-Identifier: MIT

"""
`i2c_button_2_buttons`
================================================================================

Demonstrate CircuitPython I2C Buttons


* Author(s): Gregory M Paris
"""

# imports
import time
import board
import busio
from i2c_button import I2C_Button

# initialize I2C
i2c = busio.I2C(board.SCL, board.SDA)

# scan the I2C bus for devices
while not i2c.try_lock():
    pass
devices = i2c.scan()
i2c.unlock()
print("I2C devices found:", [hex(n) for n in devices])
default_addr = 0x6F
if default_addr not in devices:
    print("warning: no device at the default button address", default_addr)

# addresses
ACK_ADDR = 0x6E
SNZ_ADDR = 0x6F

# initialize the buttons
ack = I2C_Button(i2c, ACK_ADDR, name="ack")
snz = I2C_Button(i2c, SNZ_ADDR, name="snz")


def button_values(button):
    """Print all public property values."""
    attrs = (
        "name",
        "i2c_addr",
        "dev_id",
        "version",
        "debounce_ms",
        #       "interrupts",
        "led_bright",
        "led_gran",
        "led_cycle_ms",
        "led_off_ms",
        "status",
        #       "press_queue",
        "last_press_ms",
        "first_press_ms",
        #       "click_queue",
        "last_click_ms",
        "first_click_ms",
    )
    for attr in attrs:
        print(attr, getattr(button, attr))
    print()


while True:
    ack.clear()
    snz.clear()
    time.sleep(2)
    button_values(ack)
    button_values(snz)
