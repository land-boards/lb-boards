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
 Serial LCD Example 16 - example16_splash_screen.py
 Written by Gaston Williams, July 15, 2019
 Based on Arduino code written by Gaston Williams and
 Nathan Seidle @ Sparkfun, August 22, 2018.


 Example 16 - Splash Screen:
 This program sets the power splash screen on the display. You can set
 the text to anything you like. After changing the splash screen you will
 need to power down and power up the display to see the change. To return
 to the original default splash screen, display a single character 0xFF,
 and save that as the splash screen.
"""
import board
from sparkfun_serlcd import Sparkfun_SerLCD_I2C

i2c = board.I2C()
serlcd = Sparkfun_SerLCD_I2C(i2c)

print("Example 16: Splash Screen")

# Set backlight to bright white
serlcd.set_backlight_rgb(255, 255, 255)
# Set contrast. Lower to 0 for higher contrast.
serlcd.set_contrast(5)

# Clear the display - this moves the cursor to home position as well
serlcd.clear()

# Display whatever splash screen message you like here
serlcd.write("Fozziwig's Chicken Factory!")

# Save the current text as the splash screen at next power on
serlcd.save_splash_screen()

# Uncomment this line to set splash screen back to default
# serlcd.default_splash_screen()

# This will cause the splash to be displayed at power on
serlcd.splash_screen(True)

# Uncomment the next line to supress any splash display at power on
# serlcd.splash_screen(False)

print("Power off dislpay. Then Power back on to see Splash Screen changes.")
