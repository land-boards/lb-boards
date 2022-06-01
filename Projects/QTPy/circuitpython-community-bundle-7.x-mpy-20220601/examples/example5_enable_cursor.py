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
 Serial LCD Example 5 - example4_enable_cursor.py
 Written by Gaston Williams, July 14th, 2019
 Based on Arduino code written by Gaston Williams and
 Nathan Seidle @ Sparkfun, August 22, 2018.


 Example 5 - Enable Cursor:
 This program displays text and uses the cursor(True) and cursor(False)
 methods to turn the cursor on and off.
"""
from time import sleep
import board
from sparkfun_serlcd import Sparkfun_SerLCD_I2C

i2c = board.I2C()
serlcd = Sparkfun_SerLCD_I2C(i2c)

print("Example 5: Enable Cursor")
print("Press Ctrl-C to end program.")

# Clear the display before writing text
serlcd.clear()
serlcd.write("Hello, World!")

try:
    while True:
        # Turn the cursor on
        serlcd.cursor(True)
        sleep(0.5)

        # Turn the cursor off
        serlcd.cursor(False)
        sleep(0.5)

except KeyboardInterrupt:
    pass
