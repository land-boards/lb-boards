# SPDX-FileCopyrightText: Copyright (c) 2021 Tim Cocks for Adafruit Industries
#
# SPDX-License-Identifier: Unlicense

import board
import adafruit_24lc32

i2c = board.I2C()
eeprom = adafruit_24lc32.EEPROM_I2C(i2c)

print("length: {}".format(len(eeprom)))

# eeprom[0] = 4
# print(eeprom[0])

# eeprom[0:4] = [9, 3, 8, 1]
# print(eeprom[0:4])
