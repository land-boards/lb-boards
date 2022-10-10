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
 Serial LCD Example 9 - example9_custom_characters.py
 Written by Gaston Williams, July 16, 2019
 Based on Arduino code written by Gaston Williams and
 Nathan Seidle @ Sparkfun, August 22, 2018.


 Example 9 - Custom Characters:
 This program prints "I <heart> SerLCD! <smiley>" with a little dancing
 man to the LCD. Since the Serial OpenLCD display uses a serial command
 to display a customer character, the writeChar() method was added for
 this function.  Custom characters are recorded to SerLCD and they are
 remembered even after power is lost. There is a maximum of 8 custom
 characters that can be recorded.
"""
from time import sleep
import board
from sparkfun_serlcd import Sparkfun_SerLCD_I2C

i2c = board.I2C()
serlcd = Sparkfun_SerLCD_I2C(i2c)

# Define some custom characters as 8 x 5 bitmap arrays
heart = [0b00000, 0b01010, 0b11111, 0b11111, 0b11111, 0b01110, 0b00100, 0b00000]

smiley = [0b00000, 0b00000, 0b01010, 0b00000, 0b00000, 0b10001, 0b01110, 0b00000]

frownie = [0b00000, 0b00000, 0b01010, 0b00000, 0b00000, 0b00000, 0b01110, 0b10001]

arms_down = [0b00100, 0b01010, 0b00100, 0b00100, 0b01110, 0b10101, 0b00100, 0b01010]

arms_up = [0b00100, 0b01010, 0b00100, 0b10101, 0b01110, 0b00100, 0b00100, 0b01010]

print("Example 9: Custom Character")
print("Press Ctrl-C to end program.")

# Clear the display
serlcd.clear()

# Send custom characters to display
# These are recorded to SerLCD and are remembered even after power is lost
# There is a maximum of 8 custom characters that can be recorded

serlcd.create_character(0, heart)
serlcd.create_character(1, smiley)
serlcd.create_character(2, frownie)
serlcd.create_character(3, arms_down)
serlcd.create_character(4, arms_up)

# Print a message to the LCD.
serlcd.write("I ")
# Write the heart character. We use write_character since it's a serial display.
serlcd.write_character(0)
serlcd.write(" SerLCD! ")
# Write smiley
serlcd.write_character(1)

try:
    while True:
        serlcd.set_cursor(4, 1)  # column, row
        serlcd.write_character(3)  # Print the little man, arms down
        sleep(0.200)

        serlcd.set_cursor(4, 1)  # column, row
        serlcd.write_character(4)  # Print the little man, arms up
        sleep(0.200)

except KeyboardInterrupt:
    pass
