#include "stdafx.h"

#define Verbose	0				// Used during debug to display MPSSE traffic

extern Channel_Type Channel[2];

BYTE InitializeSequence[] = {
	DisableDivideByFive,
	DisableAdaptiveClocking,
	DisableThreePhaseClock,
	SetClockDivisor, 0, 0,		// = 30MHz clocking
	DisableLoopback,
	SetLowByte, Idle, 0x0B,		// Bits 7..4 = Inputs, 3..0 = SPI
	SetHighByte, 0xFF, 0,		// Bits 7..0 = Inputs
// L and H ports at Idle state
// Now select the Atmel DataFlash and read the DeviceID
	SetLowByte, Select, 0x0B,	// Drive CS low
	AtmelWrite, 0, 0,			// Write 1 command byte
	(ReadDeviceID>>24) & 0xFF,
	AtmelRead, 1, 0,			// Read 2 byte response
	SetLowByte, Idle, 0x0B,
	SetLowByte, Select, 0x0B,	// Toggle CS to measure bit-bang update rate
	SetLowByte, Idle, 0x0B
	};

struct { DWORD Command; BYTE CommandLength; } Atmel[] = {
	{ ReadDirect,			5 },	// Address + pad byte
//	{ Set1024PageSize, 		4 },
	{ EraseSector,			4 },	// Address
	{ ProgramFromBuffer1,	4 },	// Address
	{ Buffer1Write,			4 },	// Address
	{ ProgramFromBuffer2,	4 },	// Address
	{ Buffer2Write,			4 },	// Address
	{ ReadDeviceID,			1 },
	{ Buffer1Read,			5 },	// Address + pad byte
	{ Buffer2Read,			5 },	// Address + pad byte
	{ ReadStatus,			1 }
	};

BYTE SelectAtmel[] = {
	SetLowByte, Select, 0x0B,	// Drive CS low
	};

BYTE DeselectAtmel[] = {
	SetLowByte, Idle, 0x0B,		// Drive CS high
	};

void QByte(int Index, BYTE Value) {
	Channel_Type* C = &Channel[Index];
	C->byOutputBuffer[C->dwNumBytesToSend++] = Value;
	}

void SendBytes(int Index) {
	Channel_Type* C = &Channel[Index];
#if (Verbose)
	printf("\nSending %d bytes to Channel %d:", C->dwNumBytesToSend, Index);
	for (DWORD i = 0; i<C->dwNumBytesToSend; i++) printf(" %2.2X", C->byOutputBuffer[i]);
#endif
	C->ftStatus = FT_Write(C->ftHandle, C->byOutputBuffer, C->dwNumBytesToSend, &C->dwNumBytesSent);
	C->dwNumBytesToSend = 0;
	}

DWORD ReceiveBytes(int Index, BYTE* BufferPtr) {
// Wait for data to be receieved, or Timeout
	Channel_Type* C = &Channel[Index];
	do {
		C->ftStatus = FT_GetQueueStatus(C->ftHandle, &C->dwNumBytesToRead);
		} while ((C->dwNumBytesToRead == 0) && (C->ftStatus == FT_OK));
	C->ftStatus = FT_Read(C->ftHandle, BufferPtr, C->dwNumBytesToRead, &C->dwNumBytesRead);
#if (Verbose)
	printf("\nReceived %d bytes from Channel %d:", C->dwNumBytesRead, Index);
	for (DWORD i = 0; i<C->dwNumBytesRead; i++) printf(" %2.2X", *BufferPtr++);
#endif
	return C->dwNumBytesRead;
	}

BYTE GetCommandLength(BYTE Command) {
	for (int i=0; i<sizeof(Atmel)/sizeof(Atmel[0]); i++) if (Command == (Atmel[i].Command>>24)) return Atmel[i].CommandLength;
	printf("\nAtmel Command not found");
	return 1;
	}

void SendSPICommand(int Index, DWORD DWCommand, BOOL Deselect) {
// Atmel command is in the top byte, other 3 bytes often contain an address
// Some Read Commands needs a Pad byte, which is a Don't Care
	int i;
	union {DWORD DW; BYTE Byte[4];} Parameter;
	Parameter.DW = DWCommand;
	BYTE CommandLength = GetCommandLength(Parameter.Byte[3]);
	for (i=0; i<sizeof(SelectAtmel); i++) QByte(Index, SelectAtmel[i]);
	QByte(Index, AtmelWrite);
	QByte(Index, CommandLength-1);		// LSB = n-1
	QByte(Index, 0);					// MSB
	for (i=0; i<CommandLength; i++) QByte(Index, Parameter.Byte[3-i]);
	if (Deselect) for (i=0; i<sizeof(DeselectAtmel); i++) QByte(Index, DeselectAtmel[i]);
	SendBytes(Index);
	}

void ReadSPI(int Index, BYTE* BufferPtr, int Length) {
	DWORD BytesReceived, BytesToGo;
	if (Length > 64*1024) printf("ERROR: Maximum length of data transfer is 64KB\n");
// Read Length bytes into DataBuffer, then deselect device
	BytesToGo = Length;
	WORD LenM1 = Length - 1;
	QByte(Index, AtmelRead);
	QByte(Index, LenM1 & 0xFF);
	QByte(Index, LenM1 >> 8);
	SendBytes(Index);
	while (BytesToGo) {
		BytesReceived = ReceiveBytes(Index, BufferPtr);
		BytesToGo -= BytesReceived;
		BufferPtr += BytesReceived;
		}
	for (int i=0; i<sizeof(DeselectAtmel); i++) QByte(Index, DeselectAtmel[i]);
	SendBytes(Index);
	}

void WriteSPI(int Index, BYTE* BufferPtr, int Length) {
	if (Length > 64*1024) printf("ERROR: Maximum length of data transfer is 64KB\n");
// Write Length bytes into DataBuffer, then deselect device
	WORD LenM1 = Length - 1;
	QByte(Index, AtmelWrite);
	QByte(Index, LenM1 & 0xFF);
	QByte(Index, LenM1 >> 8);
	for (int i=0; i<Length; i++) QByte(Index, *BufferPtr++);
	for (int i=0; i<sizeof(DeselectAtmel); i++) QByte(Index, DeselectAtmel[i]);
	SendBytes(Index);
	}

BYTE GetStatus(int Index) {
	BYTE StatusBuffer[4];
	SendSPICommand(Index, ReadStatus, FALSE);
	ReadSPI(Index, StatusBuffer, sizeof(StatusBuffer));
	return StatusBuffer[3];
	}

int InitializeChannel(int Index) {
	DWORD i;
// Open and configure the each channel of an FT2232H
	Channel_Type* C = &Channel[Index];
	C->ftStatus = FT_Open(Index, &C->ftHandle);
	if (C->ftStatus != FT_OK) return printf("Open Failed with error %d\n", C->ftStatus);
// Configure port parameters
//	printf("\nConfiguring port for MPSSE use...\n");
	C->ftStatus |= FT_ResetDevice(C->ftHandle);
//Purge USB receive buffer first by reading out all old data from FT2232H receive buffer
	C->ftStatus |= FT_GetQueueStatus(C->ftHandle, &C->dwNumBytesToRead);
//Read out the data from FT2232H receive buffer
	if ((C->ftStatus == FT_OK) && (C->dwNumBytesToRead > 0)) FT_Read(C->ftHandle, &C->byInputBuffer, C->dwNumBytesToRead, &C->dwNumBytesRead);
//Set USB request transfer sizes to 64K
	C->ftStatus |= FT_SetUSBParameters(C->ftHandle, 65536, 65535);
//Disable event and error characters
	C->ftStatus |= FT_SetChars(C->ftHandle, false, 0, false, 0);
//Set the read and write timeouts in milliseconds
	C->ftStatus |= FT_SetTimeouts(C->ftHandle, 0, 5000);
//Set the latency timer (default is 16mS)
	C->ftStatus |= FT_SetLatencyTimer(C->ftHandle, 16);
//Reset controller
	C->ftStatus |= FT_SetBitMode(C->ftHandle, 0x0, 0x00);
//Enable MPSSE mode
	C->ftStatus |= FT_SetBitMode(C->ftHandle, 0x0, 0x02);

	if (C->ftStatus != FT_OK) {
		FT_Close(C->ftHandle);
		return printf("Error %d while initializing the MPSSE\n", C->ftStatus);
		}

// Wait for all the FT2232H to be initialzied
	Idle(50);

// At this point, the MPSSE is ready for commands
// Synchronize the MPSSE by sending a bogus opcode (0xAA),
// The MPSSE will respond with "Bad Command" (0xFA) followed by the bogus opcode itself.
	QByte(Index, 0xAA);
// Send off the BAD command and wait for the response
	SendBytes(Index);
	ReceiveBytes(Index, C->byInputBuffer);
	bool bCommandEchod = false;

//Check if Bad command and echo command received
	for (i = 0; i < C->dwNumBytesRead - 1; i++) {
		if ((C->byInputBuffer[i] == 0xFA) && (C->byInputBuffer[i+1] == 0xAA))	{
			bCommandEchod = true;
			break;
			}
		}
	if (!bCommandEchod) {
		FT_Close(C->ftHandle);
		return printf("Error in synchronizing the MPSSE\n");
		}

// Configure the MPSSE settings for SPI, a full-duplex, byte-oriented data transfer protocol
	for (i=0; i<sizeof(InitializeSequence); i++) QByte(Index, InitializeSequence[i]);
	SendBytes(Index);
// Collect the response from the FT2232H
	ReceiveBytes(Index, C->byInputBuffer);
	return 0;
	};
