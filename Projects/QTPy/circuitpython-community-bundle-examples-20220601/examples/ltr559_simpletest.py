# SPDX-FileCopyrightText: 2020 David Glaude
#
# SPDX-License-Identifier: Unlicense
"""Simple example of the LTR559 library."""
import time
import board

from pimoroni_circuitpython_ltr559 import Pimoroni_LTR559

i2c = board.I2C()
ltr559 = Pimoroni_LTR559(i2c)

# Main loop reading lux and proximity and printing it every second.
while True:
    lux = ltr559.lux  # Get Lux value from light sensor
    prox = ltr559.prox  # Get Proximity value from proximity sensor

    print("Proximity: {0} Lux: {1}".format(prox, lux))
    # Delay for a second and repeat.
    time.sleep(1.0)
