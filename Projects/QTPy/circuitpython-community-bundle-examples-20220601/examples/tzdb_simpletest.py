#!/usr/bin/env python3
# SPDX-FileCopyrightText: Copyright (c) 2022 Evin Dunn
# SPDX-License-Identifier: MIT

from time import time

from adafruit_datetime import datetime

try:
    from tzdb import timezone
except ImportError:
    from sys import path as sys_path
    from pathlib import Path

    sys_path.insert(0, str(Path(__file__).parent.parent))
    from tzdb import timezone


def main():
    TARGETS = [
        "America/Chicago",
        "America/Argentina/Buenos_Aires",
        "Pacific/Guam",
        "Asia/Tokyo",
    ]

    # First use adafruit_ntp to fetch the current utc time & update the board's
    # RTC

    utc_now = time()
    utc_now_dt = datetime.fromtimestamp(utc_now)

    print("UTC: {}".format(utc_now_dt.ctime()))

    for target in TARGETS:
        localtime = utc_now_dt + timezone(target).utcoffset(utc_now_dt)
        print("{}: {}".format(target, localtime.ctime()))


if __name__ == "__main__":
    main()
