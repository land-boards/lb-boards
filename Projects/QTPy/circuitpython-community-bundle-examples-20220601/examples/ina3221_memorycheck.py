"""Memory test for barbudor_ina3221"""
# Copy below sequence into
# pylint: disable=unnecessary-semicolon,multiple-statements,wrong-import-position,no-member

import gc
import sys
import board

i2c_bus = board.I2C()

gc.collect(); gc.collect(); gc.collect(); before = gc.mem_free();

# on small platform, save memory using the 'lite' version
if 'SAMD21' in sys.platform:
    from barbudor_ina3221.lite import INA3221
else:
    from barbudor_ina3221.full import INA3221

gc.collect(); gc.collect(); gc.collect(); after = gc.mem_free();

ina3221 = INA3221(i2c_bus)

gc.collect(); gc.collect(); gc.collect(); instance = gc.mem_free();

print("Import used    : %d bytes" % (before - after))
print("Instance used  : %d bytes" % (after - instance))
