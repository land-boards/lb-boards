// I2C_Driver.cpp	This modules does all the bit handling for the I2C interface
//
// I generate an I2C waveform in OutBuffer then send this to the FT232R which bit-bangs the IO pins
//
#include "stdafx.h"

#define Verbose	0	// Used during debug to display data bytes

extern FT_STATUS FT_Status;
extern FT_HANDLE FT_Handle;

// The hardware has bit 0 = SCL, 1 = SDAin, 2 = SDAout, 3 = Int
#define SCL		1
#define SDAin	2
#define SDAout	4

BYTE OutBuffer[128];
int BufferIndex;
BYTE InBuffer[128];

void QByte(BYTE Value) {
	OutBuffer[BufferIndex] = Value;
	if (++BufferIndex >= sizeof(OutBuffer)) printf("\nERROR: Output buffer full!");
	}

void StrobeOutBit(BYTE Value) {
	QByte(Value);
	QByte(Value | SCL);
	QByte(Value);
	}

void StrobeOutByte(BYTE Value) {
// I2C sends data MSb first
	for (int i=0x80; i>0; i=i>>1) {
		if (Value & i) StrobeOutBit(SDAout | SDAin);
		else StrobeOutBit(SDAin);
		}
	}

void StrobeInBit(void) {
// Data will be gathered in the RX FIFO and read after CreateStop
	QByte(SDAout | SDAin);
	QByte(SDAout | SDAin | SCL);
	QByte(SDAout | SDAin);
	}

void StrobeInByte(void) {
	for (int i=0; i<8; i++) StrobeInBit();
	}

void CreateStart(void) {
// Initialize the OutBuffer on a Start
	BufferIndex = 0;
	QByte(SDAin | SDAout | SCL);   // I2C Idle state
	QByte(SDAin | SCL);
	QByte(SDAin);
	}

BYTE CreateStop(void) {
// Send the OutBuffer to the device on a Stop and retrieve data byte
	BYTE DataByte;
	DWORD BytesSent, BytesReceived;
	QByte(SDAin);
	QByte(SDAin | SCL);
	QByte(SDAin | SDAout | SCL);   // I2C Idle state
// I am using Synchronous BitBang so Reads must match Writes to stay in sync
#if (Verbose)
	printf("\nSending %d bytes to FT232R:", BufferIndex);
	for (int i = 0; i<BufferIndex; i++) printf(" %2.2X", OutBuffer[i]);
#endif
	FT_Status = FT_Write(FT_Handle, OutBuffer, BufferIndex, &BytesSent);
	if (FT_Status) printf("\nERROR sending bytes = %d", FT_Status);
	BufferIndex = 0;
	FT_Status = FT_Read(FT_Handle, InBuffer, BytesSent, &BytesReceived);
	if (FT_Status) printf("\nERROR receiving bytes = %d", FT_Status);
#if (Verbose)
	printf("\n%d bytes received from FT232R:", BytesReceived);
	for (int i = 0; i<BytesReceived; i++) printf(" %2.2X", InBuffer[i]);
#endif
// Now extract the DataByte from the InBuffer, its position is fixed
    DataByte = 0;
	for (int i=0; i<8; i++) if (InBuffer[32+(3*i)] & SDAin) DataByte |= 1<<(7-i);
	return DataByte;
	}

void GetACK(void) {
	StrobeInBit();
	}

void WriteI2CByte(BYTE Value, BYTE Register, BYTE Address) {
	CreateStart();
	StrobeOutByte(0x40 + ((Address & 7)<<1));
	GetACK();
	StrobeOutByte(Register);
	GetACK();
	StrobeOutByte(Value);
	GetACK();
	CreateStop();
	}

BYTE ReadI2CByte(BYTE Address) {
	CreateStart();
	StrobeOutByte(0x41 + ((Address & 7)<<1));
	GetACK();
	StrobeInByte();
	return CreateStop();
	}
