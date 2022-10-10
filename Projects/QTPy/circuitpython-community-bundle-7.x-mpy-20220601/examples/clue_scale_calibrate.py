# SPDX-FileCopyrightText: 2021, 2022 Cedar Grove Maker Studios
# SPDX-License-Identifier: MIT

# clue_scale_calibrate.py  2022-04-23 1.1.0  Cedar Grove Maker Studios

# Clue Scale Calibration
# Cedar Grove NAU7802 FeatherWing example

import time
import board
from adafruit_clue import clue
from cedargrove_nau7802 import NAU7802

clue.pixel[0] = (16, 0, 16)  # Set status indicator to purple during instantiation phase

SAMPLE_AVG = 1000  # Number of sample values to average
DEFAULT_GAIN = 128  # Default gain for internal PGA

# Instantiate 24-bit load sensor ADC
nau7802 = NAU7802(board.I2C(), address=0x2A, active_channels=2)


def zero_channel():
    # Initiate internal calibration for current channel; return raw zero offset value
    # Use when scale is started, a new channel is selected, or to adjust for measurement drift
    # Remove weight and tare from load cell before executing
    print(
        "channel %1d calibrate.INTERNAL: %5s"
        % (nau7802.channel, nau7802.calibrate("INTERNAL"))
    )
    print(
        "channel %1d calibrate.OFFSET:   %5s"
        % (nau7802.channel, nau7802.calibrate("OFFSET"))
    )
    zero_offset = read(100)  # Read average of 100 samples to establish zero offset
    print("...channel zeroed")
    return zero_offset


def read(samples=100):
    # Read and average consecutive raw sample values; return average raw value
    sample_sum = 0
    sample_count = samples
    while sample_count > 0:
        if nau7802.available:
            sample_sum = sample_sum + nau7802.read()
            sample_count -= 1
    return int(sample_sum / samples)


# Instantiate and calibrate load cell inputs
print("*** Instantiate and calibrate load cells")
clue.pixel[0] = (16, 16, 0)  # Set status indicator to yellow
print("    enable NAU7802 digital and analog power: %5s" % (nau7802.enable(True)))

nau7802.gain = DEFAULT_GAIN  # Use default gain
nau7802.channel = 1
zero = zero_channel()  # Calibrate and get raw zero offset value
nau7802.channel = 2
zero = zero_channel()  # Calibrate and get raw zero offset value
clue.pixel[0] = (0, 16, 0)  # Set status indicator to green
clue.play_tone(1660, 0.15)
clue.play_tone(1440, 0.15)

print("GAIN:", DEFAULT_GAIN)
print("Place the calibration weight on the load cell")
print("To re-zero the load cells, remove all weights and press B")

### Main loop: Read load cells and display raw values
#     Monitor Zeroing button
while True:
    print("=====")
    nau7802.channel = 1
    value = read(SAMPLE_AVG)
    print(
        "CHAN_%1.0f RAW VALUE: %7.0f  Percent of full-scale at gain x%3.0f : %3.2f: "
        % (nau7802.channel, value, DEFAULT_GAIN, (value / ((2 ** 23) - 1)) * 100)
    )

    nau7802.channel = 2
    value = read(SAMPLE_AVG)
    print(
        "CHAN_%1.0f RAW VALUE: %7.0f  Percent of full-scale at gain x%3.0f : %3.2f: "
        % (nau7802.channel, value, DEFAULT_GAIN, (value / ((2 ** 23) - 1)) * 100)
    )

    time.sleep(0.1)

    if clue.button_b:
        # Zero and recalibrate both channels
        clue.play_tone(1660, 0.3)
        clue.pixel[0] = (16, 0, 0)
        nau7802.channel = 1
        zero = zero_channel()
        nau7802.channel = 2
        zero = zero_channel()
        while clue.button_b:
            time.sleep(0.1)
        clue.pixel[0] = (0, 16, 0)
        clue.play_tone(1440, 0.5)
