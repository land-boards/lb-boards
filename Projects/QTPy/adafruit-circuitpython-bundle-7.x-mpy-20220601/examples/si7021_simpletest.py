# SPDX-FileCopyrightText: 2021 ladyada for Adafruit Industries
# SPDX-License-Identifier: MIT

"""
Initializes the sensor, gets and prints readings every two seconds.
"""
import time
import board
import adafruit_si7021

# Create library object using our Bus I2C port
sensor = adafruit_si7021.SI7021(board.I2C())

# If you'd like to use the heater, you can uncomment the code below
# and pick a heater level that works for your purposes
#
# sensor.heater_enable = True
# sensor.heater_level = 0  # Use any level from 0 to 15 inclusive

while True:
    print("\nTemperature: %0.1f C" % sensor.temperature)
    print("Humidity: %0.1f %%" % sensor.relative_humidity)
    time.sleep(2)
