extern "C" {
#include <project.h>
}
#include "Arduino.h"
#include "Arduino_Serial.h"
#include "UARTClass.h"

/*******************************************************
 * This file includes the middle-man functions which lie between the UART
 * class and the Cypress API.
 * We'll add to it as needed to support additional hardware in other virtual
 * boards.
 ******************************************************/

extern struct SerialHelperFuncs USBUART_Helpers;
extern struct SerialHelperFuncs UART_Helpers;

// Wait for PC to configure USB for CONFIG_DELAY * CONFIG_LOOPS milliseconds
#define CONFIG_DELAY 10
#define CONFIG_LOOPS 200

bool enableUSBCDC()
{
  USBUART_Start(0, USBUART_3V_OPERATION);
  uint8_t delayCounter = 0;
  /* It's important that we not loop forever here, or we'll never leave in
   * cases where the device isn't plugged into a PC. We do, however, want to
   * provide enough time for the PC to do its thing. */  
  while(USBUART_GetConfiguration() == 0)
  {  
    CyDelay(100);
    delayCounter++;
    if (delayCounter > 20)
    {
      return false;
    }
  }
  USBUART_CDC_Init();
  return true;
}

/**********************************************************************
 * FunctionAttach() functions should point these to some implementation
 * for the particular interface. Not all of them have to be implemented
 * for all types of interface, as noted.
  uint16_t (*bufferSize)(void); - Return number of bytes in the peripheral
    buffer.
  void (*sendData)(const uint8_t* buffer, uint16_t size);
  uint16_t (*getData)(uint8_t* buffer, uint16_t size);
  bool (*blockForReadyToWrite)(void); 

These are for non-USB UARTs only:
  void (*clockAdjust)(uint16_t newDivider); - Changes the clock divider on
    the UART clock input to provide the new baudrate output.
  bool (*portEnable)(void);
  void (*portDisable)(void);
  void (*blockForWriteComplete)(void);
**********************************************************************/

void Serial_CustomPutArray(const uint8_t* buffer, uint16_t size);
int16_t USBUART_CustomGetCount();

void USBUART_FunctionAttach()
{
  USBUART_Helpers.bufferSize = USBUART_CustomGetCount;
  USBUART_Helpers.sendData = USBUART_PutData;
  USBUART_Helpers.getData = USBUART_GetData;
  USBUART_Helpers.blockForReadyToWrite = USBUART_CDCIsReady;
}

uint16_t UART_CustomGetDataArray(uint8_t* buffer, uint16_t size);
int16_t UART_CustomGetBufferSize(void);
void     UART_CustomPutArray(const uint8_t* buffer, uint16_t size);
bool     UART_CustomPortEnable(void);
void     UART_CustomPortDisable(void);
void     UART1Clock_CustomSetDivider(uint16_t newDivider);
uint8_t  UART_CustomIsReady(void);

void UART_FunctionAttach()
{
  UART_Helpers.bufferSize = UART_CustomGetBufferSize;
  UART_Helpers.sendData = UART_CustomPutArray;
  UART_Helpers.getData = UART_CustomGetDataArray;
  UART_Helpers.portEnable = UART_CustomPortEnable;
  UART_Helpers.portDisable = UART_CustomPortDisable;
  UART_Helpers.clockAdjust = UART1Clock_CustomSetDivider;
  UART_Helpers.blockForReadyToWrite = UART_CustomIsReady;
}


/**********************************************************************
 * Sometimes, it's not possible to make a 1:1 conversion between the needs
 * of the UART class and the available functions in the Cypress API. Below
 * are the functions which implement that conversion.
 * *******************************************************************/

typedef uint8_t (*UART_getDataFunc)(void);
typedef uint8_t (*UART_getBufferSize)(void);

UART_getDataFunc readByte;
UART_getBufferSize readBufSize;

uint16_t UART_GetDataArray(uint8_t* buffer, uint8_t size);

uint16_t UART_CustomGetDataArray(uint8_t* buffer, uint16_t size)
{
  readByte = UART_ReadRxData;
  readBufSize = UART_GetRxBufferSize;
  return UART_GetDataArray(buffer, size);
}

int16_t UART_CustomGetBufferSize(void)
{
  return (int16_t)UART_GetRxBufferSize();
}

void UART_CustomPutArray(const uint8_t* buffer, uint16_t size)
{
  UART_PutArray(buffer, size);
}

bool UART_CustomPortEnable(void)
{
  UART_Start();
  pinMode(D0, PERIPHERAL_IN);
  pinMode(D1, PERIPHERAL_OUT);
  return true; 
}

void UART_CustomPortDisable(void)
{
  UART_Stop();
  pinMode(D0, INPUT);
  pinMode(D1, INPUT);
}

uint16_t UART_GetDataArray(uint8_t* buffer, uint8_t size)
{
  uint16_t bytesRead = 0;
  for (int i = 0; i < size; ++i)
  {
    if (readBufSize() > 0)
    {
      buffer[i] = readByte();
      ++bytesRead;
    }
    else
    {
      break;
    }
  }
  return bytesRead;
}


int16_t USBUART_CustomGetCount()
{
  if (USBUART_DataIsReady() == 0)
  {
    return 0;
  }
  else
  {
    return USBUART_GetCount();
  }
}
/***************************************************************************
 * WHY!?!?!
 * Why have a function which calls a seemingly identical function? It's not
 * even abstracted or anything?!?!?!
 * Because, SetDividerValue isn't a function, it's a macro for a function
 * which is incompatible, so trying to use a pointer that's compatible with
 * SetDividerValue doesn't work. Blech.
 * ***********************************************************************/

void UART1Clock_CustomSetDivider(uint16_t newDivider)
{
  UART_Clock_SetDividerValue(newDivider);
}

uint8_t  UART_CustomIsReady( void )
{
  return (UART_ReadTxStatus() != UART_TX_STS_FIFO_FULL);
}
