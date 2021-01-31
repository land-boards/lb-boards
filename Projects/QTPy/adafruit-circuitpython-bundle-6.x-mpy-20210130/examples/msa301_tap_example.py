import time
import board
import busio
import adafruit_msa301

i2c = busio.I2C(board.SCL, board.SDA)

msa = adafruit_msa301.MSA301(i2c)

msa.enable_tap_detection()

while True:
    if msa.tapped:
        print("Single Tap!")
    time.sleep(0.01)
