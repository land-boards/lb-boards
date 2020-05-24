// Example1.cpp : Embedded USB Design By Example, BitIO.
//
// BitIO using an FTDI Cable (TTL-232R)
//
// (c) 2010, John Hyde, USB Design By Example
// You are allowed to use this for your projects but you cannot re-publish it

#include "stdafx.h"

#define LED_On		0xFF
#define LED_Off		0
#define Button		8
#define SyncBitBang 4

FT_STATUS FT_Status;
FT_HANDLE FT_Handle = 0;

void Quit() {
	if (FT_Handle) FT_Close(FT_Handle);
	FT_Handle = 0;
	printf("DONE\n");
	exit(0);
	}

BOOL InitializeForBitIO(void) {
	DWORD DeviceCount;
	FT_Status = FT_CreateDeviceInfoList(&DeviceCount);
	if (FT_Status) return printf("FT_CreateDeviceInfoList failed (%d)", FT_Status);
	if (DeviceCount == 0) return printf("No FTDI devices attached\n");

	FT_Status = FT_Open(0, &FT_Handle);
	if (FT_Status) return printf("FT_Open failed (%d)", FT_Status);

	FT_Status = FT_SetBaudRate(FT_Handle, 921600);
	if (FT_Status) return printf("FT_SetBaudRate failed (%d)", FT_Status);

	FT_Status = FT_SetBitMode(FT_Handle, 1, SyncBitBang);
	if (FT_Status) return printf("FT_SetBitMode failed (%d)", FT_Status);

	return 0;
	}

UCHAR ReadBits(void) {
	UCHAR Value;
	DWORD BytesRead;
	FT_Status = FT_Read(FT_Handle, &Value, 1, &BytesRead);
	if (FT_Status != FT_OK) {
		printf("\nFT_Read error (%d), Cable disconnected?\n", FT_Status);
		Idle(2000);		// Display error message for 2 seconds
		Quit();
		}
	return ~Value;
	}

void WriteBits(UCHAR Value) {
	DWORD BytesWritten;
	FT_Status = FT_Write(FT_Handle, &Value, 1, &BytesWritten);
	if (FT_Status != FT_OK) {
		printf("\nFT_Write error (%d), Cable disconnected?\n", FT_Status);
		Idle(2000);		// Display error message for 2 seconds
		Quit();
		}
	}


int main(int argc, char* argv[]) {
	printf("Example1: BitIO\n");

#ifdef OnOSX
	signal(SIGINT, Quit);		// Trap Control+C function Quit on Mac
#endif

	if (!InitializeForBitIO()) {
		printf("\nFT232R cable found\nLED is ");
		while (1) {
			WriteBits(LED_Off);
			printf("Off\b\b\b");
			Idle(10);
			while (ReadBits() & Button) {
				WriteBits(LED_On);
				printf("On \b\b\b");
				Idle(10);
				}
			}
		}
	Quit();
	}

