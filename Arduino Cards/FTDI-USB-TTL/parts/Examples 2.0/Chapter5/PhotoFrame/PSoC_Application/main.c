//----------------------------------------------------------------------------
// C main line
//----------------------------------------------------------------------------

#include <m8c.h>        // part specific constants and macros
#include "PSoCAPI.h"    // PSoC API definitions for all User Modules

#define CR				0x0D
#define ACK				6
#define VC3_Interrupt	0x80

typedef unsigned char bool;
typedef unsigned char byte;
typedef unsigned int word;

const byte SignOn[] = {"PhotoFrame V0.3"};
const byte NoDrive[] = {"No Flash Drive"};
const byte NoFiles[] = {"No .IMG files "};
const byte SetBaudRate[] = {"SBD \30\0\0\r"}; // 30 octal = 24 decimal = 125000 baud
const byte FileCommand[] = {"DIR 000.img\r"};
const byte MP3[] = {"DIR \0\0\0.mp3\r"};
byte InBuffer[32];
byte OutBuffer[32];
byte Index, Delay, CurrentUART;
word PreScalar;
long FileSize;

#pragma interrupt_handler OneMillisecond_ISR
void OneMillisecond_ISR (void) {
// This is clocked by VC3.  VCx values produce an 8KHz VC3 interrupt
	if (++PreScalar > 8000) {
		PreScalar = 1;
		if (Delay) Delay--;
		}
	}

void Wait(byte Seconds) {
	PreScalar = 1;
	Delay = Seconds;
	while (Delay) {
// Wait, Delay is decremented in ISR
		}
	}

void SwitchUART(byte Index) {
// Index = 0, switch to Vinculum; Index != 0, switch to Display
	if (Index == CurrentUART) return;
	UART_Stop();
	if (Index) {
		RDI0LT1 |= 0xf0;		// Set V_TX high
		DCB03IN &= 0xef;		// RX input = D_RX
		DCB02OU &= 0xfe;		// TX drives D_TX
		RDI0LT1 &= 0xf3;		// D_TX drives IO
		}
	else {
		RDI0LT1 |= 0x0f;		// Set D_TX high
		DCB03IN |= 0x10;		// RX input = V_RX
		DCB02OU |= 0x01;		// TX drives V_TX
		RDI0LT1 &= 0x3f;		// V_TX drives IO
		}
	CurrentUART = Index;
	UART_Start(UART_PARITY_NONE);
	}
	
void WriteVinculum(byte Length) {
	byte Index;
// Setup interconnect to access Vinculum
	SwitchUART(0);
	Index = 0;
// Allow for RD command, only 2 letters
	if (OutBuffer[0] == 0) Index = 1;
	while (Length--) {
		UART_PutChar(OutBuffer[Index++]);
// Wait for character to be sent
		while (!(UART_bReadTxStatus() & UART_TX_COMPLETE)) { /* Wait */ }
		}
	}

void ReadVinculum(void) {
	byte Index;
	char InputChar;
// Setup interconnect to access Vinculum
	SwitchUART(0);
// Collect characters until CR, skip first character if CR
	Index = 0;
// But don't wait more than a second
	PreScalar = 0;
	Delay = 1;
	InputChar = UART_cGetChar();
	if (InputChar == CR) InputChar = UART_cGetChar();
	while ((InputChar != CR) && (Index<sizeof(InBuffer)) && Delay) {
		InBuffer[Index++] = InputChar;
		InputChar = UART_cGetChar();
		}
	InBuffer[Index] = CR;
	}

void WriteDisplay(byte Length) {
// Send command to display and wait for an ACK
	char InputChar;
	SwitchUART(1);
	UART_Write(&OutBuffer[0], Length);
	InputChar = UART_cGetChar();
	if (InputChar != ACK) {
// Set a breakpoint here to check for errors
		Index = 0;
		}
	}

void InitializeVinculum(void) {
	byte i;
// Vinculum can send a variety of messages depending upon the hardware configuration
	ReadVinculum();
	OutBuffer[0] = 'E';		// Look for an echo
	OutBuffer[1] = CR;
	while (InBuffer[0] != 'E') {
		WriteVinculum(2);
		ReadVinculum();
		}
// Set Vinculum baud rate to 125000
	for (i=0; i<sizeof(SetBaudRate); i++) OutBuffer[i] = SetBaudRate[i];
	WriteVinculum(sizeof(SetBaudRate)-1);
	ReadVinculum();			// Vinculum returns a prompt immediately
	}

void InitializeDisplay(void) {
	byte i;
// Set the Display baud rate to 125000
	OutBuffer[0] = 'U';
	WriteDisplay(1);
// Clear the screen and write a Signon
	OutBuffer[0] = 'E';
	WriteDisplay(1);
	OutBuffer[0] = 'F';		// Choose medium font size
	OutBuffer[1] = 1;
	WriteDisplay(2);
	OutBuffer[0] = 'O';		// Set Opaque text
	WriteDisplay(2);
	OutBuffer[0] = 'T';
	OutBuffer[3] = 0;		// Row
	OutBuffer[4] = 0;		// High byte of Blue
	OutBuffer[5] = 0x1F;	// Low byte of Blue
	for (i=0; i<sizeof(SignOn)-1; i++) {
		OutBuffer[1] = SignOn[i];
		OutBuffer[2] = i;	// Column
		WriteDisplay(6);
		}
	}

void ReconfigureUART(void) {
	UART_Stop();
// Now reset my UART baudrate to 125000, change the UART clock from VC3 to VC2
	DCB02IN = (DCB02IN & 0xf0) | 6;		// VC3 = 1, VC2 = 6
	DCB03IN = (DCB03IN & 0xf0) | 6;		// RX too
	UART_Start(UART_PARITY_NONE);
// Setup VC3 so that it now overflows at 8KHz
	OSC_CR3 = 250;		// VC3 divider
	}

void Display_NoDrive(void) {
	byte i;
	InitializeDisplay();
	OutBuffer[0] = 'T';
	OutBuffer[3] = 5;		// Row
	OutBuffer[4] = 0xF8;	// High byte of Red
	OutBuffer[5] = 0;		// Low byte of Red
	for (i=0; i<sizeof(NoDrive)-1; i++) {
		OutBuffer[1] = NoDrive[i];
		OutBuffer[2] = i;
		WriteDisplay(6);
		}
	Wait(2);		// User will insert a drive or power off
	Index = 0;		// Reset the file pointer
	}

void Display_NoFiles(void) {
	byte i;
	InitializeDisplay();
	OutBuffer[0] = 'T';
	OutBuffer[3] = 7;		// Row
	OutBuffer[4] = 7;		// High byte of Green
	OutBuffer[5] = 0xE0;	// Low byte of Green
	for (i=0; i<sizeof(NoFiles)-1; i++) {
		OutBuffer[1] = NoFiles[i];
		OutBuffer[2] = i;
		WriteDisplay(6);
		}
	}
void ConvertToASCII(byte Value) {
	byte H, T;
	H = Value/100;
	Value -= H * 100;
	T = Value/10;
	Value -= T * 10;
	OutBuffer[4] = H + '0';
	OutBuffer[5] = T + '0';
	OutBuffer[6] = Value + '0';
	}

void main() {
	byte i;
// UART is initially connected to the Vinculum
// UART is initially set to 9600 baud to match Vinculum's power-on value
	UART_Start(UART_PARITY_NONE);
	InitializeVinculum();
	ReconfigureUART();
	InitializeDisplay();
// Wait for Vinculum to be ready
	ReadVinculum();				// Vinculum will send another prompt at new baud rate
	INT_MSK0 |= VC3_Interrupt;	// Enable for Wait/Delay function
	M8C_EnableGInt;				// This is the first time that they have been enabled
// Initialization complete, enter the main loop
	while (1) {
// Check if a flash drive is present, Vinculum responds with a prompt (=yes) or 'No Disk' (=no)
		OutBuffer[0] = CR;
		WriteVinculum(1);
		ReadVinculum();
		if (InBuffer[0] == 'N') Display_NoDrive();
		else {
// Check if <index>.img is present using 'DIR <index>.img'
			for (i=0; i<sizeof(FileCommand); i++) OutBuffer[i] = FileCommand[i];
			ConvertToASCII(++Index);
			WriteVinculum(sizeof(FileCommand)-1);
			ReadVinculum();
// Vinculum responds with "<index>.img <size>" if file is present
			if (InBuffer[0] == OutBuffer[4]) {
// .img file is present, get its size and copy it to the display
// Note that PSoC is Big Endian, size is in Little Endian
				FileSize = InBuffer[10];
				FileSize = InBuffer[8] + (InBuffer[9]<<8) + (FileSize<<16) + 1;
				OutBuffer[0] = 0;
				OutBuffer[1] = 'R';
				OutBuffer[2] = 'D';
				WriteVinculum(sizeof(FileCommand)-2);
// Change to data passthrough: data from Vinculum goes directly to Display
				DCB03OU  = 6;			// Enable RXout
				RDI0LT1 &= 0xf3;		// RXout drives D_TX
// Note that the ap will hang if the Flash Drive is removed during this file read
// Allow for this in the next version
				while (FileSize--) UART_cGetChar();
// Now switch back
				DCB03OU  = 0;			// Disable RXout
				RDI0LT1 |= 0x0f;		// Set D_TX high
				ReadVinculum();
// Now check if an MP3 file is present
				for (i=0; i<sizeof(MP3); i++) if (MP3[i]) OutBuffer[i] = MP3[i];
				WriteVinculum(sizeof(FileCommand)-1);
				ReadVinculum();
				if (OutBuffer[4] == InBuffer[0]) {
// MP3 file is present, play it
					OutBuffer[0] = 'V';
					OutBuffer[1] = 'P';
					OutBuffer[2] = 'F';
					WriteVinculum(sizeof(FileCommand)-1);
// Disable timeout while the MP3 file plays
// If the flash drive is removed while the file is playing the ap will hang.
// Fix this in the next version, reset the system for now
					INT_MSK0 &= ~VC3_Interrupt;
					ReadVinculum();
					INT_MSK0 |= VC3_Interrupt;
					}
				else Wait(60);		// Display picture for one minute if no MP3 file
				}
			else {
// Check the special case of no .img files
				if (Index == 1) Display_NoFiles();
				Wait(2);
				Index = 0;			// At end of files, start again
				}
			}
		}
	}
