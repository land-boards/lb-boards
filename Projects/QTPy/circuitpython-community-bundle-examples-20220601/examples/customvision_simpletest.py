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
# you will need your API key, endpoint, project id and published iteration name
# Add these to your secrets.py file as api_key, endpoint, project_id, published_name

from azurecustomvision_prediction import CustomVisionPredictionClient

# Create the prediction client
client = CustomVisionPredictionClient(secrets["api_key"], secrets["endpoint"])

# Do an image classification
# Update the URL to point to your image URL
image_prediction = client.classify_image_url(secrets["project_id"], secrets["published_name"], "<url of image>")

for prediction in image_prediction.predictions:
    print("Prediction", prediction.tag_name, "with probability", str(int(prediction.probability * 100)), "%")
