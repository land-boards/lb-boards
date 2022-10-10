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
 Serial LCD Example 3 - example3_cursor_position.py
 Written by Gaston Williams, July 14th, 2019
 Based on Arduino code written by Gaston Williams and
 Nathan Seidle @ Sparkfun, August 22, 2018.


 Example 3 - Cursor Position:
 This program randomly picks a cursor position, goes to that
 position using the set _cursor() method, and prints a character.
"""
import time
import random
import board
from sparkfun_serlcd import Sparkfun_SerLCD_I2C

i2c = board.I2C()
serlcd = Sparkfun_SerLCD_I2C(i2c)

# These constants match a 16x2 SerLCD display
num_cols = 16
num_rows = 2
# For a 20 x 4 SerLCD display use these values instead
# num_cols = 20
# num_rows = 4

# Starting character value
letter = ord("a")

print("Example 3: Cursor Position")
print("Press Ctrl-C to end program.")

# Clear the display before writing random letters
serlcd.clear()

try:
    while True:
        # pick a random column 0 to 15 (or 19)
        col = random.randint(0, num_cols - 1)
        # pick a random row 0 to 1 (or 3)
        row = random.randint(0, num_rows - 1)

        # Move to random location and write the next letter
        serlcd.set_cursor(col, row)
        serlcd.write(chr(letter))

        # Get the next letter wrapping around after z
        letter += 1
        if letter > ord("z"):
            letter = ord("a")

        time.sleep(0.5)

except KeyboardInterrupt:
    pass
