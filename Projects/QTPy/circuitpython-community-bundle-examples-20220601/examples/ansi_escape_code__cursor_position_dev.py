#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# SPDX-FileCopyrightText: Copyright (c) 2022 Stefan Krüger for s-light
#
# SPDX-License-Identifier: Unlicense

"""Test Cursor Movement."""

import time
import sys
import board
import usb_cdc
import digitalio
import ansi_escape_code as terminal

##########################################
# globals
led = digitalio.DigitalInOut(board.LED)
led.direction = digitalio.Direction.OUTPUT


##########################################
# functions
def read_serial():
    serial = usb_cdc.console
    available = serial.in_waiting
    buffer = ""
    while available:
        raw = serial.read(available)
        text = raw.decode("utf-8")
        buffer += text
        available = serial.in_waiting
    return buffer


def read_serial_until(read_end="R", timeout=0.1):
    serial = usb_cdc.console
    end_time = time.monotonic() + timeout
    buffer = ""
    while end_time >= time.monotonic() and not buffer.endswith(read_end):
        raw = serial.read(serial.in_waiting)
        buffer += raw.decode("utf-8")
    return buffer


def check_input():
    serial = usb_cdc.console
    # enable nonblocking read
    serial.timeout = 0

    buffer = read_serial()
    print("buffer:", repr(buffer))

    # get cursor
    print(
        "terminal.ANSIControl.device_status_report",
        repr(terminal.ANSIControl.device_status_report),
    )
    serial.write(bytearray(terminal.ANSIControl.device_status_report))

    print("wait & read answer")
    # serial.timeout = 0.1
    # raw = serial.read(7)
    # buffer = raw.decode("utf-8")
    buffer = read_serial_until(read_end="R", timeout=0.1)

    # ESC[n;mR
    # available = serial.in_waiting
    # while available < 1:
    #     print("wait 0.1s")
    #     time.sleep(0.1)
    #
    # buffer = read_serial()
    print("answer:", repr(buffer))

    row, col = terminal.ANSIControl.device_status_report_parse(buffer)
    print("row: {}; col: {}".format(row, col))

    print("wait 2s")
    time.sleep(2)


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
    print("board: " + board.board_id)
    print(42 * "*")
    print("run")

    running = True
    while running:
        try:
            serial = usb_cdc.console
            if serial.connected:
                check_input()
        except KeyboardInterrupt as e:
            print("KeyboardInterrupt - Stop Program.", e)
            running = False
        else:
            pass


##########################################
if __name__ == "__main__":
    main()

##########################################
