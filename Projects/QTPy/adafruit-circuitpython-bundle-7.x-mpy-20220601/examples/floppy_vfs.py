# SPDX-FileCopyrightText: 2017 Scott Shawcroft, written for Adafruit Industries
# SPDX-FileCopyrightText: Copyright (c) 2022 Jeff Epler for Adafruit Industries
#
# SPDX-License-Identifier: Unlicense

# On an Adafruit Feather M4 or Adafruit Feather RP2040 with Floppy Featherwing,
# print the root directory listing of a 1.44MB floppy

import os
import storage
import board
import adafruit_datetime as datetime
import adafruit_floppy

D24 = getattr(board, "D24") or getattr(board, "A4")
D25 = getattr(board, "D25") or getattr(board, "A5")

epoch = datetime.datetime(1970, 1, 1)

ST_SIZE = 6
ST_TIME = 7
SV_BFREE = 3

floppy = adafruit_floppy.MFMFloppy(
    densitypin=board.A0,
    indexpin=board.A1,
    selectpin=board.A2,
    motorpin=board.A3,
    directionpin=D24,
    steppin=D25,
    track0pin=board.D11,
    protectpin=board.D10,
    rddatapin=board.D9,
    sidepin=board.D6,
    readypin=board.D5,
)

f = adafruit_floppy.FloppyBlockDevice(floppy, sectors=18)

vfs = storage.VfsFat(f)
storage.mount(vfs, "/floppy")

print(f"floppy mounted, Capacity {f.count()} blocks")
print()

print("Directory listing")
for i, f in enumerate(sorted(os.listdir("/floppy"))):
    st = os.stat("/floppy/" + f)
    d = epoch + datetime.timedelta(seconds=st[ST_TIME])
    print(f"{f:12} {st[ST_SIZE]:6} bytes, {d}")

sv = os.statvfs("/floppy")
print(f"{sv[SV_BFREE]*512} bytes free")
