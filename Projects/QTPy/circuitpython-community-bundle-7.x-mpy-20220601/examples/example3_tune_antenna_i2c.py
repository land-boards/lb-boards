# SPDX-FileCopyrightText: Copyright (c) 2021 Gaston Williams
#
# SPDX-License-Identifier: MIT

#  This is example is for the SparkFun Qwiic AS3935 Lightning Detector.
#  SparkFun sells these at its website: www.sparkfun.com
#  Do you like this library? Help support SparkFun. Buy a board!
#  https://www.sparkfun.com/products/15276

"""
 Qwiic AS3935 Example 3 - example3_tune_antenna.py
 Written by Gaston Williams, July 6th, 2019
 Based on Arduino code written by
 Elias Santistevan @ SparkFun Electronics, May, 2019
 The Qwiic AS3935 is an I2C (or SPI) controlled lightning detector.

 Example 3 - Tune Antenna (I2C):
 This program uses the Qwiic AS3935 CircuitPython Library to control
 the Qwiic AS3935 Lightning detector over I2C to tune the resonance
 frequency of the antenna. The chip provides internal capacitance that
 can be modified by the  library. You'll need a logic analyzer,
 oscillscope, or some method of reading a 32kHz square wave (depending
 on the frequency divsior used) on the INT pin.
"""
import sys
import board
import sparkfun_qwiicas3935

# Create bus object using our board's I2C port
i2c = board.I2C()

# Create as3935 object
lightning = sparkfun_qwiicas3935.Sparkfun_QwiicAS3935_I2C(i2c)

print("AS3935 Franklin Lightning Detector")

# Check if connected
if lightning.connected:
    print("Ready to tune antenna.")
else:
    print("Lightning Detector does not appear to be connected. Please check wiring.")
    sys.exit()

# You can reset all the lightning detector settings back to their default values
# by uncommenting the line below.
# lightning.reset()

# When reading the frequency, keep in mind that the given frequency is
# divided by 16 by default. This can be changed to be divided by 32, 64, or
# 128 using the line below. So for example when reading the frequency on a
# board, if the frequency is 32.05kHz, multipling by 16 gives the result of
# 512.8kHz. This is 2.56 percent away from the 500kHz ideal value and well
# within the 3.5 percent optimal tolerance. If one were to change the
# division ratio to 32, then one would read a value of 16kHz instead.
# To change the division ratio uncomment the line below
# lightning.division_ratio = 16

# The following code is just a sanity check. It will return a value of
# 16 by default but can be 32, 64, or 128, depending on what value you set.
print("Division Ratio is set to: ", str(lightning.division_ratio))

# Here you can set a value of 0-120, which increases the capacitance on
# the RLC circuit in steps of 8pF, up to 120pF. The change in frequency is
# very modest. At 15 (max - 120pF), the frequency is around 490kHz down from
# 512kHz. The equation for calculating frequency in an RLC circuit is:
# f = 1/(2pi*sqrt(LC))
# To change the capacitance, uncomment the line below.
# lightning.tune_cap = 0

# When reading the internal capcitor value, it will return the value in pF.
print("Internal Capacitor is set to: " + str(lightning.tune_cap))

# This will tell the AS3935 to display the resonance frequncy as a digital
# signal on the interrupt pin. There are two other internal oscillators
# that within the AS3935 that can also be displayed on this line. See the
# datasheet for more information.
# Uncomment the lines below to turn the display on and off. To start
# displaying the antenna frequency, use True as the state parameter. To
# stop displaying the frequncy on the interrupt line, use False.

# print('----Displaying oscillator on INT pin.----')
# lightning.display_oscillator(True, lightning.ANTENNA_FREQ)
# print('----Stop Display of oscillator on INT pin.----')
# lightning.display_oscillator(False, lightning.ANTENNA_FREQ)
