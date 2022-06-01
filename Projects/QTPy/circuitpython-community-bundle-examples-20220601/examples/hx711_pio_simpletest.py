# SPDX-FileCopyrightText: Copyright (c) 2022 Erik Hess
#
# SPDX-License-Identifier: MIT

import board
from hx711.hx711_pio import HX711_PIO

pin_data = board.D5
pin_clk = board.D6

hx = HX711_PIO(pin_data, pin_clk, tare=True)

while True:
    reading = hx.read(5)
    reading_raw = hx.read_raw()
    print(
        "[{: 8.2f} g] [{: 8} raw] offset: {}, scalar: {}".format(
            reading, reading_raw, hx.offset, hx.scalar
        )
    )
