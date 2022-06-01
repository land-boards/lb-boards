"""
'tmp75_adafruitio.py'
==================================
Testing TMP75 library on RaspberryPi using blinka and AdafruitIO

Author(s): Barbudor, Based on Brent Rubel "temp_humidity.py"

Dependencies:
    - Adafruit Blink (CircuitPython on Raspberry PI)
        (https://github.com/adafruit/Adafruit_Blinka)
    - Adafruit IO Python Client
        (https://github.com/adafruit/io-client-python)
    - Adafruit_Python_DHT
        (https://github.com/adafruit/Adafruit_Python_DHT)
"""

# import standard python modules.
import time

# import barbudor TMP75 library
import board
import barbudor_tmp75

# import Adafruit IO REST client.
from Adafruit_IO import Client, Feed, errors

# Set to your Adafruit IO username.
# Set to your Adafruit IO key.
# Remember, your key is a secret,
#ADAFRUIT_IO_USERNAME = 'YOUR_AIO_USERNAME'
#ADAFRUIT_IO_KEY = 'YOUR_AIO_KEY'
# keep your username and secret key in a shared module
from aoi_key import ADAFRUIT_IO_USERNAME, ADAFRUIT_IO_KEY

# Delay in-between sensor readings, in seconds.
READ_TIMEOUT = 5

# Name of the Adafruit IO feed
FEED_NAME = "tmp75"

# Create an instance of the REST client.
aio = Client(ADAFRUIT_IO_USERNAME, ADAFRUIT_IO_KEY)

# Set up Adafruit IO Feeds.
try:
    tmp75_feed = aio.feeds(FEED_NAME)
except errors.RequestError:
    feed = Feed(name=FEED_NAME)
    tmp75_feed = aio.create_feed(feed)
    print("Created feed %s" % FEED_NAME)

# Set up TMP75 Sensor
tmp75_sensor = barbudor_tmp75.TMP75(board.I2C())
tmp75_error = False

while True:
    try:
        if tmp75_error: # if an error occured, re-write config register with 12 bits mode
            # pylint: disable=protected-access
            tmp75_sensor.config = barbudor_tmp75._CONFIG_CONVERTER_12BITS
            # pylint: enable=protected-access
        temp = '%.2f'%(tmp75_sensor.temperature_in_C)
        print('Temp2=%sC'%(temp))
        aio.send(tmp75_feed.key, temp)
        tmp75_error = False
    except OSError:
        print('Failed to read TMP75, trying again in ', READ_TIMEOUT, 'seconds')
        tmp75_error = True

    # Timeout to avoid flooding Adafruit IO
    time.sleep(READ_TIMEOUT)
