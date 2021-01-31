# DIGIO8 Example code

import time
import board
import busio
import digitalio

from adafruit_mcp230xx.mcp23008 import MCP23008

# Initialize the I2C bus:
i2c = busio.I2C(board.SCL, board.SDA)

mcp = MCP23008(i2c)  # MCP23008

pin0 = mcp.get_pin(0)
pin1 = mcp.get_pin(1)
pin2 = mcp.get_pin(2)
pin3 = mcp.get_pin(3)
pin4 = mcp.get_pin(4)
pin5 = mcp.get_pin(5)
pin6 = mcp.get_pin(6)
pin7 = mcp.get_pin(7)

# Setup pin0 as an output that's at a high logic level.
pin0.switch_to_output(value=True)
pin1.switch_to_output(value=True)
pin2.switch_to_output(value=True)
pin3.switch_to_output(value=True)

# Setup pin1 as an input with a pull-up resistor enabled.  Notice you can also
# use properties to change this state.
pin4.direction = digitalio.Direction.INPUT
pin5.direction = digitalio.Direction.INPUT
pin6.direction = digitalio.Direction.INPUT
pin7.direction = digitalio.Direction.INPUT

print('DIGIO8 Test code')
# Now loop blinking the pin 0 output and reading the state of pin 1 input.
while True:
    # Blink pin 0 on and then off.
    pin0.value = True
    time.sleep(0.5)
    pin0.value = False
    pin1.value = True
    time.sleep(0.5)
    pin1.value = False
    pin2.value = True
    time.sleep(0.5)
    pin2.value = False
    pin3.value = True
    time.sleep(0.5)
    pin3.value = False
