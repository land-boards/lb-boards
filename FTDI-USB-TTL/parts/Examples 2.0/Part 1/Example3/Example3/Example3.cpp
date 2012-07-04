// Example3.cpp : DataPod Dump - creates a binary file from the DataPod's Atmel DataFlash
//
// (c) 2010, John Hyde, USB Design By Example
//
// I support 3 Atmel DataFlash parts
//	1) id = 0x26 = 2MB or 4096 pages x  512 bytes/page
//	2) id = 0x27 = 4MB or 8192 pages x  512 bytes/page
//	3) id = 0x28 = 8MB or 8192 pages x 1024 bytes/page

#include "stdafx.h"

Channel_Type Channel[MaxChannels];	// Single FT2232H has 2 channels, I have the same Atmel Flash on both
BOOL Success;
BYTE Buffer[64*1024];				// Used when reading DataFlash
DWORD PageBuffer[1024/4];			// Max page size is 1024 bytes
char FileName[] = { "Channel0_Data.bin" };
FILE* FileHandle;
int PageSize, PageCount, Counter;

void InitializeLCD(int Index);
int InitializeChannel(int Index);
void SendSPICommand(int Index, DWORD DWCommand, BOOL Deselect);
void ReadSPI(int Index, BYTE* BufferPtr, int Length);
void WriteSPI(int Index, BYTE* BufferPtr, int Length);
BYTE GetStatus(int Index);
void QByte(int Index, BYTE Value);
void SendBytes(int Index);

int main(int argc, char* argv[]) {
	DWORD dwNumDevs;
	int Index, StartAddress, EndAddress;
	FT_STATUS ftStatus;
	printf("\nData Collection Pod V0.5\n");
#ifdef OnOSX
	// OSX implements buffering on stdout as default, turn this off
	int Result = setvbuf(stdout, NULL, _IONBF, 0);
	if (Result) printf("Could not turn off stdout buffering\n");
	// Trap Control+C function, used to stop execution
	//	signal(SIGINT, quit());
#endif
	StartAddress = 0x400;		// Default values
	EndAddress = 0x100000;		// = 8MB
	// Extract the two parameters - uncomment next 4 lines to enable parameter selection
	//if (argc != 3) return printf("\nUsage: DPD <StartAddress(AssumedHex)> <EndAddress(AssumedHex)>\neg. DPD 1000 4fff\n");
	//sscanf_s(argv[1], "%x", &StartAddress);
	//sscanf_s(argv[2], "%x", &EndAddress);
	//if (StartAddress > EndAddress) return printf("\nERROR: EndAddress must be greater than StartAddress\n");
	
	// OK Input is fine, look for the DataPod Dongle, I assume its the only FTDI part connected (need to fix this)
	ftStatus = FT_CreateDeviceInfoList(&dwNumDevs);
	if ((ftStatus != FT_OK)||(dwNumDevs < 1)) return printf("No devices currently attached\n");
	
	for (Index=0; Index<MaxChannels; Index++) {
		Channel_Type* C = &Channel[Index];
		if (InitializeChannel(Index)) printf("Error on channel %d\n", Index);
		else {
			// Display the result
			if (C->byInputBuffer[0] != 0x1F) printf("\nThis is not an Atmel DataFlash (ID=%2.2X)\n", C->byInputBuffer[0]);
			else {
				printf("\nChannel %d = ", Index);
				PageSize = 512;					// Default
				PageCount = 8192;				// Default
				switch (C->byInputBuffer[1]) {
					case 0x26: PageCount = 4096; printf("2"); break;
					case 0x27:					printf("4"); break;
					case 0x28: PageSize = 1024; printf("8"); break;
					default:   printf("Unknown (%2.2X) ??", C->byInputBuffer[1]);
				}
				printf("MB Atmel DataFlash found\n");
				
#if (WriteTestPattern)
				// Writing to the Atmel DataFlash is a two step process:
				//	1) Write to an integrated buffer (device has 2 so we can double-buffer)
				//	2) Program the Flash memory from an integrated buffer (can fill one buffer while programming from the other)
				Counter = 0;
				for (int Page=0; Page<PageCount; Page++) {
					printf("Programming Page %d of %d\r", Page+1, PageCount);
					for (int i=0; i<PageSize/4; i++) PageBuffer[i] = Counter++;
					if (Page & 1) SendSPICommand(Index, Buffer2Write, FALSE);
					else SendSPICommand(Index, Buffer1Write, FALSE);
					WriteSPI(Index, (BYTE*) PageBuffer, PageSize);
					// Check if Atmel has finished the previous programming cycle
					while (!(GetStatus(Index) & READY)) { /* Wait */ }
					// Program the Flash from Buffer1
					if (Page & 1) SendSPICommand(Index, ProgramFromBuffer2 | (Page*PageSize), TRUE);
					else SendSPICommand(Index, ProgramFromBuffer1 | (Page*PageSize), TRUE);
				}
#endif
				
				// Now dump the data, 64KB at a time (Limited by FTDI protocol)
#if (DumpAtmel)
				int CurrentAddress, TransferLength, BytesWritten;
				FileName[7] = Index + '0';
				int Counter = 0;
				// Use standard C++ file functions since these are the same on Windows/OSX
				FileHandle = fopen(FileName, "w");
				if (FileHandle == NULL) return printf("ERROR: Could not create %s\n", FileName);
				CurrentAddress = StartAddress;
				while (!(GetStatus(Index) & READY)) { /* Wait */ }
				while (CurrentAddress < EndAddress) {
					if ((EndAddress - CurrentAddress) > 64*1024) TransferLength = 64*1024;
					else TransferLength = EndAddress - CurrentAddress;
					SendSPICommand(Index, ReadDirect | CurrentAddress, FALSE);
					ReadSPI(Index, Buffer, TransferLength);
					BytesWritten = fwrite(Buffer, 1, TransferLength, FileHandle);
					if (BytesWritten != TransferLength) return printf("\nERROR: write error on %s\n", FileName);
					else printf("\nCount = %d, %d bytes written to %s", Counter++, BytesWritten, FileName);
					CurrentAddress += TransferLength;
				}
				fclose(FileHandle);
#endif
				
			}
			InitializeLCD(Index);
			FT_Close(C->ftHandle);
		}
	}
	
	printf("\nDONE\n");
	return 0;
}

