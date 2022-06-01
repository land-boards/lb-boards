# SPDX-FileCopyrightText: 2020 Jose David M.
# SPDX-License-Identifier: Unlicense

"""
This example shows the use of styles in different graphical elements
"""

import time
import board
import displayio
from adafruit_display_text import label
from adafruit_progressbar.horizontalprogressbar import (
    HorizontalProgressBar,
    HorizontalFillDirection,
)
from adafruit_bitmap_font import bitmap_font
from adafruit_button import Button
from styles import apply_style
from styles.styles import (
    DarkBlue,
    BlueMono,
    GreenMono,
    BrownBlue,
    BrightColors,
)


display = board.DISPLAY

# Creating a Label
font = bitmap_font.load_font("../fonts/Helvetica-Bold-16.bdf")
text_area = label.Label(font, text="Hello world", x=30, y=30)
main_group = displayio.Group()
main_group.append(text_area)

# Creating a Progress Bar
progress_bar = HorizontalProgressBar(
    (display.width // 2 - display.width // 2, display.height // 3),
    (display.width - 40, 30),
    direction=HorizontalFillDirection.LEFT_TO_RIGHT,
)
progress_bar.value = 50
main_group.append(progress_bar)

# Creating a Button
button = Button(
    x=display.width // 2,
    y=display.height // 2,
    width=100,
    height=50,
    style=Button.ROUNDRECT,
    fill_color=0x00FFFF,
    outline_color=0xFF00FF,
    label="Hello world",
    label_font=font,
    label_color=0x000000,
)
main_group.append(button)

# Preparing the Colors to display
colors_change = [DarkBlue, BlueMono, GreenMono, BrownBlue, BrightColors]
display.show(main_group)
counter = 0

while True:
    if counter == len(colors_change):
        counter = 0
    apply_style(text_area, colors_change[counter])
    apply_style(progress_bar, colors_change[counter])
    apply_style(button, colors_change[counter])
    display.refresh()
    time.sleep(2)
    counter = counter + 1
