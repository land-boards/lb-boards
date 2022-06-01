# SPDX-FileCopyrightText: 2021 Patrick Van Oosterwijck @ Silicognition LLC
#
# SPDX-License-Identifier: MIT
#
# This demo was tested with the PoE-FeatherWing, which contains a 24AA02E48
# chip to provide a globally unique MAC address, but can also work without
# this chip for testing purposes by using a hard coded MAC.
#
# It also contains a `get_static_file` function that demonstrates how to
# use a generator to serve large static files without using up too much
# memory.  To avoid having to put extra files in the repo, it just serves
# `code.py` which isn't very large, but to properly test it, adjust the code
# to serve an image of several 100 kB to see how it works.
#
# There's also an endpoint that demonstrates that `requests` can be used to
# get data from another socket and serve it.
#

import board
import busio
import digitalio
import neopixel

import adafruit_requests as requests
from adafruit_wsgi.wsgi_app import WSGIApp
from adafruit_wiznet5k.adafruit_wiznet5k import WIZNET5K
import adafruit_wiznet5k.adafruit_wiznet5k_socket as socket
import adafruit_wiznet5k.adafruit_wiznet5k_wsgiserver as server


print("Wiznet5k Web Server Test")


def get_mac(i2c_obj):
    "Read MAC from 24AA02E48 chip and return it"
    mac_addr = bytearray(6)
    while not i2c_obj.try_lock():
        pass
    i2c_obj.writeto(0x50, bytearray((0xFA,)))
    i2c_obj.readfrom_into(0x50, mac_addr, start=0, end=6)
    i2c_obj.unlock()
    return mac_addr


def get_static_file(filename):
    "Static file generator"
    with open(filename, "rb") as f:
        b = None
        while b is None or len(b) == 2048:
            b = f.read(2048)
            yield b


# Status LED
led = neopixel.NeoPixel(board.NEOPIXEL, 1)
led.brightness = 0.3
led[0] = (255, 0, 0)

# Chip Select for PoE-FeatherWing and Adafruit Ethernet FeatherWing
cs = digitalio.DigitalInOut(board.D10)
# Chip Select for Particle Ethernet FeatherWing
# cs = digitalio.DigitalInOut(board.D5)

# Initialize SPI bus
spi_bus = busio.SPI(board.SCK, MOSI=board.MOSI, MISO=board.MISO)

try:
    # Initialize the I2C bus to read the MAC
    i2c = busio.I2C(board.SCL, board.SDA)
    # Read the MAC from the 24AA02E48 chip
    mac = get_mac(i2c)
except (RuntimeError, OSError):
    # Hard coded MAC if there is no 24AA02E48
    mac = b"\xFE\xED\xDE\xAD\xBE\xEF"

# Initialize Ethernet interface with DHCP
eth = WIZNET5K(spi_bus, cs, mac=mac)

# Initialize a requests object with a socket and ethernet interface
requests.set_socket(socket, eth)


# Here we create our application, registering the
# following functions to be called on specific HTTP GET requests routes

web_app = WSGIApp()


@web_app.route("/led/<r>/<g>/<b>")
def led_on(request, r, g, b):  # pylint: disable=unused-argument
    print("LED handler")
    led.fill((int(r), int(g), int(b)))
    return ("200 OK", [], ["LED set!"])


@web_app.route("/")
def root(request):  # pylint: disable=unused-argument
    print("Root WSGI handler")
    return ("200 OK", [], ["Root document"])


@web_app.route("/large")
def large(request):  # pylint: disable=unused-argument
    print("Large pattern handler")
    return ("200 OK", [], ["*-.-" * 2000])


@web_app.route("/code")
def code(request):  # pylint: disable=unused-argument
    print("Static file code.py handler")
    return ("200 OK", [], get_static_file("code.py"))


@web_app.route("/btc")
def btc(request):  # pylint: disable=unused-argument
    print("BTC handler")
    r = requests.get("http://api.coindesk.com/v1/bpi/currentprice/USD.json")
    result = r.text
    r.close()
    return ("200 OK", [], [result])


# Here we setup our server, passing in our web_app as the application
server.set_interface(eth)
wsgiServer = server.WSGIServer(80, application=web_app)

print("Open this IP in your browser: ", eth.pretty_ip(eth.ip_address))

# Start the server
wsgiServer.start()
led[0] = (0, 0, 255)

while True:
    # Our main loop where we have the server poll for incoming requests
    wsgiServer.update_poll()
    # Maintain DHCP lease
    eth.maintain_dhcp_lease()
    # Could do any other background tasks here, like reading sensors
