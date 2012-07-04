// stdafx.h : include file for standard system include files,
// or project specific include files that are used frequently, but
// are changed infrequently
//

#pragma once

#define OnWindows

#define MaxChannels			2
#define WriteTestPattern	0		// Set to 1 to enable write test of Atmel
#define DumpAtmel			1		// Set to 1 to read Atmel contents

#include <stdio.h>
#include "constants.h"

#ifdef OnWindows
#include "targetver.h"
#include <windows.h>
#include <conio.h>
#include "..\..\ftd2xx.h"
#define Idle(X) Sleep(X)
#else
#define OnOSX
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>
#include "../ftd2xx.h"
#define Idle(X) usleep(1000*X)
#endif

typedef struct {
	FT_HANDLE ftHandle;				// Handle of the FTDI device
	FT_STATUS ftStatus;				// Result of each D2XX call
	BYTE byOutputBuffer[64*1024];	// Buffer to hold MPSSE commands and data to be sent to the FT2232H
	BYTE byInputBuffer[64*1024];	// Buffer to hold data read from the FT2232H
	DWORD dwNumBytesToSend;			// Index to the output buffer
	DWORD dwNumBytesSent;			// Count of actual bytes sent - used with FT_Write
	DWORD dwNumBytesToRead;			// Number of bytes available to read in the driver's input buffer
	DWORD dwNumBytesRead;			// Count of actual bytes read - used with FT_Read
	} Channel_Type;

