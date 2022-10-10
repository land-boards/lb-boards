# SPDX-FileCopyrightText: Copyright (c) 2022 Erik Hess
#
# SPDX-License-Identifier: MIT

import board
from digitalio import DigitalInOut
from hx711.hx711_gpio import HX711_GPIO

gpio_data = DigitalInOut(board.D5)
gpio_clk = DigitalInOut(board.D6)

hx = HX711_GPIO(gpio_data, gpio_clk, tare=True)

while True:
    reading = hx.read(5)
    reading_raw = hx.read_raw()
    print(
        "[{: 8.2f} g] [{: 8} raw] offset: {}, scalar: {}".format(
            reading, reading_raw, hx.offset, hx.scalar
        )
    )
