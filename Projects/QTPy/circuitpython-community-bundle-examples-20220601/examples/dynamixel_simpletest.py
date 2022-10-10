# The MIT License (MIT)
#
# Copyright (c) 2020 Lucian Copeland
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

import board
import busio
import digitalio
import time
import circuitpython_dynamixel

control = digitalio.DigitalInOut(board.D12)
control.direction = digitalio.Direction.OUTPUT
control.value = True
uart = busio.UART(board.TX, board.RX, baudrate=1000000)
ax12 = circuitpython_dynamixel.Dynamixel(uart,control)
ax12.set_speed(0xfe,0x100)
while True:
    print(ax12.get_temp(0x00))
    ax12.set_position(0x00,0)
    time.sleep(1)
    ax12.set_position(0x00,512)
    time.sleep(1)
    ax12.set_position(0x00,1023)
    time.sleep(1)
