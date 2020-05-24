// Define constants used in the program

enum MPSSE_Commands {
	AtmelWrite = 0x11,
	AtmelRead = 0x20,
	AtmelDataTransfer = 0x35,
	SetLowByte = 0x80,
	ReadLowByte,
	SetHighByte,
	ReadHighByte,
	EnableLoopback,
	DisableLoopback,
	SetClockDivisor,
	DisableDivideByFive = 0x8a,
	EnableDivideByFive,
	EnableThreePhaseClock,
	DisableThreePhaseClock,
	WaitNBits,
	WaitNBytes,
	EnableAdaptiveClocking = 0x96,
	DisableAdaptiveClocking
	};

enum Atmel_Commands {
	ReadDirect = 0x0B000000,
//	Set1024PageSize = 0xA6802A3D,
	EraseSector = 0x7C000000,
	ProgramFromBuffer1 = 0x83000000,
	Buffer1Write = 0x84000000,
	ProgramFromBuffer2 = 0x86000000,
	Buffer2Write = 0x87000000,
	ReadDeviceID = 0x9f000000,
	Buffer1Read = 0xD4000000,
	Buffer2Read = 0xD6000000,
	ReadStatus = 0xD7000000
	};

enum SPI_Pins {
	Select = 0xF6,		// SCLK, CS = low
	Idle = 0xFE			// SCLK = low
	};

#define READY 0x80
