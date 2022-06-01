# Basic example of clearing and drawing pixels on a SSD1306 OLED display.
# This example and library is meant to work with Adafruit CircuitPython API.
# Author: Tony DiCola
# License: Public Domain

import time
# Import all board pins.
import board
import digitalio
import busio

# Import the SH1106 module.
import adafruit_sh1106

# Setup the SPI pins
dc = digitalio.DigitalInOut(board.A22)
reset = digitalio.DigitalInOut(board.A23)
cs = digitalio.DigitalInOut(board.A27)

# Create the SPI interface.
spi_bus = busio.SPI(board.SCK, board.MOSI)

# Create the SSD1306 OLED class.
# The first two parameters are the pixel width and pixel height.  Change these
# to the right size for your display!
display = adafruit_sh1106.SH1106_SPI(128, 64, spi_bus, dc, reset, cs, external_vcc=True,
                                    baudrate=24000000)

# Clear the display.  Always call show after changing pixels to make the display
# update visible!
display.fill(0)
display.show()

# Set a pixel in the origin 1,1 position as 0,0 is off the edge of the display and not visible.
display.pixel(1, 1, 1)
# Set a pixel in the middle 64,32 position.
display.pixel(64, 32, 1)
# Set a pixel in the opposite 125,63 position 127,63 is off the edge of the display and not visible.
display.pixel(125, 63, 1)
display.show()

while True:
    time.sleep(1)
