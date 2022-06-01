# SPDX-FileCopyrightText: Copyright (c) 2021 John Furcean
#
# SPDX-License-Identifier: MIT
import board
from wiichuck.guitar import Guitar

guitar = Guitar(board.I2C())

while True:

    joystic, buttons, strum, whammy, touchbar = guitar.values

    # Joystick: (0-63,0-63), middle is (32,32)
    if joystic != (32, 32):
        print(f"Joystick (x,y): {joystic}")

    # Whammy Bar: 0-31
    if whammy > 0:
        print(f"Whammy Bar: {whammy}")

    # strum
    if strum.up:
        print("STRUM UP")
    if strum.down:
        print("STRUM DOWN")

    # Neck Buttons
    if buttons.orange:
        print("Button Pressed: ORANGE")
    if buttons.blue:
        print("Button Pressed: BLUE")
    if buttons.yellow:
        print("Button Pressed: YELLOW")
    if buttons.red:
        print("Button Pressed: RED")
    if buttons.green:
        print("Button Pressed: GREEN")

    if buttons.plus:
        print("Button Pressed: PLUS")
    if buttons.minus:
        print("Button Pressed: MINUS")
