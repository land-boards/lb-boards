# PROTO16_Blink.py
#
# https://docs.circuitpython.org/en/latest/shared-bindings/busio/index.html
# https://developer.sony.com/develop/spresense/docs/circuitpython_tutorials_en.html
#
# http://land-boards.com/blwiki/index.php?title=SWLEDX8-I2C
# PORTA = LEDs
# PORTB = LEDs
#

import busio
import board
import time

MCP23017_BASEADDR = 0x20

# IOCON.BANK0
MCP23017_IODIRA = 0x00
MCP23017_IPOLA = 0x02
MCP23017_GPINTENA = 0x04
MCP23017_DEFVALA = 0x06
MCP23017_INTCONA = 0x08
MCP23017_IOCONA = 0x0A
MCP23017_GPPUA = 0x0C
MCP23017_INTFA = 0x0E
MCP23017_INTCAPA = 0x10
MCP23017_GPIOA = 0x12
MCP23017_OLATA = 0x14

MCP23017_IODIRB = 0x01
MCP23017_IPOLB = 0x03
MCP23017_GPINTENB = 0x05
MCP23017_DEFVALB = 0x07
MCP23017_INTCONB = 0x09
MCP23017_IOCONB = 0x0B
MCP23017_GPPUB = 0x0D
MCP23017_INTFB = 0x0F
MCP23017_INTCAPB = 0x11
MCP23017_GPIOB = 0x13
MCP23017_OLATB = 0x15

def writeMCP23xxxReg(reg, val):
    passVal = bytearray([reg, val])
    i2c.writeto(MCP23017_BASEADDR, passVal)

def readMCP23xxxReg(reg):
    result = bytearray(1)
    i2c.writeto_then_readfrom(MCP23017_BASEADDR, bytes([reg]), result)
    return result

def writeLEDs(wrVal):
    writeMCP23xxxReg(MCP23017_OLATA, wrVal & 0xFF)
    writeMCP23xxxReg(MCP23017_OLATB, ((wrVal >> 8) & 0xFF))

def initPROTO16():
    writeMCP23xxxReg(MCP23017_IOCONA, 0x44)
    writeMCP23xxxReg(MCP23017_IOCONB, 0x44)
    writeMCP23xxxReg(MCP23017_IODIRA, 0x00)     # LEDs
    writeMCP23xxxReg(MCP23017_IODIRB, 0x00)     # LEDs
    writeMCP23xxxReg(MCP23017_IPOLA, 0x00)
    writeMCP23xxxReg(MCP23017_IPOLB, 0x00)
    writeMCP23xxxReg(MCP23017_GPINTENA, 0x00)
    writeMCP23xxxReg(MCP23017_GPINTENB, 0x00)
    writeMCP23xxxReg(MCP23017_DEFVALA, 0x0)
    writeMCP23xxxReg(MCP23017_DEFVALB, 0x00)
    writeMCP23xxxReg(MCP23017_INTCONA, 0x00)
    writeMCP23xxxReg(MCP23017_INTCONB, 0x00)
    writeMCP23xxxReg(MCP23017_GPPUA, 0x00)
    writeMCP23xxxReg(MCP23017_GPPUB, 0x00)

i2c = busio.I2C(board.SCL, board.SDA)


def doPROTO16():
    while not i2c.try_lock():
        pass

    initPROTO16()

    loopCount = 0
    while loopCount < 60:
        ledVal = 1
        while ledVal < 0x10000:
            writeLEDs(ledVal)
            time.sleep(0.25)
            ledVal <<= 1
        loopCount += 1

    i2c.unlock()
