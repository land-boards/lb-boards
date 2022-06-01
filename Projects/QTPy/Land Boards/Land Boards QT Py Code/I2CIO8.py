# https://docs.circuitpython.org/en/latest/shared-bindings/busio/index.html
# https://developer.sony.com/develop/spresense/docs/circuitpython_tutorials_en.html

import busio
import board
import time

MCP23008_BASEADDR = 0x20
MCP23008_IODIR = 0x00
MCP23008_IPOL = 0x01
MCP23008_GPINTEN = 0x02
MCP23008_DEFVAL = 0x03
MCP23008_INTCON = 0x04
MCP23008_IOCON = 0x05
MCP23008_GPPU = 0x06
MCP23008_INTF = 0x07
MCP23008_INTCAP = 0x08
MCP23008_GPIO = 0x09
MCP23008_OLAT = 0x0A

def writeMCP23xxxReg(reg, val):
    passVal = bytearray([reg, val])
    i2c.writeto(MCP23008_BASEADDR, passVal)

def readMCP23xxxReg(reg):
    result = bytearray(1)
    i2c.writeto_then_readfrom(MCP23008_BASEADDR, bytes([reg]), result)
    return result

i2c = busio.I2C(board.SCL, board.SDA)
print("allocated i2c")

def doI2CIO8():
    print("started")

    # Lock the I2C device before accessing I2C
    while not i2c.try_lock():
        pass

    print("Locked")

    writeMCP23xxxReg(MCP23008_IODIR, 0xF0)
    loopCount = 0
    while loopCount < 60:
        writeMCP23xxxReg(MCP23008_OLAT, 0xA5)
        time.sleep(0.5)
        writeMCP23xxxReg(MCP23008_OLAT, 0x5A)
        time.sleep(0.5)
        loopCount += 1

    print("Done")

    i2c.unlock()
    print("Unlocked")
