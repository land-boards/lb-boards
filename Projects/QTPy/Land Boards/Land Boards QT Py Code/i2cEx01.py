# https://docs.circuitpython.org/en/latest/shared-bindings/busio/index.html
# https://developer.sony.com/develop/spresense/docs/circuitpython_tutorials_en.html

import busio
import board
import time

# Decode the temperature
def temp_c(data):
	value = data[0] << 8 | data[1]
	temp = (value & 0xFFF) / 16.0
	if value & 0x1000:
		temp -= 256.0
	return temp

i2c = busio.I2C(board.SCL, board.SDA)

# Lock the I2C device before we try to read temperature
while not i2c.try_lock():
	pass

try:
	while True:
		result = bytearray(2)
		# write bytes of data from the board to the MCP9808 and
		# receive two bytes of temperature sensor register data
		i2c.writeto_then_readfrom(0x18, bytes([0x05]), result)
		# print decoded temperature
		print("Temperature:", temp_c(result))
		time.sleep(1.0)

finally:  # unlock the i2c bus when ctrl-c'ing out of the loop
	i2c.unlock()