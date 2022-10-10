"""Memory test for barbudor_tmp75"""
# pylint: disable=unnecessary-semicolon,multiple-statements,wrong-import-position,no-member

import gc
import board

i2c_bus = board.I2C()

gc.collect(); gc.collect(); gc.collect(); before = gc.mem_free();

from barbudor_tmp75 import TMP75

gc.collect(); gc.collect(); gc.collect(); after = gc.mem_free();

tmp75 = TMP75(i2c_bus)

gc.collect(); gc.collect(); gc.collect(); instance = gc.mem_free();

print("Import used    : %d bytes" % (before - after))
print("Instance used  : %d bytes" % (after - instance))
