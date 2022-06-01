# SPDX-FileCopyrightText: 2021 Jose David M.
# SPDX-License-Identifier: MIT

"""
Show the MCP9808 to setup different temperature values
"""

import time
import board
import adafruit_mcp9808

i2c = board.I2C()  # uses board.SCL and board.SDA
mcp = adafruit_mcp9808.MCP9808(i2c)

# Change the values according to the desired values
print("Setting Temperature Limits")
mcp.upper_temperature = 23
mcp.lower_temperature = 10
mcp.critical_temperature = 100

# To verify the limits we need to read the temperature value
print(mcp.temperature)
time.sleep(0.3)  # This is the time temperature conversion at maximum resolution

# Showing temperature Limits
while True:
    if mcp.below_lt:
        print("too cold!")
    if mcp.above_ut:
        print("getting hot!")
    if mcp.above_ct:
        print("Above critical temp!")
