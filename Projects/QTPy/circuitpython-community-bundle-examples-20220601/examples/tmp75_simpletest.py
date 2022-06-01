"""Sample code and test for barbudor_tmp75"""

import time
import board
from barbudor_tmp75 import TMP75

i2c_bus = board.I2C()
tmp75 = TMP75(i2c_bus)

while True:
    print("Temperature is %.2fC and %.2fF" % (tmp75.temperature_in_C, tmp75.temperature_in_F))
    time.sleep(2.0)
