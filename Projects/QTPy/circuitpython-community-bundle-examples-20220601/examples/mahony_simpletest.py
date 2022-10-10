##
## This test file has calibration values for my device
## Anyone else will have to calibrate and set their own values
##
## Only calibrates for the gryo and hardiron offsets
## Set to run on the Adafruit LSM9DS1 over I2C cause that is what I have
##

import time
import board
import busio
import adafruit_lsm9ds1
import mahony

MAG_MIN = [-0.5764, 0.0097, -0.5362]
MAG_MAX = [0.4725, 0.9919, 0.4743]

## Used to calibrate the magenetic sensor
def map_range(x, in_min, in_max, out_min, out_max):
    """
    Maps a number from one range to another.
    :return: Returns value mapped to new range
    :rtype: float
    """
    mapped = (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min
    if out_min <= out_max:
        return max(min(mapped, out_max), out_min)

    return min(max(mapped, out_max), out_min)


## create the ahrs_filter
ahrs_filter = mahony.Mahony(50, 5, 100)

# create the sensor
i2c = busio.I2C(board.A3, board.A2)
sensor = adafruit_lsm9ds1.LSM9DS1_I2C(i2c)

count = 0  # used to count how often we are feeding the ahrs_filter
lastPrint = time.monotonic()  # last time we printed the yaw/pitch/roll values
timestamp = time.monotonic_ns()  # used to tune the frequency to approx 100 Hz

while True:
    # on an Feather M4 approx time to wait between readings
    if (time.monotonic_ns() - timestamp) > 6500000:

        # read the magenetic sensor
        mx, my, mz = sensor.magnetic

        # adjust for magnetic calibration - hardiron only
        # calibration varies per device and physical location
        mx = map_range(mx, MAG_MIN[0], MAG_MAX[0], -1, 1)
        my = map_range(my, MAG_MIN[1], MAG_MAX[1], -1, 1)
        mz = map_range(mz, MAG_MIN[2], MAG_MAX[2], -1, 1)

        # read the gyroscope
        gx, gy, gz = sensor.gyro
        # adjust for my gyro calibration values
        # calibration varies per device and physical location
        gx -= 1.1250
        gy -= 3.8732
        gz += 1.2834

        # read the accelerometer
        ax, ay, az = sensor.acceleration

        # update the ahrs_filter with the values
        # gz and my are negative based on my installation
        ahrs_filter.update(gx, gy, -gz, ax, ay, az, mx, -my, mz)

        count += 1
        timestamp = time.monotonic_ns()

    # every 0.1 seconds print the ahrs_filter values
    if time.monotonic() > lastPrint + 0.1:
        # ahrs_filter values are in radians/sec multiply by 57.20578 to get degrees/sec
        yaw = ahrs_filter.yaw * 57.20578
        if yaw < 0:  # adjust yaw to be between 0 and 360
            yaw += 360
        print(
            "Orientation: ",
            yaw,
            ", ",
            ahrs_filter.pitch * 57.29578,
            ", ",
            ahrs_filter.roll * 57.29578,
        )
        print(
            "Quaternion: ",
            ahrs_filter.q0,
            ", ",
            ahrs_filter.q1,
            ", ",
            ahrs_filter.q2,
            ", ",
            ahrs_filter.q3,
        )

        # print("Count: ", count)    # optionally print out frequency
        count = 0  # reset count
        lastPrint = time.monotonic()
