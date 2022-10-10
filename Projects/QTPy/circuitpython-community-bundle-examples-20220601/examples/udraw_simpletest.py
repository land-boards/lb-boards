# SPDX-FileCopyrightText: 2021 John Furcean
# SPDX-License-Identifier: MIT

import board
from wiichuck.udraw import UDraw

controller = UDraw(board.I2C())

while True:
    position, buttons, pressure = controller.values

    # off grid position is (4095,4095)
    if (position.x, position.y) != (4095, 4095):
        print("Pen position = {},{}".format(position.x, position.y))

    # off pressure on the tip of the pen is 8
    if pressure != 8:
        print("Pen pressure = {}".format(pressure))

    if buttons.C:
        print("button C")
    if buttons.Z:
        print("button Z")
    if buttons.tip:
        print("button tip")
