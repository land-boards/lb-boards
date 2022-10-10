# SPDX-FileCopyrightText: Copyright (c) 2021 Jose David M.
#
# SPDX-License-Identifier: Unlicense

"""
Simple test to use the internal led to turn it on and off using morse code
"""
import time
import board
from morsecode import Emitter

# Using Internal led
internal_led = Emitter(board.D13)

MESSAGE = "Hugo AKA the Architect"

while True:
    print(f"Sending {MESSAGE} to the internal led in 3 seconds")
    time.sleep(3)
    print("starting")
    internal_led.outmorse(MESSAGE)
    print("Message Ended")
