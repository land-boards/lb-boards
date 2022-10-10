# SPDX-FileCopyrightText: 2017 Scott Shawcroft, written for Adafruit Industries
# SPDX-FileCopyrightText: Copyright (c) 2021 Arofarn
#
# SPDX-License-Identifier: MIT

import time

from board import SCL, SDA
import busio
from adafruit_neotrellis.neotrellis import NeoTrellis
from adafruit_neotrellis.multitrellis import MultiTrellis
from neotrellism4 import NeoTrellisM4

# Create the i2c object for the trellis
I2C = busio.I2C(SCL, SDA)

# Create the trellis. This is for a 2x2 array of TrellisM4 (first row) with
# 2 Neotrellis (second row).
#
# [ NeoM4_left | NeoM4_right ]
#  neotrellis0 | neotrellis1

trellim4_left = NeoTrellisM4()
trellim4_right = NeoTrellisM4(left_part=trellim4_left)
trelli = [
    [trellim4_left, trellim4_right],
    [NeoTrellis(I2C, False, addr=0x2F), NeoTrellis(I2C, False, addr=0x2E)],
]

trellis = MultiTrellis(trelli)

# some color definitions
OFF = (0, 0, 0)
RED = (127, 0, 0)
YELLOW = (127, 75, 0)
GREEN = (0, 127, 0)
CYAN = (0, 127, 127)
BLUE = (0, 0, 127)
PURPLE = (90, 0, 127)

# this will be called when button events are received
def blink(xcoord, ycoord, edge):
    """Turn the LED on when a rising edge is detected or
    turn the LED off when a falling edge is detected
    """
    if edge == NeoTrellis.EDGE_RISING:
        trellis.color(xcoord, ycoord, BLUE)
    elif edge == NeoTrellis.EDGE_FALLING:
        trellis.color(xcoord, ycoord, OFF)


for y in range(8):
    for x in range(8):
        # activate rising edge events on all keys
        print(x, y)
        trellis.activate_key(x, y, NeoTrellis.EDGE_RISING)
        # activate falling edge events on all keys
        trellis.activate_key(x, y, NeoTrellis.EDGE_FALLING)
        trellis.set_callback(x, y, blink)
        trellis.color(x, y, PURPLE)
        time.sleep(0.05)

for y in range(8):
    for x in range(8):
        trellis.color(x, y, OFF)
        time.sleep(0.05)

while True:
    # the trellis can only be read every 17 millisecons or so
    trellis.sync()
    time.sleep(0.02)
