# SPDX-FileCopyrightText: Copyright (c) 2021 Martin Stephens
#
# SPDX-License-Identifier: Unlicense

"""Loop and wait for an event.

Note that the sensor only responds to lightning and certain kinds of noise,
so unless it is stormy, there's not much to see here.
"""
import time
import board
import biffobear_as3935

# Edit the chip select and interrupt pins to match the connections to your board

interrupt_pin = board.D7  # Connected to the sensor interrupt pin

# For a SPI connection (recommended)
spi = board.SPI()  # Works for most Adafruit and Blinka boards
cs_pin = board.D5  # Connect to the sensor chip select pin
sensor = biffobear_as3935.AS3935(spi, cs_pin, interrupt_pin=interrupt_pin)

# For an I2C connection
# i2c = board.I2C()  # Works for most Adafruit and Blinka boards
# sensor = biffobear_as3935.AS3935_I2C(i2c, interrupt_pin=interrupt_pin)

while True:
    if sensor.interrupt_set:  # An event has occurred
        # The interrupt_status is cleared after a read, so assign it
        # to a variable in case you need the value later.
        event_type = sensor.interrupt_status
        if event_type == sensor.LIGHTNING:  # It's a lightning event
            print(f"Strike Energy = {sensor.energy}")
            print(f"Distance to storm front = {sensor.distance} km")
        elif event_type == sensor.DISTURBER:
            print("False alarm")
    else:
        print("No event detected")
    # Minimum time between strike events is 1 second so poll frequently!
    time.sleep(0.5)
