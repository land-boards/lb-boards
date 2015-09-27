/* ========================================
 *
 * Copyright YOUR COMPANY, THE YEAR
 * All Rights Reserved
 * UNPUBLISHED, LICENSED SOFTWARE.
 *
 * CONFIDENTIAL AND PROPRIETARY INFORMATION
 * WHICH IS THE PROPERTY OF your company.
 *
 * ========================================
*/


extern "C" {
#include <Project.h>
} 

#include "stdint.h"
#include "Arduino_I2C.h"
#include "Arduino_Pins.h"

#define BUS_CLOCK_RATE 24000000

TwoWire Wire = TwoWire();

void TwoWire::begin()
{
    pinMode(A4, PERIPHERAL_OD);
    pinMode(A5, PERIPHERAL_OD);
    I2C_Enable_Write(0x01);
    I2C_Start();
}

void TwoWire::setClock(uint32_t newClockRate)
{
  uint32_t clockDivider = (1/BUS_CLOCK_RATE)*newClockRate;
  twiClock = newClockRate;
  *(uint8_t*)(CYREG_I2C_CLK_DIV1) = (uint8_t)clockDivider;
  *(uint8_t*)(CYREG_I2C_CLK_DIV1) = (uint8_t)((clockDivider>>8)&0x02);

}
void TwoWire::beginTransmission(uint8_t address)
{
    slaveAddress = address;
}

void TwoWire::beginTransmission(int address)
{
    slaveAddress = (uint8_t) address;
}

uint8_t TwoWire::endTransmission(enum XFER_MODE stop)
{
    I2C_MasterClearStatus();
    
    if (stop == COMPLETE)
    {
        I2C_MasterWriteBuf(slaveAddress, i2cTXBuffer, i2cTXBufferSize, \
            I2C_MODE_COMPLETE_XFER);
    }
    else if (stop == REPEATED_START)
    {
        I2C_MasterWriteBuf(slaveAddress, i2cTXBuffer, i2cTXBufferSize, \
            I2C_MODE_REPEAT_START);
    }
    else
    {
        I2C_MasterWriteBuf(slaveAddress, i2cTXBuffer, i2cTXBufferSize, \
            I2C_MODE_NO_STOP);
    }
    
    while(0u != (I2C_MasterStatus() & I2C_MSTAT_XFER_INP));
    i2cTXBufferSize = 0;
    return 0;
}

uint8_t TwoWire::endTransmission()
{
  return endTransmission(COMPLETE);
}
    
uint8_t TwoWire::requestFrom(uint8_t address, uint8_t quantity, \
    enum XFER_MODE stop)
{
    I2C_MasterClearStatus();
    
    if (stop == COMPLETE)
    {
        I2C_MasterReadBuf(address, i2cRXBuffer, quantity, \
            I2C_MODE_COMPLETE_XFER);
    }
    else if (stop == REPEATED_START)
    {
        I2C_MasterReadBuf(address, i2cRXBuffer, quantity, \
            I2C_MODE_REPEAT_START);
    }
    else
    {
        I2C_MasterReadBuf(address, i2cRXBuffer, quantity, I2C_MODE_NO_STOP);
    }
    
    while(0u == (I2C_MasterStatus() & I2C_MSTAT_RD_CMPLT));
    i2cRXBufferSize = quantity;
    return quantity;
}

uint8_t TwoWire::requestFrom(uint8_t address, uint8_t quantity)
{
  return requestFrom(address, quantity, COMPLETE);
}

uint8_t TwoWire::requestFrom(int address, int quantity)
{
  return requestFrom((uint8_t)address, (uint8_t)quantity, (enum XFER_MODE)COMPLETE);
}
    
uint8_t TwoWire::requestFrom(int address, int quantity, int sendStop)
{
  return requestFrom((uint8_t) address, (uint8_t) quantity, (enum XFER_MODE)sendStop);
}

size_t TwoWire::write(uint8_t *buffer, uint8_t length)
{
    uint8_t i;
    if (i2cTXBufferSize == 32)
    {
        txOverflow = 1;
        return 0;
    }
    for (i=0; i < length; i++)
    {
        i2cTXBuffer[i2cTXBufferSize+i] = buffer[i];
        if (++i2cTXBufferSize == 32)
        {
            txOverflow = 1;
            return i+1;
        }
    }
    return i;
}

size_t TwoWire::write(uint8_t buffer)
{
  return write((uint8_t *)&buffer, 1);
}

int TwoWire::available()
{
    return i2cRXBufferSize;
}

int TwoWire::read()
{
    if (i2cRXBufferSize == 0) return -1;
    return i2cRXBuffer[--i2cRXBufferSize];
}

int TwoWire::peek()
{
    if (i2cRXBufferSize == 0) return -1;
    return i2cRXBuffer[i2cRXBufferSize];
}

void TwoWire::flush()
{
}

/* [] END OF FILE */
