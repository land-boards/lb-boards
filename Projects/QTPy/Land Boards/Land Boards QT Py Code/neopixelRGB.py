"""
Blink example for QT Py using onboard NeoPixel.
Requires two libraries from the Adafruit CircuitPython Library Bundle.
Download the bundle rom circuitpython.org/libraries and copy the
following files to your CIRCUITPY/lib folder:
* neopixel.mpy
* adafruit_pypixelbuf.mpy
Once the libraries are copied, save this file as code.py
to your CIRCUITPY drive to run it.
"""
import time
import board
import neopixel

pixels = neopixel.NeoPixel(board.NEOPIXEL, 1)

count = 0

while True:
    pixels.fill((255, 0, 0))
    time.sleep(0.5)
    pixels.fill((0, 255, 0))
    time.sleep(0.5)
    pixels.fill((0, 0, 255))
    time.sleep(0.5)
    pixels.fill((0, 0, 0))
    time.sleep(0.5)
    print('hi', count)
    count += 1
