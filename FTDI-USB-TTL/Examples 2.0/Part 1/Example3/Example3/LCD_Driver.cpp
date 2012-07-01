// LCD_Driver:	this modules bit-bangs and IO port to control a 'standard' LCD display
//
// (c) 2010, John Hyde, USB Design By Example
//
//
#include "stdafx.h"

// Describe the attachment of the LCD to the Port bits
#define LCD_RS	0x02
#define	LCD_RW	0x04
#define	LCD_E	0x08		// NOTE: Include a 10K ohm pull down on this line
// Databus D7..4 is on bits 7..4
#define LCD_Read	0x0F	// Bits 7..4 = input, 3..0 = output
#define LCD_Write	0xFF	// Bits 7..0 = output
// LCD Commands
#define LCD_ClearDisplay	0x001
#define LCD_ReturnHome		0x002
#define LCD_EntryModeSet	0x004
#define LCD_DisplayControl	0x008
#define	EnableDisplay		0x4
#define EnableCursor		0x2
#define	EnableBlink			0x1
#define LCD_ShiftControl	0x010
#define LCD_FunctionSet		0x020
#define EightBitBus			0x10
#define	TwoLine				0x8
#define	FiveByElevenFont	0x4
#define LCD_SetCGRAMAddr	0x040
#define LCD_SetDDRAMAddr	0x080
#define LCD_ReadWriteData	0x100

#define ChoosePort	0

extern void QByte(int Index, BYTE Value);
extern void SendBytes(int Index);

//					12345678901234567890
char Line1[21] = { "Hello from John Hyde" };
char Line2[21] = { "USB Design ByExample" };
char Line3[21] = { "I hope that you are " };
char Line4[21] = { "having fun with this" };

void SetByte(BYTE Data, BYTE Direction) {
// I set the High Byte of channel 'ChoosePort'
	QByte(ChoosePort, SetHighByte);
	QByte(ChoosePort, Data);
	QByte(ChoosePort, Direction);
	}

void SetDelay(WORD Value) {
// Data is being clocked out at 30MHz, I need 1usec intervals
	WORD Delay = Value*30;
	QByte(ChoosePort, WaitNBytes);
	QByte(ChoosePort, Delay & 0xFF);
	QByte(ChoosePort, Delay>>8);
	}

void WriteLCD(WORD Command) {
// Bytes are output at approx 5MHz, this is a 200nsec period that is OK for the display timing
	BYTE Data;
	if (Command & 0xFE00) printf("\nIllegal LCD Command = %4.4X\n", Command);
	else {
		if (Command & 0x100) Data = LCD_RS;
		else Data = 0;
		Data |= (Command & 0x0F0);		// Set D7..D4
		SetByte(Data, LCD_Read);		// But don't drive the databus yet
		SetByte(Data|LCD_E, LCD_Read);
		SetByte(Data|LCD_E, LCD_Write);	// Drive data lines
		SetByte(Data|LCD_E, LCD_Write);
		SetByte(Data, LCD_Write);		// Strobe in high nibble
		SetByte(Data, LCD_Write);
		SetByte(Data|LCD_E, LCD_Write);
		Data &= 0x0F;					// Clear data nibble
		Data |= ((Command<<4) & 0x0F0);
		SetByte(Data|LCD_E, LCD_Write);
		SetByte(Data|LCD_E, LCD_Write);
		SetByte(Data, LCD_Write);		// Strobe in low nibble
		SetByte(0xF0, LCD_Read);		// Float the databus
		SetDelay(45);					// Insert 45usec between commands
		}
	}

void SignOnLCD(void) {
// I have tested this up to a 4 line by 20 character display
	int i;
	for (i=0; i<20; i++) WriteLCD(LCD_ReadWriteData|Line1[i]);
	WriteLCD(LCD_SetDDRAMAddr|0x40);
	for (i=0; i<20; i++) WriteLCD(LCD_ReadWriteData|Line2[i]);
	WriteLCD(LCD_SetDDRAMAddr|0x14);
	for (i=0; i<20; i++) WriteLCD(LCD_ReadWriteData|Line3[i]);
	WriteLCD(LCD_SetDDRAMAddr|0x54);
	for (i=0; i<20; i++) WriteLCD(LCD_ReadWriteData|Line4[i]);
	SendBytes(ChoosePort);
	}

void InitializeLCD(int Index) {
	if (Index == ChoosePort) {
		SetByte(0, LCD_Read);			// Start all control lines low, float databus
		WriteLCD(LCD_FunctionSet|TwoLine|FiveByElevenFont);
		WriteLCD(LCD_DisplayControl|EnableDisplay);
		WriteLCD(LCD_ClearDisplay);
		SetDelay(1600);					// Insert 1.6 msec after a ClearDisplay
		SignOnLCD();
		}
	}

