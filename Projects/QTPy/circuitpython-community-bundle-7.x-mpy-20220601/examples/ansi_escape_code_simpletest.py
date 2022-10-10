#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# SPDX-FileCopyrightText: Copyright (c) 2022 Stefan Krüger for s-light
#
# SPDX-License-Identifier: Unlicense

import sys
import time
import ansi_escape_code as terminal


##########################################
# main


def test_colors():
    """Test colors."""
    test_string = (
        terminal.ANSIColors.fg.lightblue
        + "Hello "
        + terminal.ANSIColors.fg.green
        + "World "
        + terminal.ANSIColors.fg.orange
        + ":-)"
        + terminal.ANSIColors.reset
    )
    print("test_string", test_string)


def test_control():
    """Test control."""
    test_string = (
        terminal.ANSIControl.cursor.previous_line(2)
        + "WOOO"
        + terminal.ANSIControl.cursor.next_line(1)
        + terminal.ANSIControl.erase_line()
        + ":-)"
    )
    print(test_string)


##########################################
# main


def main():
    """Main."""
    # wait some time untill the computer / terminal is ready
    for _i in range(10):
        # print(".", end="")
        print(".")
        time.sleep(0.5 / 10)
    print("")
    print(42 * "*")
    print("ansi_escape_code__cursor_position_test.py")
    print("Python Version: " + sys.version)
    print(42 * "*")
    print("run")

    test_colors()
    test_colors()
    test_colors()
    time.sleep(1)


##########################################
if __name__ == "__main__":
    main()

##########################################
