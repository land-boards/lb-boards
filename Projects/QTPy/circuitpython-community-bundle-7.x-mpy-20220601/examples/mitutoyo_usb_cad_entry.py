# Direct CAD entry for Mitutoyo calipers via USB HID emulation.
# Assuming a Serpente board, with `req`, `clock`, `data` and `ready` connected to
# D0, D1, D2 and D3, respectively.

import time
import board
import digitalio
import mitutoyo

import usb_hid
from adafruit_hid.keyboard import Keyboard
from adafruit_hid.keyboard_layout_us import KeyboardLayoutUS

# I/O
pin_ready = digitalio.DigitalInOut(board.D3)
pin_ready.direction = digitalio.Direction.INPUT
pin_ready.pull = digitalio.Pull.UP

meter = mitutoyo.Digimatic(req=board.D0, clock=board.D1, data=board.D2)

# USB HID keyboard emulation.
time.sleep(1)
kbd = Keyboard(usb_hid.devices)
layout = KeyboardLayoutUS(kbd)

print("Ready.")

while True:
    # wait until ready goes low
    while pin_ready.value:
        time.sleep(0.1)

    reading = meter.read()
    if reading:
        print("Typing %s." % reading)
        layout.write(str(reading) + "\n")

    # wait until ready goes up again to just get a single reading per press
    while not pin_ready.value:
        time.sleep(0.1)
