# SPDX-FileCopyrightText: 2020 Tim C, written for Adafruit Industries
#
# SPDX-License-Identifier: Unlicense
"""
Make green and purple rectangles and a
"Hello World" label.
"""
import displayio
from blinka_displayio_pygamedisplay import PyGameDisplay
from circuitpython_display_frame import Frame


# Make the display context
display = PyGameDisplay(icon="", width=800, height=600)

# Make the display context
main_group = displayio.Group(max_size=10)


example_frame = Frame(20, 20, display.width // 3, display.height - 40)
main_group.append(example_frame)

display.show(main_group)

while display.running:
    pass
