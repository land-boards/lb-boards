# This is a quick example how to read values from Mitutoyo Calipers.
# Assuming a Serpente board, with `req`, `clock`, `data` and `ready` connected to
# D0, D1, D2 and D3, respectively.

import time
import board
import digitalio
import mitutoyo

pin_ready = digitalio.DigitalInOut(board.D3)
pin_ready.direction = digitalio.Direction.INPUT
pin_ready.pull = digitalio.Pull.UP

print("Hello! Press the read button on the Calipers to print the value!")

meter = mitutoyo.Digimatic(req=board.D0, clock=board.D1, data=board.D2)

while True:
    # wait until ready goes low
    while pin_ready.value:
        time.sleep(0.1)

    reading = meter.read()
    if reading:
        print(reading)

    # wait until ready goes up again to just get a single reading per press
    while not pin_ready.value:
        time.sleep(0.1)
