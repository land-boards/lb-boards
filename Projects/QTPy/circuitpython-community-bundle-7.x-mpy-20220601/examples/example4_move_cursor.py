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
 Serial LCD Example 4 - example4_move_cursor.py
 Written by Gaston Williams, July 14th, 2019
 Based on Arduino code written by Gaston Williams and
 Nathan Seidle @ Sparkfun, August 22, 2018.


 Example 4 - Move Cursor:
 This program displays text and then moves the cursor back and forth.
"""
from time import sleep
import board
from sparkfun_serlcd import Sparkfun_SerLCD_I2C

i2c = board.I2C()
serlcd = Sparkfun_SerLCD_I2C(i2c)

print("Example 4: Move Cursor")
print("Press Ctrl-C to end program.")

# Clear the display before writing random letters
serlcd.clear()
# Turn the cursor on
serlcd.cursor(True)
try:
    while True:
        serlcd.clear()
        serlcd.write("Watch cursor!  ")
        serlcd.move_cursor_left()
        sleep(0.5)
        serlcd.move_cursor_left()
        sleep(0.5)
        serlcd.move_cursor_left()
        sleep(0.5)

        # Move back in one step
        serlcd.move_cursor_right(3)
        sleep(0.5)

        # Move cursor ahead 3 places in 1 step
        serlcd.move_cursor_right(3)
        sleep(0.5)

        # Move back in 3 steps
        serlcd.move_cursor_left()
        sleep(0.5)
        serlcd.move_cursor_left()
        sleep(0.5)
        serlcd.move_cursor_left()
        sleep(0.5)

except KeyboardInterrupt:
    pass
