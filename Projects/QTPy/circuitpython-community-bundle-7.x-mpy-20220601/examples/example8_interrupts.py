# SPDX-FileCopyrightText: Copyright (c) 2019-2021 Gaston Williams
#
# SPDX-License-Identifier: MIT

#  This is example is for the SparkFun Qwiic Single Twist.
#  SparkFun sells these at its website: www.sparkfun.com
#  Do you like this library? Help support SparkFun. Buy a board!
#  https://www.sparkfun.com/products/15083

"""
 Qwiic Twist Example 8 - example8_interrupts.py
 Written by Gaston Williams, June 19th, 2019
 Based on Arduino code written by
 Nathan Seidle @ Sparkfun, December 3rd, 2018
 The Qwiic Twist is an I2C controlled RGB Rotary Encoder produced by sparkfun

 Example 8 - Interrupts:
 This program uses the Qwiic Twist CircuitPython Library to
 control the Qwiic Twist RGB Rotrary Encoder over I2C  to enable
 the button and twist interrupts. Once an interrupt is read,
 it is cleared by the library. For this example you will need to
 connect the INT pin on Qwiic to GPIO D6 on the Raspberry Pi.

 The interrupt will not fire until 250ms after the user has stopped
 turning the encoder. This is so the master is not overwhelmed with
  interrupts while the user is still turning the dial.
"""
import sys
import board
import digitalio
import sparkfun_qwiictwist

# Create bus object using our board's I2C port
i2c = board.I2C()

# Set up Interrupt pin on GPIO D6 with a pull-up resistor
twist_interrupt_pin = digitalio.DigitalInOut(board.D6)
twist_interrupt_pin.direction = digitalio.Direction.INPUT
twist_interrupt_pin.pull = digitalio.Pull.UP

# Create twist object
twist = sparkfun_qwiictwist.Sparkfun_QwiicTwist(i2c)

print("Qwicc Twist Example 8 Interrupts")

# Check if connected
if twist.connected:
    print("Twist connected.")
else:
    print("Twist does not appear to be connected. Please check wiring.")
    sys.exit()

# Optional: You can modify the time between when the user has stopped turning
# and when interrupt is raised

# Set twist timeout to 500ms before interrupt assertion
# twist.int_timeout = 500

print("Type Ctrl-C to exit program.")

try:
    while True:
        # When the interrupt goes low
        if not twist_interrupt_pin.value:
            print("Interrupt:")
            if twist.moved:
                print("Count: " + str(twist.count))
            if twist.pressed:
                print("Pressed!")
            if twist.clicked:
                print("Clicked!")
            twist.clear_interrupts()

except KeyboardInterrupt:
    pass
