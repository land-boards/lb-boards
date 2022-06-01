# Copyright 2020 - 2021, Ricardo Quesada, http://retro.moe
# SPDX-License-Identifier: Apache-2.0

import time

import board
import busio
from digitalio import DigitalInOut

from bluepad32.bluepad32 import Bluepad32

# Connected gamepad
gamepad = None


# Callback that will be called once a gamepad is connected
def on_connect(gp):
    global gamepad  # pylint: disable=global-statement
    gamepad = gp

    print("on_connect: ", gp)
    # Change ligthbar to Green: Red, Green, Blue
    gp.set_lightbar_color((0x00, 0xFF, 0x00))


# Callback that will be called when a gamepad is disconnected
def on_disconnect(gp):
    global gamepad  # pylint: disable=global-statement
    gamepad = None
    print("on_disconnect: ", gp)


# If you are using a board with pre-defined ESP32 Pins:
esp32_cs = DigitalInOut(board.ESP_CS)
esp32_ready = DigitalInOut(board.ESP_BUSY)
esp32_reset = DigitalInOut(board.ESP_RESET)

# If you have an AirLift Shield:
# esp32_cs = DigitalInOut(board.D10)
# esp32_ready = DigitalInOut(board.D7)
# esp32_reset = DigitalInOut(board.D5)

# If you have an AirLift Featherwing or ItsyBitsy Airlift:
# esp32_cs = DigitalInOut(board.D13)
# esp32_ready = DigitalInOut(board.D11)
# esp32_reset = DigitalInOut(board.D12)

# If you have an externally connected ESP32:
# NOTE: You may need to change the pins to reflect your wiring
# esp32_cs = DigitalInOut(board.D10)
# esp32_ready = DigitalInOut(board.D9)
# esp32_reset = DigitalInOut(board.D6)

spi = busio.SPI(board.SCK, board.MOSI, board.MISO)
bp32 = Bluepad32(spi, esp32_cs, esp32_ready, esp32_reset, debug=0)
bp32.setup_callbacks(on_connect, on_disconnect)

# Should display "Bluepad32 for Airlift vXXX"
print("Firmware version:", bp32.firmware_version)

color = [0xFF, 0x00, 0x00]
players_led = 0x01

while True:
    # Fetches data from Bluepad32 firmware, triggers callbaks, and more.
    # Must be called once per frame.
    bp32.update()

    if gamepad is None:
        continue

    if gamepad.button_a:  # button A pressed ?
        # Shuffle colors. "random.shuffle" not preset in CircuitPython
        color = (color[2], color[0], color[1])
        gamepad.set_lightbar_color(color)

    if gamepad.button_b:  # Button B pressed ?
        gamepad.set_player_leds(players_led)
        players_led += 1
        players_led &= 0x0F

    if gamepad.button_x:  # Button X pressed ?
        force = 128  # 0-255
        duration = 10  # 0-255
        gamepad.set_rumble(force, duration)

    time.sleep(0.032)
