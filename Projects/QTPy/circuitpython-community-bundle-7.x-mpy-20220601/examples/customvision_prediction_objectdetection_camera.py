import time
import board
import busio
from digitalio import DigitalInOut
import neopixel
from adafruit_esp32spi import adafruit_esp32spi, adafruit_esp32spi_wifimanager

# Get wifi details and more from a secrets.py file
try:
    from secrets import secrets
except ImportError:
    print("WiFi secrets are kept in secrets.py, please add them there!")
    raise

# ESP32 Setup
try:
    esp32_cs = DigitalInOut(board.ESP_CS)
    esp32_ready = DigitalInOut(board.ESP_BUSY)
    esp32_reset = DigitalInOut(board.ESP_RESET)
except AttributeError:
    esp32_cs = DigitalInOut(board.D13)
    esp32_ready = DigitalInOut(board.D11)
    esp32_reset = DigitalInOut(board.D12)

spi = busio.SPI(board.SCK, board.MOSI, board.MISO)
esp = adafruit_esp32spi.ESP_SPIcontrol(spi, esp32_cs, esp32_ready, esp32_reset)

"""Use below for Most Boards"""
status_light = neopixel.NeoPixel(board.NEOPIXEL, 1, brightness=0.2)  # Uncomment for Most Boards
"""Uncomment below for ItsyBitsy M4"""
# status_light = dotstar.DotStar(board.APA102_SCK, board.APA102_MOSI, 1, brightness=0.2)
# Uncomment below for an externally defined RGB LED
# import adafruit_rgbled
# from adafruit_esp32spi import PWMOut
# RED_LED = PWMOut.PWMOut(esp, 26)
# GREEN_LED = PWMOut.PWMOut(esp, 27)
# BLUE_LED = PWMOut.PWMOut(esp, 25)
# status_light = adafruit_rgbled.RGBLED(RED_LED, BLUE_LED, GREEN_LED)
wifi = adafruit_esp32spi_wifimanager.ESPSPI_WiFiManager(esp, secrets, status_light)

print("Connecting to WiFi...")

wifi.connect()

print("Connected to WiFi!")

# To make predictions using Azure Custom Vision, you will need to create a Custom Vision project
# and train it using different images.
#
# You will need to have an Azure subscription to use Custom Vision, and you can use a free tier of
# this service.
#
# If you don't have an Azure subscription:
#
# If you are a student, head to https://aka.ms/FreeStudentAzure and sign up, validating with your
#  student email address. This will give you $100 of Azure credit and free tiers of a load of
#  service, renewable each year you are a student
#
# If you are not a student, head to https://aka.ms/FreeAz and sign up to get $200 of credit for 30
#  days, as well as free tiers of a load of services
#
# Once you have an Azure subscription, head to https://customvision.ai and create a project.
# You can train two types of models - an image classifier that will give a prediction if an image is an object,
# or an object detector that can find multiple objects in an image.
#
# To train an image classifier, follow these instructions: https://aka.ms/AA88qph
# To train an object detector, follow these instructions: https://aka.ms/AA88llc
#
# Once you have your model trained, publish an iteration of it
# you will need your Prediction key, endpoint, project id and published iteration name
# Add these to your secrets.py file as prediction_key, endpoint, project_id, published_name

from azurecustomvision_prediction import CustomVisionPredictionClient

client = CustomVisionPredictionClient(secrets["prediction_key"], secrets["endpoint"])

# Capture an image from a VC0706 camera:
import adafruit_vc0706

# Set up the camera
uart = busio.UART(board.TX, board.RX, baudrate=115200, timeout=0.25)
vc0706 = adafruit_vc0706.VC0706(uart)
vc0706.baudrate = 115200
vc0706.image_size = adafruit_vc0706.IMAGE_SIZE_320x240

# Count down to taking the picture
print("Taking a picture in 3 seconds...")
time.sleep(1)
print("Taking a picture in 2 seconds...")
time.sleep(1)
print("Taking a picture in 1 seconds...")
time.sleep(1)
print("SNAP!")

# Take a picture
vc0706.take_picture()

# Convert the picture to a byte array
frame_length = vc0706.frame_length
buffer = bytearray(frame_length)
wcount = 0
index = 0

copy_buffer = bytearray(32)

while frame_length > 0:
    # Compute how much data is left to read as the lesser of remaining bytes
    # or the copy buffer size (32 bytes at a time).  Buffer size MUST be
    # a multiple of 4 and under 100.  Stick with 32!
    to_read = min(frame_length, 32)

    if to_read < 32:
        copy_buffer = bytearray(to_read)

    # Read picture data into the copy buffer.
    if vc0706.read_picture_into(copy_buffer) == 0:
        raise RuntimeError("Failed to read picture frame data!")

    for b in copy_buffer:
        buffer[index] = b
        index = index + 1

    frame_length -= 32

# Detect objects
image_prediction = client.detect_image(secrets["project_id"], secrets["published_name"], buffer)

for prediction in image_prediction.predictions:
    print(
        "Prediction",
        prediction.tag_name,
        "with probability",
        str(int(prediction.probability * 100)),
        "%",
        "at",
        str(prediction.bounding_box),
    )
