# SPDX-FileCopyrightText: Copyright (c) 2021 Gaston Williams
#
# SPDX-License-Identifier: MIT

#  This is example is for the SparkFun Qwiic AS3935 Lightning Detector.
#  SparkFun sells these at its website: www.sparkfun.com
#  Do you like this library? Help support SparkFun. Buy a board!
#  https://www.sparkfun.com/products/15276

"""
 Qwiic AS3935 Example 2 - example2_more_lightning_features.py
 Written by Gaston Williams, July 6th, 2019
 Based on Arduino code written by
 Elias Santistevan @ SparkFun Electronics, May, 2019
 The Qwiic AS3935 is an I2C (or SPI) controlled lightning detector.

 Example 2 - More Lightning Features (I2C):
 This program uses the Qwiic AS3935 CircuitPython Library to
 control the Qwiic AS3935 Lightning detector over I2C to listen for
 lightning events.  This example provides a more in depth guide
 to some more of the library's functions that aid in reducing false
 events and noise.

 For this example you will need to connect the INT pin on Qwiic to
 GPIO D21 on the Raspberry Pi.  The interrupt pin will go high when an
 event occurs.
"""
import sys
from time import sleep
import board
import digitalio
import sparkfun_qwiicas3935

# Set up Interrupt pin on GPIO D6 with a pull-down resistor
as3935_interrupt_pin = digitalio.DigitalInOut(board.D21)
as3935_interrupt_pin.direction = digitalio.Direction.INPUT
as3935_interrupt_pin.pull = digitalio.Pull.DOWN

# Create bus object using our board's I2C port
i2c = board.I2C()

# Create as3935 object
lightning = sparkfun_qwiicas3935.Sparkfun_QwiicAS3935_I2C(i2c)

print("AS3935 Franklin Lightning Detector")

# Check if connected
if lightning.connected:
    print("Schmow-ZoW, Lightning Detector Ready!")
else:
    print("Lightning Detector does not appear to be connected. Please check wiring.")
    sys.exit()

# You can reset all the lightning detector settings back to their default values
# by uncommenting the line below.
# lightning.reset()

# The lightning detector defaults to an indoor setting (less gain/sensitivity),
# if you plan on using this outdoors uncomment the following line:
# lightning.indoor_outdoor = lightning.OUTDOOR

# Read the Lightning Detector Analog Front End (AFE) mode and print it out.
afe_mode = lightning.indoor_outdoor

if afe_mode == lightning.OUTDOOR:
    print("The Lightning Detector is in the Outdoor mode.")
elif afe_mode == lightning.INDOOR:
    print("The Lightning Detector is in the Indoor mode.")
else:
    print("The Lightning Detector is in an Unknown mode.")

# Disturbers are events that are false lightning events. If you see a lot
# of disturbers you can enable the disturber mask to have the chip not report
# those events as an interrupt.
# Uncomment one of the lines below to turn on disturber mask on or off
# lightning.mask_disturber = True
# lightning.mask_disturber = False
print("Are disturbers being masked?", end=" ")
if lightning.mask_disturber:
    print("Yes.")
else:
    print("No.")


# The Noise floor setting from 1-7, one being the lowest.
# The default setting is two.
# If you need to change the setting, uncomment the line below
# lightning.noise_level = 2
print("Noise level is set at: " + str(lightning.noise_level))

# Watchdog threshold setting can be from 1-10, one being the lowest.
# The default setting is two.
# If you need to change the setting, uncomment the line below
# lightning.watchdog_threshold = 2
print("Watchdog Threshold is set to: " + str(lightning.watchdog_threshold))

# Spike Rejection setting from 1-11, one being the lowest.
# The default setting is two. The shape of the spike is analyzed
# during the chip's validation routine. You can round this spike
# at the cost of sensitivity to distant events.
# If you need to change the setting, uncomment the line below.
# lightning.spike_rejection = 2
print("Spike Rejection is set to: " + str(lightning.spike_rejection))


# This setting will change when the lightning detector issues an interrupt.
# For example you will only get an interrupt after five lightning strikes
# instead of one. The default is one, and it takes settings of 1, 5, 9 and 16.
# If you want to change this value, uncomment the line below.
# lightning.lightning_threshold = 1
print(
    "The number of strikes before interrupt is triggered: "
    + str(lightning.lightning_threshold)
)

# When the distance to the storm is estimated, it takes into account other
# lightning that was sensed in the past 15 minutes.
# If you want to reset the time, you can uncomment the line below.
# lightning.clear_statistics()

# You can power down your lightning detector. You absolutely must call
# the wakup funciton afterwards, because it recalibrates the internal
# oscillators.
# Uncomment the statements below to test power down and wake up functions

# lightning.power_down()
# print('AS3935 powered down.')
# calibrated = lightning.wake_up()
#
# if calibrated:
#    print('Successfully woken up!')
# else:
#    print('Error recalibrating internal osciallator on wake up.')


print("Type Ctrl-C to exit program.")

try:
    while True:
        # When the interrupt goes high
        if as3935_interrupt_pin.value:
            print("Interrupt:", end=" ")
            interrupt_value = lightning.read_interrupt_register()

            if interrupt_value == lightning.NOISE:
                print("Noise.")
            elif interrupt_value == lightning.DISTURBER:
                print("Disturber.")
            elif interrupt_value == lightning.LIGHTNING:
                print("Lightning strike detected!")
                # Distance estimation takes into account previous events.
                print("Approximately: " + str(lightning.distance_to_storm) + "km away!")
                # Energy is a pure number with no physical meaning.
                print("Energy: " + str(lightning.lightning_energy))
        sleep(1)

except KeyboardInterrupt:
    pass
