# SPDX-FileCopyrightText: 2017 Scott Shawcroft, written for Adafruit Industries
# SPDX-FileCopyrightText: Copyright (c) 2021 James Carr
#
# SPDX-License-Identifier: Unlicense


# A simple test for the Pimoroni RGB Base.
# https://shop.pimoroni.com/products/pico-rgb-keypad-base
# It reads the button presses and changes the color of the button when pressed.


import time
import sys
import board
import busio
import digitalio

from community_tca9555 import TCA9555

try:
    from adafruit_debouncer import Debouncer
except ImportError:
    # Make sure the Debounce library is available
    # It is a requirement of this example but not the library.
    print("Please install the Debounce library:")
    print("  To install to your Python environment")
    print("    pip3 install adafruit-circuitpython-debouncer")
    print("  To install direct to a connected CircuitPython device")
    print("    circup install adafruit-circuitpython-debouncer")
    sys.exit()

try:
    from adafruit_dotstar import DotStar
except ImportError:
    # Make sure the DotStar library is available
    # It is a requirement of this example but not the library.
    print("Please install the DotStar library:")
    print("  To install to your Python environment")
    print("    pip3 install adafruit-circuitpython-dotstar")
    print("  To install direct to a connected CircuitPython device")
    print("    circup install adafruit-circuitpython-dotstar")
    sys.exit()


# Get or create an I2C object
if hasattr(board, "I2C"):
    i2c = board.I2C()
elif hasattr(board, "SCL") and hasattr(board, "SDA"):
    i2c = busio.I2C(scl=board.SCL, sda=board.SDA)
else:
    # These pins are for Raspberry Pi Pico
    # If using another board, these may need to be changed.
    i2c = busio.I2C(scl=board.GP5, sda=board.GP4)

# Create the TCA9555 expander
expander = TCA9555(i2c)


leds = DotStar(board.GP18, board.GP19, 16, brightness=0.2)
chip_select = digitalio.DigitalInOut(board.GP17)
chip_select.direction = digitalio.Direction.OUTPUT
# There should be nothing else on this SPI bus, so grab it for the duration
chip_select.value = False

# Prepare to read the 16 inputs
# Create a tuple of buttons which are debounced so they can be monitored for changes.
# This reads the bits from the expander individually, instead of as bytes or a word.
# This is to make the debouncing easier.
buttons = (
    Debouncer(lambda: expander.input_port_0_pin_0),
    Debouncer(lambda: expander.input_port_0_pin_1),
    Debouncer(lambda: expander.input_port_0_pin_2),
    Debouncer(lambda: expander.input_port_0_pin_3),
    Debouncer(lambda: expander.input_port_0_pin_4),
    Debouncer(lambda: expander.input_port_0_pin_5),
    Debouncer(lambda: expander.input_port_0_pin_6),
    Debouncer(lambda: expander.input_port_0_pin_7),
    Debouncer(lambda: expander.input_port_1_pin_0),
    Debouncer(lambda: expander.input_port_1_pin_1),
    Debouncer(lambda: expander.input_port_1_pin_2),
    Debouncer(lambda: expander.input_port_1_pin_3),
    Debouncer(lambda: expander.input_port_1_pin_4),
    Debouncer(lambda: expander.input_port_1_pin_5),
    Debouncer(lambda: expander.input_port_1_pin_6),
    Debouncer(lambda: expander.input_port_1_pin_7),
)


# Loop forever - change the color of a button when it is pressed
with leds:
    while True:
        time.sleep(0.001)
        for index, button in enumerate(buttons):
            button.update()  # Update the debounce information
            if button.value:
                # Not pressed
                leds[index] = (0, 128, 0, 0.05)  # Dim green
            else:
                # Pressed
                leds[index] = (255, 0, 128, 0.8)  # Bright pink
