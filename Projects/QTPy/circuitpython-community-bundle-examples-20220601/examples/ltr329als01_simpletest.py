import time
import board
import busio
import electronutlabs_ltr329als01

i2c = busio.I2C(board.SCL, board.SDA)
ltr = electronutlabs_ltr329als01.LTR329ALS01(i2c)

ltr.gain = electronutlabs_ltr329als01.CONST_GAIN_4X

while True:
    print("%.2f Lux" % (ltr.get_lux()))
    time.sleep(1)
