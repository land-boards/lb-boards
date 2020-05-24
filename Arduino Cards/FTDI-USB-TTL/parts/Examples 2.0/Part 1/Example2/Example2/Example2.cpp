// Example2.cpp : Embedded USB Design By Example, ByteIO.
//
// ByteIO using an FTDI Cable (TTL-232R) and I2C IO Expander
//
// (c) 2010, John Hyde, USB Design By Example
// You are allowed to use this for your projects but you cannot re-publish it

// Comment out '#define OnWindows' in stdafx.h if you are on a Mac platform
#include "stdafx.h"

#define SyncBitBang 4
// The hardware has bit 0 = SCL, 1 = SDAin, 2 = SDAout
#define SCL		1
#define SDAin	2
#define SDAout	4
// I have my buttons at I2C Address = 0 and my Lights at I2C Address = 1
#define ButtonsAddress	0
#define LightsAddress	1
#define DigitMSB		6
#define DigitLSB		7
// Declare PCA9554 constants
#define InputPortRegister		0
#define OutputPortRegister		1
#define ConfigurationRegister	3

BYTE SevenSegmentLookup[] = { 0x48,0xeb,0x0d,0x89,0xaa,0x98,0x18,0xcb,0x08,0x8a,0x0a,0x38,0x5c,0x29,0x1c,0x1e };

FT_STATUS FT_Status;
FT_HANDLE FT_Handle = 0;

// Define functions in I2C_Driver.cpp
void WriteI2CByte(BYTE Value, BYTE Register, BYTE Address);
BYTE ReadI2CByte(BYTE Address);

void Quit() {
	if (FT_Handle) FT_Close(FT_Handle);
	FT_Handle = 0;
	printf("\nDONE\n");
	exit(0);
	}

BOOL InitializeForByteIO(void) {
	DWORD DeviceCount;
	FT_Status = FT_CreateDeviceInfoList(&DeviceCount);
	if (FT_Status) return printf("FT_CreateDeviceInfoList failed (%d)", FT_Status);
	if (DeviceCount == 0) return printf("No FTDI devices attached\n");

	FT_Status = FT_Open(0, &FT_Handle);
	if (FT_Status) return printf("FT_Open failed (%d)", FT_Status);

	FT_Status = FT_SetBaudRate(FT_Handle, 921600);
	if (FT_Status) return printf("FT_SetBaudRate failed (%d)", FT_Status);

	FT_Status = FT_SetBitMode(FT_Handle, SDAout|SCL, SyncBitBang);
	if (FT_Status) return printf("FT_SetBitMode failed (%d)", FT_Status);

	return 0;
	}

int main(int argc, char* argv[]) {
	BYTE Buttons;
	printf("Example2: ByteIO\n");

#ifdef OnOSX
	signal(SIGINT, Quit);		// Trap Control+C function Quit on Mac
#endif

	if (!InitializeForByteIO()) {
		printf("\nFT232R cable found\n");
// Configure Buttons to be input
		WriteI2CByte(0xFF, ConfigurationRegister, ButtonsAddress);
// Setup Buttons(InputPortRegister) as the default register
		WriteI2CByte(0xAA, InputPortRegister, ButtonsAddress);
// Configure Lights to be output
        WriteI2CByte(0, ConfigurationRegister, LightsAddress);
        WriteI2CByte(0, ConfigurationRegister, DigitLSB);
		for (int i=0; i<100; i++) {
			Buttons = ReadI2CByte(ButtonsAddress);
			printf("\rButtons = %2.2X", Buttons);
//			BYTE Answer = (Buttons & 0xF) * ((Buttons>>4) & 0xF);
			WriteI2CByte(Buttons, OutputPortRegister, LightsAddress);
			WriteI2CByte(SevenSegmentLookup[i&0xf], OutputPortRegister, DigitLSB);
			Idle(1000);
			}
		}
	Quit();
	}

