# SPDX-FileCopyrightText: 2017 Scott Shawcroft, written for Adafruit Industries
# SPDX-FileCopyrightText: Copyright (c) 2021 James Carr
#
# SPDX-License-Identifier: Unlicense


# An example to read the configuration, polarity inversion and state of all
# 16 inputs from the TCA9555.


import board
import busio

from community_tca9555 import TCA9555


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


# Read the configuration of all 16 pins
# 0 = output, 1 = input
in_or_out = expander.configuration_ports
print("Configuration\n{:016b}".format(in_or_out))

# Read the polarity inversion state of all 16 pins
polarity_inversion = expander.polarity_inversions
print("Polarity inversion\n{:016b}".format(polarity_inversion))

# Read the input state of all 16 pins
input_state = expander.input_ports
print("Input state\n{:016b}".format(input_state))

# Read the output state of all 16 pins
# At power up, this defaults to 1111111111111111
output_state = expander.output_ports
print("Output state\n{:016b}".format(output_state))
