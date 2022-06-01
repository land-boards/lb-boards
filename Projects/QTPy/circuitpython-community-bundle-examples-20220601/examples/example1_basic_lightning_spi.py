# SPDX-FileCopyrightText: Copyright (c) 2021 Gaston Williams
#
# SPDX-License-Identifier: MIT

#  This is example is for the SparkFun Qwiic AS3935 Lightning Detector.
#  SparkFun sells these at its website: www.sparkfun.com
#  Do you like this library? Help support SparkFun. Buy a board!
#  https://www.sparkfun.com/products/15276

"""
 Qwiic AS3935 Lightning Detector Example 1 - example1_basic_lightning.py
 Written by Gaston Williams, July 4th, 2019
 Based on Arduino code written by
 Elias Santistevan @ SparkFun Electronics, May, 2019
 The Qwiic AS3935 is an I2C (or SPI) controlled lightning detector.

 Example 1 - Basic Lightning (SPI):
 This program uses the Qwiic AS3935 CircuitPython Library to
 control the Qwiic AS3935 Lightning detector over SPI to listen for
 lightning events. The lightning detector determines whether or
 not it's actual lightning, a disturber, or noise. In the case
 your environment has a lot of noise or electrical disturbances
 you can uncomment methods to adjust the noise floor or the disturber
 watch dog threshold values.


 For this example you will need to connect the INT pin on Qwiic to
 GPIO D21 on the Raspberry Pi.  The interrupt pin will go high when an
 event occurs.
"""
import sys
from time import sleep
import board
import busio
import digitalio
import sparkfun_qwiicas3935

# global variables with defaults
noise_floor = 2
watchdog_threshold = 2

# Set up Interrupt pin on GPIO D21 with a pull-down resistor
as3935_interrupt_pin = digitalio.DigitalInOut(board.D21)
as3935_interrupt_pin.direction = digitalio.Direction.INPUT
as3935_interrupt_pin.pull = digitalio.Pull.DOWN

# Create a library object using the Bus SPI port
spi = busio.SPI(board.SCK, board.MOSI, board.MISO)

# Set up chip select on D20
# CS can be any available GPIO pin
cs = digitalio.DigitalInOut(board.D20)
cs.direction = digitalio.Direction.OUTPUT

lightning = sparkfun_qwiicas3935.Sparkfun_QwiicAS3935_SPI(spi, cs)

# define functions
def reduce_noise(value):
    # This function helps to adjust the sensor to your environment. More
    # environmental noise leads to more false positives. If you see lots of noise
    # events, try increasing the noise threshold with this function. The datsheet
    # warns that smartphone and smart watch displays, DC-DC converters, and/or
    # anything that operates in 500 kHz range are noise sources to be avoided.
    # The manufacturer's default value is 2 with a maximum value of 7.
    value += 1

    if value > 7:
        print("Noise floor is at the maximum value.")
        return 7
    print("Increasing the noise event threshold to ", value)
    lightning.noise_level = value
    return value


def increase_threshold(value):
    # This function is similar to the one above in that it will increase the
    # antenna's robustness against false positives. However, this function helps
    # to increase the robustness against "distrubers" and not "noise". If you
    # have a lot of disturbers trying increasing the watchdog threshold.
    # The default value is 2 and goes up to 10."""

    value += 1
    if value > 10:
        print("Watchdog threshold is at its maximum value")
        return 10
    print("Increasing the disturber watchdog threshold to ", value)
    lightning.watchdog_threshold = value
    return value


# main code

print("AS3935 Franklin Lightning Detector")

# Check if connected
if lightning.connected:
    print("Schmow-ZoW, Lightning Detector Ready!")
else:
    print("Lightning Detector does not appear to be connected. Please check wiring.")
    sys.exit()

# get the current noise floor value
noise_floor = lightning.noise_level
print("The noise floor is ", noise_floor)

# get the current disturber threshold
watchdog_threshold = lightning.watchdog_threshold
print("The disturber watchdog threshold is ", watchdog_threshold)

print("Type Ctrl-C to exit program.")

try:
    while True:
        # When the interrupt goes high
        if as3935_interrupt_pin.value:
            print("Interrupt:", end=" ")
            interrupt_value = lightning.read_interrupt_register()

            if interrupt_value == lightning.NOISE:
                print("Noise.")
                # uncomment line below to adjust the noise level (see function comments above)
                # noise_floor = reduce_noise(noise_floor)
            elif interrupt_value == lightning.DISTURBER:
                print("Disturber.")
                # uncomment the line below to adjust the watchdog threshold
                # (see function comments above)
                # watchdog_threshold = increase_threshold(watchdog_threshold)
            elif interrupt_value == lightning.LIGHTNING:
                print("Lightning strike detected!")
                print("Approximately: " + str(lightning.distance_to_storm) + "km away!")
                print("Energy value: " + str(lightning.lightning_energy))
        sleep(1)

except KeyboardInterrupt:
    pass
