# SPDX-FileCopyrightText: 2017 Scott Shawcroft, written for Adafruit Industries
# SPDX-FileCopyrightText: Copyright (c) 2021 Gaston Williams
#
# SPDX-License-Identifier: MIT

#  This is example is for the SparkFun Serial LCD displays.
#  SparkFun sells these at its website: www.sparkfun.com
#  Do you like this library? Help support SparkFun. Buy a board!
#  https://www.sparkfun.com/products/14072
#  https://www.sparkfun.com/products/14073
#  https://www.sparkfun.com/products/14074

"""
 Serial LCD Example 7 - example6_scroll_display.py
 Written by Gaston Williams, July 14th, 2019
 Based on Arduino code written by Gaston Williams and
 Nathan Seidle @ Sparkfun, August 22, 2018.


 Example 7 - Scroll Display:
 This program displays text and uses the scroll_display_left() and the
 scroll_display_right() methods to scroll the text.
"""
from time import sleep
import board
from sparkfun_serlcd import Sparkfun_SerLCD_I2C

i2c = board.I2C()
serlcd = Sparkfun_SerLCD_I2C(i2c)

print("Example 7: Scroll Display")
print("Press Ctrl-C to end program.")

# Clear the display before writing text

try:
    while True:
        serlcd.clear()
        serlcd.write("Hello, World!")
        sleep(1)

        # Scroll 13 positions (string length) to the left to move offscreen
        for i in range(13):
            # Scroll one position left
            serlcd.scroll_display_left()
            # wait a bit
            sleep(0.150)

        # Scroll 29 positions (string length + display length) to the right
        # to move text offscreen right.
        for i in range(29):
            # Scroll one position right:
            serlcd.scroll_display_right()
            # wait a bit:
            sleep(0.150)

        # Scroll 16 positions (display length + string length) to the left
        # to move it back to center:
        for i in range(16):
            # Scroll one position left:
            serlcd.scroll_display_left()
            # wait a bit:
            sleep(0.150)

        # delay at the end of the full loop
        sleep(1)

except KeyboardInterrupt:
    pass
