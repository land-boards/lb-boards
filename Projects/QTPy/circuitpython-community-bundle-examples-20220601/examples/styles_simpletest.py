# SPDX-FileCopyrightText: 2020 Jose David Montoya
# SPDX-License-Identifier: Unlicense

"""
This example shows the use of library with an adafruit_display_text.label object
"""

import board
import terminalio
from adafruit_display_text import label
from styles import apply_style
from styles.styles import DarkBlue

text = "Hello world"
text_area = label.Label(terminalio.FONT, text=text)
text_area.x = 10
text_area.y = 10
apply_style(text_area, DarkBlue)
board.DISPLAY.show(text_area)
while True:
    pass
