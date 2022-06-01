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
 Serial LCD Example 11 - example11_text_direction.py
 Written by Gaston Williams, July 14th, 2019
 Based on Arduino code written by Gaston Williams and
 Nathan Seidle @ Sparkfun, August 22, 2018.


 Example 11 - Text Direction:
 This program uses left_to_right() and right_to_left()
 to change where the next character will be written.
"""
from time import sleep
import board
from sparkfun_serlcd import Sparkfun_SerLCD_I2C

i2c = board.I2C()
serlcd = Sparkfun_SerLCD_I2C(i2c)

print("Example 11: Text Direction")
print("Press Ctrl-C to end program.")

serlcd.write("Hello, world!")

letter_a = ord("a")
letter_j = ord("j")
letter_q = ord("q")
letter_z = ord("z")

# Start with letter 'a'
letter = letter_a

# Clear the display
serlcd.clear()

# Turn on the cursor
serlcd.cursor(True)

try:
    while True:
        # Reverse direction at 'j'
        if letter == letter_j:
            serlcd.right_to_left()

        # Reverse again at 'q'
        if letter == letter_q:
            serlcd.left_to_right()

        # Reset at 'z' and go to (0,0)
        if letter > letter_z:
            letter = letter_a
            serlcd.clear()
            sleep(0.5)

        serlcd.write(chr(letter))
        sleep(1)  # wait a second
        letter += 1

except KeyboardInterrupt:
    pass
