# SPDX-FileCopyrightText: 2021 Jose David M.
#
# SPDX-License-Identifier: MIT
#############################
"""
This is a simple example of the use of the class candlestick.
"""

# import candlesticks_simpletest

import displayio
import board
from candlesticks import Candlestick

display = board.DISPLAY

my_candle = Candlestick(
    100,
    60,
    30,
    80,
    5,
    color_green=0x00FF00,
    color_red=0xFF0000,
    screen_ref=180,
)

my_candle2 = Candlestick(
    120,
    43,
    60,
    80,
    25,
    color_green=0x00FF00,
    color_red=0xFF0000,
    screen_ref=180,
)

my_candle3 = Candlestick(
    140,
    10,
    45,
    65,
    25,
    color_green=0x00FF00,
    color_red=0xFF0000,
    screen_ref=180,
)

my_candle4 = Candlestick(
    160,
    85,
    15,
    85,
    15,
    color_green=0x00FF00,
    color_red=0xFF0000,
    screen_ref=180,
)
my_candle5 = Candlestick(
    180,
    15,
    25,
    85,
    30,
    color_green=0x00FF00,
    color_red=0xFF0000,
    screen_ref=180,
)


main_group = displayio.Group()
main_group.append(my_candle.my_rep)
main_group.append(my_candle2.my_rep)
main_group.append(my_candle3.my_rep)
main_group.append(my_candle4.my_rep)
main_group.append(my_candle5.my_rep)

display.show(main_group)

while True:
    pass
