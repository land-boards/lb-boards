import board
import busio
import time
import odt_at42qt1070
import neopixel

num_pixels = 1

RED = (255,0,0)
GREEN = (0,255,0)
BLUE = (0,0,255)

pixels = neopixel.NeoPixel(board.NEOPIXEL, num_pixels, brightness=0.3, auto_write=False)

i2c = busio.I2C(board.SCL, board.SDA)

qtouch = odt_at42qt1070.AT42QT1070(i2c)

while True:
  if qtouch.touched():
    pixels.fill(GREEN)
    pixels.show()
    time.sleep(1)
  else:
    pixels.fill(RED)
    pixels.show()
    time.sleep(1)
    
