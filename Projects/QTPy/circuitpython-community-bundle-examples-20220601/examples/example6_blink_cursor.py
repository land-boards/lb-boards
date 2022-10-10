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
 Serial LCD Example 6 - example6_blink_cursor.py
 Written by Gaston Williams, July 14th, 2019
 Based on Arduino code written by Gaston Williams and
 Nathan Seidle @ Sparkfun, August 22, 2018.


 Example 6 - Blink Cursor:
 This program displays text and makes the cursor block blink.
"""
from time import sleep
import board
from sparkfun_serlcd import Sparkfun_SerLCD_I2C

i2c = board.I2C()
serlcd = Sparkfun_SerLCD_I2C(i2c)

print("Example 6: Blink Cursor")
print("Press Ctrl-C to end program.")

# Clear the display before writing text
serlcd.clear()
serlcd.write("Hello, World!")

try:
    while True:
        # Turn the cursor on
        serlcd.blink(True)
        sleep(2)

        # Turn the cursor off
        serlcd.blink(False)
        sleep(2)

except KeyboardInterrupt:
    pass
