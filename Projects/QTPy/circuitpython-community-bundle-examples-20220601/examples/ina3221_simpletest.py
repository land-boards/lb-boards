"""Sample code and test for barbudor_ina3221"""

import time
import sys
import board

# on small platform, save memory using the 'lite' version
# pylint: disable=unused-wildcard-import,wildcard-import
if 'SAMD21' in sys.platform:
    from barbudor_ina3221.lite import INA3221
else:
    from barbudor_ina3221.full import *
# pylint: enable=unused-wildcard-import,wildcard-import

i2c_bus = board.I2C()
ina3221 = INA3221(i2c_bus)

# change configuration (requires 'full' version of the lib)
if INA3221.IS_FULL_API:
    print("full API sample: improve accuracy")
    # improve accuracy by slower conversion and higher averaging
    # each conversion now takes 128*0.008 = 1.024 sec
    # which means 2 seconds per channel
    ina3221.update(reg=C_REG_CONFIG,
                   mask=C_AVERAGING_MASK |
                   C_VBUS_CONV_TIME_MASK |
                   C_SHUNT_CONV_TIME_MASK |
                   C_MODE_MASK,
                   value=C_AVERAGING_128_SAMPLES |
                   C_VBUS_CONV_TIME_8MS |
                   C_SHUNT_CONV_TIME_8MS |
                   C_MODE_SHUNT_AND_BUS_CONTINOUS)

# enable all 3 channels. You can comment (#) a line to disable one
ina3221.enable_channel(1)
ina3221.enable_channel(2)
ina3221.enable_channel(3)

# pylint: disable=bad-whitespace

while True:
    if INA3221.IS_FULL_API: # is_ready available only in "full" variant
        while not ina3221.is_ready:
            print(".",end='')
            time.sleep(0.1)
        print("")

    print("------------------------------")
    line_title =         "Measurement   "
    line_psu_voltage =   "PSU voltage   "
    line_load_voltage =  "Load voltage  "
    line_shunt_voltage = "Shunt voltage "
    line_current =       "Current       "

    for chan in range(1,4):
        if ina3221.is_channel_enabled(chan):
            #
            bus_voltage = ina3221.bus_voltage(chan)
            shunt_voltage = ina3221.shunt_voltage(chan)
            current = ina3221.current(chan)
            #
            line_title +=         "| Chan#{:d}      ".format(chan)
            line_psu_voltage +=   "| {:6.3f}    V ".format(bus_voltage + shunt_voltage)
            line_load_voltage +=  "| {:6.3f}    V ".format(bus_voltage)
            line_shunt_voltage += "| {:9.6f} V ".format(shunt_voltage)
            line_current +=       "| {:9.6f} A ".format(current)

    print(line_title)
    print(line_psu_voltage)
    print(line_load_voltage)
    print(line_shunt_voltage)
    print(line_current)

    time.sleep(2.0)
