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
 Serial LCD Example 15 - example15_message_enable.py
 Written by Gaston Williams, July 15, 2019
 Based on Arduino code written by Gaston Williams and
 Nathan Seidle @ Sparkfun, August 22, 2018.


 Example 15 - Message Enable:
 This program turns the system messages off and on. These messages are shown
 when the user changes a setting. For instance 'Contrast: 5' or 'UART: 57600'
 is no longer displayed when system messages are turned off.  This example
 and the system_messages(True) and system_messages(False) methods are only
 supported on SerLCD v1.2 and above.


"""
from time import sleep
import board
from sparkfun_serlcd import Sparkfun_SerLCD_I2C

i2c = board.I2C()
serlcd = Sparkfun_SerLCD_I2C(i2c)

print("Press Ctrl-C to end program.")


try:
    while True:
        serlcd.clear()
        serlcd.system_messages(True)
        serlcd.set_contrast(5)
        # Send invidual R, G, B backlight commands to see more messages
        serlcd.command(157)
        serlcd.command(187)
        serlcd.command(217)
        serlcd.write("Messages on")
        serlcd.set_cursor(0, 1)
        serlcd.write("White")
        sleep(3)

        serlcd.clear()
        serlcd.system_messages(False)
        serlcd.set_contrast(0)
        serlcd.command(144)
        serlcd.command(162)
        serlcd.command(202)
        serlcd.write("Messages off")
        serlcd.set_cursor(0, 1)
        serlcd.write("Purple")
        sleep(2)

except KeyboardInterrupt:
    pass
