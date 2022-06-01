# SPDX-FileCopyrightText: 2021 Dylan Herrada for Adafruit Industries
# SPDX-License-Identifier: MIT

import time
import ssl
import board
from digitalio import DigitalInOut, Direction, Pull
import touchio
import socketpool
import wifi
import adafruit_minimqtt.adafruit_minimqtt as MQTT
from adafruit_io.adafruit_io import IO_MQTT
from adafruit_dash_display import Hub

up = DigitalInOut(board.BUTTON_UP)
up.direction = Direction.INPUT
up.pull = Pull.DOWN

select = DigitalInOut(board.BUTTON_SELECT)
select.direction = Direction.INPUT
select.pull = Pull.DOWN

down = DigitalInOut(board.BUTTON_DOWN)
down.direction = Direction.INPUT
down.pull = Pull.DOWN

back = touchio.TouchIn(board.CAP7)
submit = touchio.TouchIn(board.CAP8)

try:
    from secrets import secrets
except ImportError:
    print("WiFi secrets are kept in secrets.py, please add them there!")
    raise

display = board.DISPLAY

# Set your Adafruit IO Username and Key in secrets.py
# (visit io.adafruit.com if you need to create an account,
# or if you need your Adafruit IO key.)
aio_username = secrets["aio_username"]
aio_key = secrets["aio_key"]

print("Connecting to %s" % secrets["ssid"])
wifi.radio.connect(secrets["ssid"], secrets["password"])
print("Connected to %s!" % secrets["ssid"])

# Create a socket pool
pool = socketpool.SocketPool(wifi.radio)

# Initialize a new MQTT Client object
mqtt_client = MQTT.MQTT(
    broker="io.adafruit.com",
    username=secrets["aio_username"],
    password=secrets["aio_key"],
    socket_pool=pool,
    ssl_context=ssl.create_default_context(),
)

# Initialize an Adafruit IO MQTT Client
io = IO_MQTT(mqtt_client)


def pub_lamp(lamp):
    if isinstance(lamp, str):
        lamp = eval(lamp)  # pylint: disable=eval-used
    iot.publish("lamp", str(not lamp))
    # funhouse.set_text(f"Lamp: {not lamp}", 0)
    time.sleep(0.3)


iot = Hub(display=display, io=io, nav=(up, select, down, back, submit))

iot.add_device(
    feed_key="lamp",
    default_text="Lamp: ",
    formatted_text="Lamp: {}",
    pub_method=pub_lamp,
)
iot.add_device(
    feed_key="temperature",
    default_text="Temperature: ",
    formatted_text="Temperature: {:.1f} C",
)
iot.add_device(
    feed_key="humidity", default_text="Humidity: ", formatted_text="Humidity: {:.2f}%"
)

iot.get()

while True:
    iot.loop()
    time.sleep(0.01)
