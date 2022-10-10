#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# SPDX-FileCopyrightText: 2017 Scott Shawcroft, written for Adafruit Industries
# SPDX-FileCopyrightText: Copyright (c) 2021 Stefan Krüger for s-light
#
# SPDX-License-Identifier: Unlicense

"""Simple Minimal example of CircuitPython_nonblocking_serialinput library usage."""

import time
import board
import digitalio
import nonblocking_serialinput as nb_serialin

##########################################
# globals
led = digitalio.DigitalInOut(board.LED)
led.direction = digitalio.Direction.OUTPUT

##########################################
# menu

my_input = nb_serialin.NonBlockingSerialInput(statusline=True, statusline_intervall=0.2)

##########################################
# main


def main():
    """Main."""
    # wait for serial terminal to get ready..
    time.sleep(1)
    my_input.print("")
    my_input.print("nonblocking_serialinput_simpletest.py")
    my_input.print(42 * "*")

    runtime_print_next = time.monotonic()
    runtime_print_intervall = 1
    running = True
    while running:
        # input handling
        my_input.update()
        input_string = my_input.input()
        if input_string is not None:
            # print("input_string: {}".format(repr(input_string)))
            # we have at least a empty string.
            if "exit" in input_string:
                my_input.print("Stop Program running.")
                running = False
            elif "hello" in input_string:
                my_input.print("World :-)")
            else:
                my_input.print("type 'exit' to stop the program.")
        # live sign
        if runtime_print_next < time.monotonic():
            runtime_print_next = time.monotonic() + runtime_print_intervall
            my_input.print(":-)")
            my_input.print("{: > 7.2f}s".format(time.monotonic()))
            led.value = not led.value


##########################################
if __name__ == "__main__":
    main()

##########################################
