# pylint: disable=wrong-import-position
# CircuitPython / Blinka
import board

uart = board.UART()
uart.baudrate = 19200

# via USB cable
# import serial
# uart = serial.Serial("/dev/ttyUSB0", 19200)

from adafruit_rockblock import RockBlock

rb = RockBlock(uart)

print(rb.model)
