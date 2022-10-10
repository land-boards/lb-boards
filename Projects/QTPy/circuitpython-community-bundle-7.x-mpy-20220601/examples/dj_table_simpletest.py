# SPDX-FileCopyrightText: Copyright (c) 2021 John Furcean
#
# SPDX-License-Identifier: MIT
import board
from wiichuck.dj_table import DJTable

dj = DJTable(board.I2C())

while True:

    joystick, buttons, turntables, dial, slider = dj.values

    # Joystick
    if (joystick.x, joystick.y) != (31, 31):
        print("Joystick (x,y): {}".format(joystick))

    if turntables.right.value != 0:
        print("TurnTable Right: {}".format(turntables.right.value))

    # Buttons: True of False
    if turntables.right.blue:
        print("Button Pressed: Blue")
    if turntables.right.red:
        print("Button Pressed: Red")
    if turntables.right.green:
        print("Button Pressed: Green")

    if buttons.euphoria:
        print("Button Pressed: Euphoria")
    if buttons.plus:
        print("Button Pressed: Plus")
    if buttons.minus:
        print("Button Pressed: Minus")

    # Cross Fade Slider
    if slider != 0:
        print("Cross Fade Slider: {}".format(dj.slider))

    # Effect Dial
    if dial != 0:
        print("Effect Dial: {}".format(dj.dial))
