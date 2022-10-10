import time
import board
import busio
import electronutlabs_lis2dh12

i2c = busio.I2C(board.SCL, board.SDA)
lis2dh12 = electronutlabs_lis2dh12.LIS2DH12_I2C(i2c, address=0x19)

lis2dh12.range = electronutlabs_lis2dh12.RANGE_2_G

while True:
    # Read accelerometer values (in m / s ^ 2).  Returns a 3-tuple of x, y,
    # z axis values.  Divide them by 9.806 to convert to Gs.
    x, y, z = [
        value / electronutlabs_lis2dh12.STANDARD_GRAVITY for value in lis2dh12.acceleration]
    print("x = %0.3f G, y = %0.3f G, z = %0.3f G" % (x, y, z))
    # Small delay to keep things responsive but give time for interrupt processing.
    time.sleep(0.5)
