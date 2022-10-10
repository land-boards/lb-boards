#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# SPDX-FileCopyrightText: Copyright (c) 2021 Stefan Krüger s-light
#
# SPDX-License-Identifier: Unlicense

"""Development things,"""

import time
import board
import digitalio
import ansi_escape_code as terminal
import nonblocking_serialinput as nb_serialin

##########################################
# globals
led = digitalio.DigitalInOut(board.LED)
led.direction = digitalio.Direction.OUTPUT

##########################################
# menu

my_input = nb_serialin.NonBlockingSerialInput()

##########################################
# main


def test_move():
    """Test Moving around..."""
    test_string_colors = (
        terminal.ANSIColors.fg.lightblue
        + "Hello "
        + terminal.ANSIColors.fg.green
        + "World "
        + terminal.ANSIColors.fg.orange
        + ":-)"
        + terminal.ANSIColors.reset
    )
    # print("test_string_colors", test_string_colors)
    # print("test_string_colors", test_string_colors)
    # print("test_string_colors", test_string_colors)
    # time.sleep(1)
    # test_string_move = (
    #     terminal.ANSIControl.cursor.previous_line(2)
    #     + terminal.ANSIColors.fg.red
    #     + "WOOO"
    #     + terminal.ANSIColors.reset
    #     + terminal.ANSIControl.cursor.next_line(1)
    #     + terminal.ANSIControl.erase_line()
    #     + ":-)"
    # )
    # print(test_string_move)
    # time.sleep(1)

    print("*" * 42)
    print("\n" * 5)
    print("1", "dub di dub")
    print("2", test_string_colors)
    print("3", "This is a beautifull day!")
    time.sleep(1)

    print(">> ")
    print("this is a status line - it should stay as last line.")
    time.sleep(5)

    move = ""
    # earese statusline
    move += terminal.ANSIControl.cursor.previous_line(1)
    move += terminal.ANSIControl.erase_line(0)
    # earese inputline
    move += terminal.ANSIControl.cursor.previous_line(1)
    move += terminal.ANSIControl.erase_line(0)
    print(move, end="")
    time.sleep(1)
    # output print values
    print("enjoy your life!")
    # time.sleep(2)
    # now we have to reprint the echo & statusline.
    print(">> ")
    print("this is a status line - it should stay as last line.")
    time.sleep(2)


def main():
    """Main."""
    # wait for serial terminal to get ready..
    time.sleep(1)
    print("")
    print("nonblocking_serialinput_statusline_dev.py")
    print("*" * 42)
    # test_move()
    print(">> ", end="")
    time.sleep(2)
    move = ""
    # move += terminal.ANSIControl.cursor.previous_line(0)
    move += terminal.ANSIControl.erase_line(0)
    print(move, end="")
    time.sleep(5)


##########################################
if __name__ == "__main__":
    main()

##########################################
