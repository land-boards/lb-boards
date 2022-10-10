# SPDX-FileCopyrightText: 2021 David Glaude
# SPDX-License-Identifier: MIT

import board
import usb_hid
from adafruit_hid.mouse import Mouse
from wiichuck.udraw import UDraw

udraw = UDraw(board.I2C())

m = Mouse(usb_hid.devices)

zDown = False
pDown = False

oldx = 4095
oldy = 4095

while True:
    # We don't use the pressure, maybe converting to watcom protocol would permit that
    position, buttons, _ = udraw.values

    P = buttons.tip or buttons.C  # Both the C button and tip work as LEFT mouse click

    # Handeling the button to create mouse click
    if P and not pDown:
        m.press(Mouse.LEFT_BUTTON)
        pDown = True
    elif not P and pDown:
        m.release(Mouse.LEFT_BUTTON)
        pDown = False

    if buttons.Z and not zDown:
        m.press(Mouse.RIGHT_BUTTON)
        zDown = True
    elif not buttons.Z and zDown:
        m.release(Mouse.RIGHT_BUTTON)
        zDown = False

    # Values (4095,4095) mean the pen is not near the tablet
    if position.x == 4095 or position.y == 4095:
        oldx = 4095
        oldy = 4095
        continue  # We remember that the pen was raised UP

    # If we reach here, the pen was UP and is now DOWN
    if oldx == 4095 or oldy == 4095:
        oldx = position.x
        oldy = position.y
        continue

    if (position.x != oldx) or (
        position.y != oldy
    ):  # PEN has moved we move the HID mouse
        m.move((position.x - oldx), (oldy - position.y), 0)
        oldx = position.x
        oldy = position.y
