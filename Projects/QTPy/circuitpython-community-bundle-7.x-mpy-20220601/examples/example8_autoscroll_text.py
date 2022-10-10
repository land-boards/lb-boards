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
 Serial LCD Example 8 - example6_autoscroll_text.py
 Written by Gaston Williams, July 14th, 2019
 Based on Arduino code written by Gaston Williams and
 Nathan Seidle @ Sparkfun, August 22, 2018.


 Example 8 - Autoscroll Text:
 This program use of the autoscroll(True) and autoscroll(False)
 to make new text scroll or not.
"""
from time import sleep
import board
from sparkfun_serlcd import Sparkfun_SerLCD_I2C

i2c = board.I2C()
serlcd = Sparkfun_SerLCD_I2C(i2c)

print("Example 8: Autoscroll Text")
print("Press Ctrl-C to end program.")

# Clear the display before writing text

try:
    while True:
        serlcd.clear()

        # Print from 0 to 9:
        for i in range(10):
            serlcd.write(str(i))
            sleep(0.5)

        # Set display to automatically scroll:
        serlcd.autoscroll(True)

        # Print from 0 to 9:
        for i in range(10):
            # Set cursor to end of string as we add letters
            serlcd.set_cursor(10 + i, 0)
            serlcd.write(str(i))
            sleep(0.5)

        # Turn off automatic scrolling
        serlcd.autoscroll(False)
        sleep(1)

except KeyboardInterrupt:
    pass
