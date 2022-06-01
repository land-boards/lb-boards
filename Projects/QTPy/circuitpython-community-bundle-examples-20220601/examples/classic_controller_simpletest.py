# SPDX-FileCopyrightText: 2021 John Furcean
# SPDX-License-Identifier: MIT

import board
from wiichuck.classic_controller import ClassicController

controller = ClassicController(board.I2C())

while True:
    joysticks, buttons, dpad, triggers = controller.values

    # center for the right joystick is (16,16)
    if (joysticks.rx, joysticks.ry) != (16, 16):
        print("Right joystick = {},{}".format(joysticks.rx, joysticks.ry))

    # center for the left joystick is (32,32)
    if (joysticks.lx, joysticks.ly) != (32, 32):
        print("Left joystick = {},{}".format(joysticks.lx, joysticks.ly))

    # triggers when not pressed is at (0,0)
    # Classic Controler Pro as no potentiometer and only report 0 or 31
    if (triggers.left, triggers.right) != (0, 0):
        print("Trigger left and right = {},{}".format(triggers.left, triggers.right))

    if buttons.A:
        print("button A")
    if buttons.B:
        print("button B")
    if buttons.X:
        print("button X")
    if buttons.Y:
        print("button Y")
    if buttons.R:
        print("button R")
    if buttons.L:
        print("button L")
    if buttons.ZR:
        print("button ZR")
    if buttons.ZL:
        print("button ZL")
    if buttons.start:
        print("button start")
    if buttons.select:
        print("button select")
    if buttons.home:
        print("button home")

    if dpad.up:
        print("dpad up")
    if dpad.down:
        print("dpad down")
    if dpad.right:
        print("dpad right")
    if dpad.left:
        print("dpad left")
