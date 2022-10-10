# SPDX-FileCopyrightText: 2021 Jose David M.
#
# SPDX-License-Identifier: MIT
#############################
"""
This is an example of the use of the arrowline function. Using
Multiple arrows and including a Circle Pointer
"""

import displayio
import board
from arrowline import line_arrow


display = board.DISPLAY

my_group = displayio.Group()

bitmap = displayio.Bitmap(320, 240, 5)

screen_palette = displayio.Palette(3)
screen_palette[1] = 0x00AA00
screen_tilegrid = displayio.TileGrid(
    bitmap,
    pixel_shader=screen_palette,
    x=30,
    y=0,
)

my_group.append(screen_tilegrid)

line = line_arrow(screen_tilegrid, 40, 32, 45, 60, 12, screen_palette, 1)
line2 = line_arrow(screen_tilegrid, 60, 22, 33, 14, 6, screen_palette, 1)
line3 = line_arrow(
    screen_tilegrid, 100, 102, 150, 150, 14, screen_palette, 1, pointer="C"
)
line4 = line_arrow(screen_tilegrid, 0, 102, 0, 150, 12, screen_palette, 1)
line5 = line_arrow(
    screen_tilegrid, 239, 319, 220, 30, 12, screen_palette, 1, pointer="C"
)


my_group.append(line)
my_group.append(line2)
my_group.append(line3)
my_group.append(line4)
my_group.append(line5)
display.show(my_group)

while True:
    pass
