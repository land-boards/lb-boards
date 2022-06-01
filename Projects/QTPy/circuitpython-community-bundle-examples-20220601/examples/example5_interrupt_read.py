# SPDX-FileCopyrightText: Copyright (c) 2019-2021 Gaston Williams
#
# SPDX-License-Identifier: MIT

#  This is example is for the SparkFun Qwiic Keypad.
#  SparkFun sells these at its website: www.sparkfun.com
#  Do you like this library? Help support SparkFun. Buy a board!
#  https://www.sparkfun.com/products/15290

"""
 Qwiic Keypad Example 5 - example5_interrupt_read.py
 Written by Gaston Williams, July 2nd, 2019
 Based on Arduino code written by
 Nathan Seidle @ Sparkfun, January 21st, 2018
 And updated by
 Pete Lewis @ Sparkfun, March 21st, 2019
 The Qwiic Keypad is an I2C controlled 12-Button Keypad produced by Sparkfun.

 Example 5 - Interrupt Read:
 This program uses the Qwiic Keypad CircuitPython Library to
 control the Qwiic Keypad over I2C to enable the button interrupts.
 For this example you will need to  connect the INT pin on Qwiic to
 GPIO D6 on the Raspberry Pi.

 CircuitPython does not support callback functions for interrupts,
 so this example polls the interrupt line instead.
"""
import sys
import board
import digitalio
import sparkfun_qwiickeypad

# Create bus object using our board's I2C port
i2c = board.I2C()

# Set up Interrupt pin on GPIO D6 with a pull-up resistor
keypad_interrupt_pin = digitalio.DigitalInOut(board.D6)
keypad_interrupt_pin.direction = digitalio.Direction.INPUT
keypad_interrupt_pin.pull = digitalio.Pull.UP

# Create keypad object
keypad = sparkfun_qwiickeypad.Sparkfun_QwiicKeypad(i2c)

print("Qwicc Keypad Example 5 Interrupt Read")

# Check if connected
if keypad.connected:
    print("Keypad connected. Firmware: ", keypad.version)
else:
    print("Keypad does not appear to be connected. Please check wiring.")
    sys.exit()

print("Press a button on the keypad and it will print here.")
print("Type Ctrl-C to exit program.")

try:
    while True:
        # When the interrupt pin goes low
        if not keypad_interrupt_pin.value:
            keypad.update_fifo()
            button = keypad.button
            # Display the button value
            if button > 0:
                print("Button '" + chr(button) + "' was pressed.")


except KeyboardInterrupt:
    pass
