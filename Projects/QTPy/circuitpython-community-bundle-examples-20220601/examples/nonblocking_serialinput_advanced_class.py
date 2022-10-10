#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# SPDX-FileCopyrightText: Copyright (c) 2021 Stefan Krüger for s-light
#
# SPDX-License-Identifier: Unlicense

"""Simple Minimal example of CircuitPython_nonblocking_serialinput library usage."""

import time
import sys
import board
import digitalio
import nonblocking_serialinput as nb_serialin

##########################################
# globals


class MyProjectMainClass:
    """This is just the Container Class for my Project."""

    def __init__(self):
        super()
        self.my_input = nb_serialin.NonBlockingSerialInput(
            input_handling_fn=self.userinput_event_handling,
            print_help_fn=self.userinput_print_help,
        )
        self.running = False

        self.led = digitalio.DigitalInOut(board.LED)
        self.led.direction = digitalio.Direction.OUTPUT

        self.runtime_print = True
        self.runtime_print_next = time.monotonic()
        self.runtime_print_intervall = 1.0

    ##########################################
    # menu

    def userinput_print_help(self):
        """Print Help."""
        text = (
            "you can change some things:\n"
            "- 'tr': toggle print runtime ({runtime_print})\n"
            "- 'time set:???': set print runtime intervall ({runtime_print_intervall: > 7.2f}s)\n"
            "- 'exit'  stop program"
            "".format(
                runtime_print=self.runtime_print,
                runtime_print_intervall=self.runtime_print_intervall,
            )
        )
        self.my_input.print(text)

    def userinput_event_handling(self, input_string):
        """Handle user input."""
        if "tr" in input_string:
            self.runtime_print = not self.runtime_print
        if "time set" in input_string:
            self.my_input.print("time set:")
            value = nb_serialin.parse_value(input_string, "time set")
            if nb_serialin.is_number(value):
                self.runtime_print_intervall = value
                self.runtime_print_next = (
                    time.monotonic() + self.runtime_print_intervall
                )
        if "exit" in input_string:
            self.my_input.print("Stop Program running.")
            self.running = False

    ##########################################
    # main things

    def runtime_update(self):
        """If enabled: print runtime & toggle LED."""
        if self.runtime_print:
            if self.runtime_print_next < time.monotonic():
                self.runtime_print_next = (
                    time.monotonic() + self.runtime_print_intervall
                )
                self.my_input.print("{: > 7.2f}s".format(time.monotonic()))
                self.led.value = not self.led.value

    def update(self):
        """Update."""
        self.my_input.update()
        self.runtime_update()

    def run(self):
        """Run."""
        self.running = True
        while self.running:
            try:
                self.update()
            except KeyboardInterrupt as e:
                self.my_input.print("KeyboardInterrupt - Stop Program.", e)
                self.running = False


##########################################
# main


def main():
    """Main."""
    # wait some time untill the computer / terminal is ready
    for _i in range(10):
        print(".", end="")
        time.sleep(0.5 / 10)
    print("")
    print(42 * "*")
    print("nonblocking_serialinput_advanced_class.py")
    print("Python Version: " + sys.version)
    print("board: " + board.board_id)
    print(42 * "*")

    myproject = MyProjectMainClass()
    myproject.my_input.print("run")
    myproject.run()


##########################################
if __name__ == "__main__":
    main()

##########################################
