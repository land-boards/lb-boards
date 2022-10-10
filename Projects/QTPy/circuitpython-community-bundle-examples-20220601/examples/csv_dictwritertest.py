# SPDX-FileCopyrightText: 2017 Scott Shawcroft, written for Adafruit Industries
# SPDX-FileCopyrightText: Copyright (c) 2021 Alec Delaney
#
# SPDX-License-Identifier: MIT

import board
import sdcardio
import storage
import circuitpython_csv as csv

# Initialize SD card
spi = board.SPI()
sdcard = sdcardio.SDCard(spi, board.D10)
vfs = storage.VfsFat(sdcard)
storage.mount(vfs, "/sd")

header = ["name", "fav-board", "fav-wing"]

my_info = {
    "name": "Blinka",
    "fav-board": "Feather M4 Express",
    "fav-wing": "Adalogger FeatherWing",
}

with open("/sd/testwrite.csv", mode="w", encoding="utf-8") as writablefile:
    csvwriter = csv.DictWriter(writablefile, header)
    csvwriter.writeheader()
    csvwriter.writerow(my_info)
