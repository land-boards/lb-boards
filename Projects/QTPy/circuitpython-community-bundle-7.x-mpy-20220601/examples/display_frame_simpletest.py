"""
Example script that draws a basic frame. Uses default
value for all available fields.
"""
# SPDX-FileCopyrightText: 2020 Tim C
#
# SPDX-License-Identifier: MIT
import board
import displayio
from circuitpython_display_frame import Frame

display = board.DISPLAY
main_group = displayio.Group()

example_frame = Frame(10, 10, display.width // 3, display.height - 16)
main_group.append(example_frame)

display.show(main_group)
while True:
    pass
