# https://docs.circuitpython.org/en/latest/shared-bindings/busio/index.html
# https://developer.sony.com/develop/spresense/docs/circuitpython_tutorials_en.html

import busio
import board

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

def readJumpers():
    rdVal = int(readMCP23xxxReg(MCP23008_GPIO)[0])
    rdVal = ((rdVal >> 4) & 0x0F)
    return rdVal

def writeLEDs(wrVal):
    writeMCP23xxxReg(MCP23008_OLAT, wrVal)

def initI2CIO8():
    writeMCP23xxxReg(MCP23008_IODIR, 0xF0)
    writeMCP23xxxReg(MCP23008_IPOL, 0xF0)
    writeMCP23xxxReg(MCP23008_GPINTEN, 0x0F)
    writeMCP23xxxReg(MCP23008_INTCON, 0x00)
    writeMCP23xxxReg(MCP23008_IOCON, 0x22)
    writeMCP23xxxReg(MCP23008_GPPU, 0x00)

i2c = busio.I2C(board.SCL, board.SDA)

def doI2CIO8():
    # Lock the I2C device before accessing I2C
    while not i2c.try_lock():
        pass

    # Initialize the I2CIO-8 card
    initI2CIO8()

    # Loop on read jumpers, write LEDs
    while True:
        rdVal = readJumpers()
        writeLEDs(rdVal)

    i2c.unlock()
