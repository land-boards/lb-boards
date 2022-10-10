# SPDX-FileCopyrightText: 2017 Scott Shawcroft, written for Adafruit Industries
# SPDX-FileCopyrightText: Copyright (c) 2021 Nathan Byrd

# SPDX-License-Identifier: MIT

import time
import circuitpython_schedule as schedule


def greet():
    print("Hello, world!")


# schedule every 10 seconds
schedule.every(10).seconds.do(greet)

# Get the datetime of next run
next_run_datetime = schedule.next_run()

# Get the number of seconds until the next run
next_run_seconds = schedule.idle_seconds()

# cancel all jobs
schedule.clear()

# schedule every 1 second
schedule.every(1).second.do(greet)

while True:
    # Run any pending jobs
    schedule.run_pending()
    time.sleep(1)
