#ifndef _arduino_i2c_h
#define _arduino_i2c_h
  
extern "C"
{
  #include "Project.h"
}
#include "Stream.h"
  
enum XFER_MODE {COMPLETE, REPEATED_START, NO_STOP};

class TwoWire;

extern TwoWire Wire;

class TwoWire : public Stream
{
  public:
    TwoWire(){};
    void begin();
    //void begin(uint8_t); TODO: add slave support?
    //void begin(int); TODO: add slave support?

    void setClock(uint32_t); // TODO: implement this

    void beginTransmission(uint8_t address);
    void beginTransmission(int address);

    uint8_t endTransmission();
    uint8_t endTransmission(enum XFER_MODE stop);

    uint8_t requestFrom(uint8_t address, uint8_t quantity, \
        enum XFER_MODE stop);
    uint8_t requestFrom(uint8_t address, uint8_t quantity);
    uint8_t requestFrom(int address, int quantity);
    uint8_t requestFrom(int address, int quantity, int sendStop);

    virtual size_t write(uint8_t *buffer, uint8_t length);
    virtual size_t write(uint8_t buffer);

    inline size_t write(unsigned long n) { return write((uint8_t)n); }
    inline size_t write(long n) { return write((uint8_t)n); }
    inline size_t write(unsigned int n) { return write((uint8_t)n); }
    inline size_t write(int n) { return write((uint8_t)n); }

    virtual int available();
    virtual int read();
    virtual int peek();
    virtual void flush();

    //TODO: Implement these for slave mode?
    //void onReceive(void(*)(int));
    //void onRequest(void(*)(void));
    
  private:
    uint32_t twiClock;
    uint8_t i2cRXBuffer[128];
    uint8_t i2cTXBuffer[32];
    uint8_t i2cRXBufferSize;
    uint8_t i2cTXBufferSize;
    uint8_t slaveAddress;
    uint8_t txOverflow;
    uint8_t rxOverflow;
};

#endif

/* [] END OF FILE */
