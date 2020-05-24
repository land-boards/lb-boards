	.module main.c
	.area lit(rom, con, rel)
_SignOn::
	.byte 'P,'h,'o,'t,'o,'F,'r,'a,'m,'e,32,'V,48,46,51,0
	.dbfile ./main.c
	.dbsym e SignOn _SignOn A[16:16]c
_NoDrive::
	.byte 'N,'o,32,'F,'l,'a,'s,'h,32,'D,'r,'i,'v,'e,0
	.dbsym e NoDrive _NoDrive A[15:15]c
_NoFiles::
	.byte 'N,'o,32,46,'I,'M,'G,32,'f,'i,'l,'e,'s,32,0
	.dbsym e NoFiles _NoFiles A[15:15]c
_SetBaudRate::
	.byte 'S,'B,'D,32,24,0,0,13,0
	.dbsym e SetBaudRate _SetBaudRate A[9:9]c
_FileCommand::
	.byte 'D,'I,'R,32,48,48,48,46,'i,'m,'g,13,0
	.dbsym e FileCommand _FileCommand A[13:13]c
_MP3::
	.byte 'D,'I,'R,32,0,0,0,46,'m,'p,51,13,0
	.dbsym e MP3 _MP3 A[13:13]c
	.area text(rom, con, rel)
	.dbfile ./main.c
	.dbfunc e OneMillisecond_ISR _OneMillisecond_ISR fV
_OneMillisecond_ISR::
	.dbline -1
	push A
	mov A,[__r0]
	push A
	mov A,[__r1]
	push A
	.dbline 29
; //----------------------------------------------------------------------------
; // C main line
; //----------------------------------------------------------------------------
; 
; #include <m8c.h>        // part specific constants and macros
; #include "PSoCAPI.h"    // PSoC API definitions for all User Modules
; 
; #define CR				0x0D
; #define ACK				6
; #define VC3_Interrupt	0x80
; 
; typedef unsigned char bool;
; typedef unsigned char byte;
; typedef unsigned int word;
; 
; const byte SignOn[] = {"PhotoFrame V0.3"};
; const byte NoDrive[] = {"No Flash Drive"};
; const byte NoFiles[] = {"No .IMG files "};
; const byte SetBaudRate[] = {"SBD \30\0\0\r"}; // 30 octal = 24 decimal = 125000 baud
; const byte FileCommand[] = {"DIR 000.img\r"};
; const byte MP3[] = {"DIR \0\0\0.mp3\r"};
; byte InBuffer[32];
; byte OutBuffer[32];
; byte Index, Delay, CurrentUART;
; word PreScalar;
; long FileSize;
; 
; #pragma interrupt_handler OneMillisecond_ISR
; void OneMillisecond_ISR (void) {
	.dbline 31
; // This is clocked by VC3.  VCx values produce an 8KHz VC3 interrupt
; 	if (++PreScalar > 8000) {
	mov A,[_PreScalar+1]
	add A,1
	mov [__r1],A
	mov A,[_PreScalar]
	adc A,0
	mov [__r0],A
	mov [_PreScalar+1],[__r1]
	mov [_PreScalar],A
	mov A,64
	sub A,[__r1]
	mov A,31
	sbb A,[__r0]
	jnc L2
X0:
	.dbline 31
	.dbline 32
; 		PreScalar = 1;
	mov [_PreScalar+1],1
	mov [_PreScalar],0
	.dbline 33
; 		if (Delay) Delay--;
	cmp [_Delay],0
	jz L4
	.dbline 33
	dec [_Delay]
L4:
	.dbline 34
L2:
	.dbline -2
	.dbline 35
; 		}
; 	}
L1:
	pop A
	mov [__r1],A
	pop A
	mov [__r0],A
	pop A
	.dbline 0 ; func end
	reti
	.dbend
	.dbfunc e Wait _Wait fV
;        Seconds -> X-4
_Wait::
	.dbline -1
	push X
	mov X,SP
	.dbline 37
; 
; void Wait(byte Seconds) {
	.dbline 38
; 	PreScalar = 1;
	mov [_PreScalar+1],1
	mov [_PreScalar],0
	.dbline 39
; 	Delay = Seconds;
	mov A,[X-4]
	mov [_Delay],A
L7:
	.dbline 40
	.dbline 42
L8:
	.dbline 40
; 	while (Delay) {
	cmp [_Delay],0
	jnz L7
	.dbline -2
	.dbline 43
; // Wait, Delay is decremented in ISR
; 		}
; 	}
L6:
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l Seconds -4 c
	.dbend
	.dbfunc e SwitchUART _SwitchUART fV
;          Index -> X-4
_SwitchUART::
	.dbline -1
	push X
	mov X,SP
	.dbline 45
; 
; void SwitchUART(byte Index) {
	.dbline 47
; // Index = 0, switch to Vinculum; Index != 0, switch to Display
; 	if (Index == CurrentUART) return;
	mov A,[X-4]
	cmp A,[_CurrentUART]
	jnz L11
	.dbline 47
	xjmp L10
L11:
	.dbline 48
; 	UART_Stop();
	push X
	xcall _UART_Stop
	pop X
	.dbline 49
; 	if (Index) {
	cmp [X-4],0
	jz L13
	.dbline 49
	.dbline 50
; 		RDI0LT1 |= 0xf0;		// Set V_TX high
	or REG[0xb4],-16
	.dbline 51
; 		DCB03IN &= 0xef;		// RX input = D_RX
	or F,0x10  ; iopage = 1
	and REG[0x2d],-17
	and F,0xEF ; iopage = 0
	.dbline 52
; 		DCB02OU &= 0xfe;		// TX drives D_TX
	or F,0x10  ; iopage = 1
	and REG[0x2a],-2
	and F,0xEF ; iopage = 0
	.dbline 53
; 		RDI0LT1 &= 0xf3;		// D_TX drives IO
	and REG[0xb4],-13
	.dbline 54
; 		}
	xjmp L14
L13:
	.dbline 55
; 	else {
	.dbline 56
; 		RDI0LT1 |= 0x0f;		// Set D_TX high
	or REG[0xb4],15
	.dbline 57
; 		DCB03IN |= 0x10;		// RX input = V_RX
	or F,0x10  ; iopage = 1
	or REG[0x2d],16
	and F,0xEF ; iopage = 0
	.dbline 58
; 		DCB02OU |= 0x01;		// TX drives V_TX
	or F,0x10  ; iopage = 1
	or REG[0x2a],1
	and F,0xEF ; iopage = 0
	.dbline 59
; 		RDI0LT1 &= 0x3f;		// V_TX drives IO
	and REG[0xb4],63
	.dbline 60
; 		}
L14:
	.dbline 61
; 	CurrentUART = Index;
	mov A,[X-4]
	mov [_CurrentUART],A
	.dbline 62
; 	UART_Start(UART_PARITY_NONE);
	push X
	mov A,0
	xcall _UART_Start
	pop X
	.dbline -2
	.dbline 63
; 	}
L10:
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l Index -4 c
	.dbend
	.dbfunc e WriteVinculum _WriteVinculum fV
;          Index -> X+0
;         Length -> X-4
_WriteVinculum::
	.dbline -1
	push X
	mov X,SP
	add SP,1
	.dbline 65
; 	
; void WriteVinculum(byte Length) {
	.dbline 68
; 	byte Index;
; // Setup interconnect to access Vinculum
; 	SwitchUART(0);
	mov A,0
	push A
	xcall _SwitchUART
	add SP,-1
	.dbline 69
; 	Index = 0;
	mov [X+0],0
	.dbline 71
; // Allow for RD command, only 2 letters
; 	if (OutBuffer[0] == 0) Index = 1;
	cmp [_OutBuffer],0
	jnz L19
	.dbline 71
	mov [X+0],1
	xjmp L19
L18:
	.dbline 72
; 	while (Length--) {
	.dbline 73
; 		UART_PutChar(OutBuffer[Index++]);
	mov A,[X+0]
	mov [__r1],A
	mov [__r0],0
	add A,1
	mov [X+0],A
	add [__r1],<_OutBuffer
	adc [__r0],>_OutBuffer
	mvi A,[__r1]
	push X
	xcall _UART_PutChar
	pop X
L21:
	.dbline 75
	.dbline 75
L22:
	.dbline 75
	push X
	xcall _UART_bReadTxStatus
	pop X
	mov [__r0],A
	tst [__r0],32
	jz L21
	.dbline 76
L19:
	.dbline 72
	mov A,[X-4]
	mov [__r1],A
	mov [__r0],0
	sub A,1
	mov [X-4],A
	cmp [__r0],0
	jnz L18
	cmp [__r1],0
	jnz L18
X1:
	.dbline -2
	.dbline 77
; // Wait for character to be sent
; 		while (!(UART_bReadTxStatus() & UART_TX_COMPLETE)) { /* Wait */ }
; 		}
; 	}
L15:
	add SP,-1
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l Index 0 c
	.dbsym l Length -4 c
	.dbend
	.dbfunc e ReadVinculum _ReadVinculum fV
;          Index -> X+1
;      InputChar -> X+0
_ReadVinculum::
	.dbline -1
	push X
	mov X,SP
	add SP,2
	.dbline 79
; 
; void ReadVinculum(void) {
	.dbline 83
; 	byte Index;
; 	char InputChar;
; // Setup interconnect to access Vinculum
; 	SwitchUART(0);
	mov A,0
	push A
	xcall _SwitchUART
	add SP,-1
	.dbline 85
; // Collect characters until CR, skip first character if CR
; 	Index = 0;
	mov [X+1],0
	.dbline 87
; // But don't wait more than a second
; 	PreScalar = 0;
	mov [_PreScalar+1],0
	mov [_PreScalar],0
	.dbline 88
; 	Delay = 1;
	mov [_Delay],1
	.dbline 89
; 	InputChar = UART_cGetChar();
	push X
	xcall _UART_cGetChar
	pop X
	mov [X+0],A
	.dbline 90
; 	if (InputChar == CR) InputChar = UART_cGetChar();
	cmp [X+0],13
	jnz L28
	.dbline 90
	push X
	xcall _UART_cGetChar
	pop X
	mov [X+0],A
	xjmp L28
L27:
	.dbline 91
	.dbline 92
	mov A,[X+1]
	mov [__r1],A
	mov [__r0],0
	add A,1
	mov [X+1],A
	add [__r1],<_InBuffer
	adc [__r0],>_InBuffer
	mov A,[X+0]
	mvi [__r1],A
	.dbline 93
	push X
	xcall _UART_cGetChar
	pop X
	mov [X+0],A
	.dbline 94
L28:
	.dbline 91
; 	while ((InputChar != CR) && (Index<sizeof(InBuffer)) && Delay) {
	cmp [X+0],13
	jz L31
	cmp [X+1],32
	jnc L31
X2:
	cmp [_Delay],0
	jnz L27
L31:
	.dbline 95
; 		InBuffer[Index++] = InputChar;
; 		InputChar = UART_cGetChar();
; 		}
; 	InBuffer[Index] = CR;
	mov A,[X+1]
	mov [__r1],A
	mov [__r0],0
	add [__r1],<_InBuffer
	adc [__r0],>_InBuffer
	mov A,13
	mvi [__r1],A
	.dbline -2
	.dbline 96
; 	}
L24:
	add SP,-2
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l Index 1 c
	.dbsym l InputChar 0 c
	.dbend
	.dbfunc e WriteDisplay _WriteDisplay fV
;      InputChar -> X+0
;         Length -> X-4
_WriteDisplay::
	.dbline -1
	push X
	mov X,SP
	add SP,1
	.dbline 98
	.dbline 101
	mov A,1
	push A
	xcall _SwitchUART
	add SP,-1
	.dbline 102
	push X
	mov A,[X-4]
	push A
	mov A,>_OutBuffer
	push A
	mov A,<_OutBuffer
	push A
	xcall _UART_Write
	add SP,-3
	.dbline 103
	xcall _UART_cGetChar
	pop X
	mov [X+0],A
	.dbline 104
	cmp [X+0],6
	jz L33
	.dbline 104
	.dbline 106
	mov [_Index],0
	.dbline 107
L33:
	.dbline -2
	.dbline 108
; 
; void WriteDisplay(byte Length) {
; // Send command to display and wait for an ACK
; 	char InputChar;
; 	SwitchUART(1);
; 	UART_Write(&OutBuffer[0], Length);
; 	InputChar = UART_cGetChar();
; 	if (InputChar != ACK) {
; // Set a breakpoint here to check for errors
; 		Index = 0;
; 		}
; 	}
L32:
	add SP,-1
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l InputChar 0 c
	.dbsym l Length -4 c
	.dbend
	.dbfunc e InitializeVinculum _InitializeVinculum fV
;              i -> X+0
_InitializeVinculum::
	.dbline -1
	push X
	mov X,SP
	add SP,1
	.dbline 110
; 
; void InitializeVinculum(void) {
	.dbline 113
; 	byte i;
; // Vinculum can send a variety of messages depending upon the hardware configuration
; 	ReadVinculum();
	xcall _ReadVinculum
	.dbline 114
; 	OutBuffer[0] = 'E';		// Look for an echo
	mov [_OutBuffer],69
	.dbline 115
; 	OutBuffer[1] = CR;
	mov [_OutBuffer+1],13
	xjmp L38
L37:
	.dbline 116
	.dbline 117
	mov A,2
	push A
	xcall _WriteVinculum
	add SP,-1
	.dbline 118
	xcall _ReadVinculum
	.dbline 119
L38:
	.dbline 116
; 	while (InBuffer[0] != 'E') {
	cmp [_InBuffer],69
	jnz L37
	.dbline 121
	mov [X+0],0
	xjmp L43
L40:
	.dbline 121
	mov A,[X+0]
	mov [__r1],A
	mov [__r0],0
	add [__r1],<_SetBaudRate
	adc [__r0],>_SetBaudRate
	mov A,[__r0]
	push X
	mov X,[__r1]
	romx
	pop X
	mov [__r0],A
	mov A,[X+0]
	mov [__r3],A
	mov [__r2],0
	add [__r3],<_OutBuffer
	adc [__r2],>_OutBuffer
	mov A,[__r0]
	mvi [__r3],A
L41:
	.dbline 121
	inc [X+0]
L43:
	.dbline 121
; 		WriteVinculum(2);
; 		ReadVinculum();
; 		}
; // Set Vinculum baud rate to 125000
; 	for (i=0; i<sizeof(SetBaudRate); i++) OutBuffer[i] = SetBaudRate[i];
	cmp [X+0],9
	jc L40
X3:
	.dbline 122
; 	WriteVinculum(sizeof(SetBaudRate)-1);
	mov A,8
	push A
	xcall _WriteVinculum
	add SP,-1
	.dbline 123
; 	ReadVinculum();			// Vinculum returns a prompt immediately
	xcall _ReadVinculum
	.dbline -2
	.dbline 124
; 	}
L35:
	add SP,-1
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l i 0 c
	.dbend
	.dbfunc e InitializeDisplay _InitializeDisplay fV
;              i -> X+0
_InitializeDisplay::
	.dbline -1
	push X
	mov X,SP
	add SP,1
	.dbline 126
; 
; void InitializeDisplay(void) {
	.dbline 129
; 	byte i;
; // Set the Display baud rate to 125000
; 	OutBuffer[0] = 'U';
	mov [_OutBuffer],85
	.dbline 130
; 	WriteDisplay(1);
	mov A,1
	push A
	xcall _WriteDisplay
	.dbline 132
; // Clear the screen and write a Signon
; 	OutBuffer[0] = 'E';
	mov [_OutBuffer],69
	.dbline 133
; 	WriteDisplay(1);
	mov A,1
	push A
	xcall _WriteDisplay
	add SP,-2
	.dbline 134
; 	OutBuffer[0] = 'F';		// Choose medium font size
	mov [_OutBuffer],70
	.dbline 135
; 	OutBuffer[1] = 1;
	mov [_OutBuffer+1],1
	.dbline 136
; 	WriteDisplay(2);
	mov A,2
	push A
	xcall _WriteDisplay
	.dbline 137
; 	OutBuffer[0] = 'O';		// Set Opaque text
	mov [_OutBuffer],79
	.dbline 138
; 	WriteDisplay(2);
	mov A,2
	push A
	xcall _WriteDisplay
	add SP,-2
	.dbline 139
; 	OutBuffer[0] = 'T';
	mov [_OutBuffer],84
	.dbline 140
; 	OutBuffer[3] = 0;		// Row
	mov [_OutBuffer+3],0
	.dbline 141
; 	OutBuffer[4] = 0;		// High byte of Blue
	mov [_OutBuffer+4],0
	.dbline 142
; 	OutBuffer[5] = 0x1F;	// Low byte of Blue
	mov [_OutBuffer+5],31
	.dbline 143
	mov [X+0],0
	xjmp L52
L49:
	.dbline 143
	.dbline 144
	mov A,[X+0]
	mov [__r1],A
	mov [__r0],0
	add [__r1],<_SignOn
	adc [__r0],>_SignOn
	mov A,[__r0]
	push X
	mov X,[__r1]
	romx
	pop X
	mov [_OutBuffer+1],A
	.dbline 145
	mov A,[X+0]
	mov [_OutBuffer+2],A
	.dbline 146
	mov A,6
	push A
	xcall _WriteDisplay
	add SP,-1
	.dbline 147
L50:
	.dbline 143
	inc [X+0]
L52:
	.dbline 143
; 	for (i=0; i<sizeof(SignOn)-1; i++) {
	cmp [X+0],15
	jc L49
X4:
	.dbline -2
	.dbline 148
; 		OutBuffer[1] = SignOn[i];
; 		OutBuffer[2] = i;	// Column
; 		WriteDisplay(6);
; 		}
; 	}
L44:
	add SP,-1
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l i 0 c
	.dbend
	.dbfunc e ReconfigureUART _ReconfigureUART fV
_ReconfigureUART::
	.dbline -1
	.dbline 150
; 
; void ReconfigureUART(void) {
	.dbline 151
; 	UART_Stop();
	push X
	xcall _UART_Stop
	pop X
	.dbline 153
; // Now reset my UART baudrate to 125000, change the UART clock from VC3 to VC2
; 	DCB02IN = (DCB02IN & 0xf0) | 6;		// VC3 = 1, VC2 = 6
	or F,0x10  ; iopage = 1
	mov A,REG[0x29]
	mov [__r0],A
	and F,0xEF ; iopage = 0
	and [__r0],-16
	or [__r0],6
	or F,0x10  ; iopage = 1
	mov A,[__r0]
	mov REG[0x29],A
	and F,0xEF ; iopage = 0
	.dbline 154
; 	DCB03IN = (DCB03IN & 0xf0) | 6;		// RX too
	or F,0x10  ; iopage = 1
	mov A,REG[0x2d]
	mov [__r0],A
	and F,0xEF ; iopage = 0
	and [__r0],-16
	or [__r0],6
	or F,0x10  ; iopage = 1
	mov A,[__r0]
	mov REG[0x2d],A
	and F,0xEF ; iopage = 0
	.dbline 155
; 	UART_Start(UART_PARITY_NONE);
	push X
	mov A,0
	xcall _UART_Start
	pop X
	.dbline 157
; // Setup VC3 so that it now overflows at 8KHz
; 	OSC_CR3 = 250;		// VC3 divider
	or F,0x10  ; iopage = 1
	mov REG[0xdf],-6
	and F,0xEF ; iopage = 0
	.dbline -2
	.dbline 158
; 	}
L55:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Display_NoDrive _Display_NoDrive fV
;              i -> X+0
_Display_NoDrive::
	.dbline -1
	push X
	mov X,SP
	add SP,1
	.dbline 160
; 
; void Display_NoDrive(void) {
	.dbline 162
; 	byte i;
; 	InitializeDisplay();
	xcall _InitializeDisplay
	.dbline 163
; 	OutBuffer[0] = 'T';
	mov [_OutBuffer],84
	.dbline 164
; 	OutBuffer[3] = 5;		// Row
	mov [_OutBuffer+3],5
	.dbline 165
; 	OutBuffer[4] = 0xF8;	// High byte of Red
	mov [_OutBuffer+4],-8
	.dbline 166
; 	OutBuffer[5] = 0;		// Low byte of Red
	mov [_OutBuffer+5],0
	.dbline 167
	mov [X+0],0
	xjmp L63
L60:
	.dbline 167
	.dbline 168
	mov A,[X+0]
	mov [__r1],A
	mov [__r0],0
	add [__r1],<_NoDrive
	adc [__r0],>_NoDrive
	mov A,[__r0]
	push X
	mov X,[__r1]
	romx
	pop X
	mov [_OutBuffer+1],A
	.dbline 169
	mov A,[X+0]
	mov [_OutBuffer+2],A
	.dbline 170
	mov A,6
	push A
	xcall _WriteDisplay
	add SP,-1
	.dbline 171
L61:
	.dbline 167
	inc [X+0]
L63:
	.dbline 167
; 	for (i=0; i<sizeof(NoDrive)-1; i++) {
	cmp [X+0],14
	jc L60
X5:
	.dbline 172
; 		OutBuffer[1] = NoDrive[i];
; 		OutBuffer[2] = i;
; 		WriteDisplay(6);
; 		}
; 	Wait(2);		// User will insert a drive or power off
	mov A,2
	push A
	xcall _Wait
	add SP,-1
	.dbline 173
; 	Index = 0;		// Reset the file pointer
	mov [_Index],0
	.dbline -2
	.dbline 174
; 	}
L56:
	add SP,-1
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l i 0 c
	.dbend
	.dbfunc e Display_NoFiles _Display_NoFiles fV
;              i -> X+0
_Display_NoFiles::
	.dbline -1
	push X
	mov X,SP
	add SP,1
	.dbline 176
; 
; void Display_NoFiles(void) {
	.dbline 178
; 	byte i;
; 	InitializeDisplay();
	xcall _InitializeDisplay
	.dbline 179
; 	OutBuffer[0] = 'T';
	mov [_OutBuffer],84
	.dbline 180
; 	OutBuffer[3] = 7;		// Row
	mov [_OutBuffer+3],7
	.dbline 181
; 	OutBuffer[4] = 7;		// High byte of Green
	mov [_OutBuffer+4],7
	.dbline 182
; 	OutBuffer[5] = 0xE0;	// Low byte of Green
	mov [_OutBuffer+5],-32
	.dbline 183
	mov [X+0],0
	xjmp L73
L70:
	.dbline 183
	.dbline 184
	mov A,[X+0]
	mov [__r1],A
	mov [__r0],0
	add [__r1],<_NoFiles
	adc [__r0],>_NoFiles
	mov A,[__r0]
	push X
	mov X,[__r1]
	romx
	pop X
	mov [_OutBuffer+1],A
	.dbline 185
	mov A,[X+0]
	mov [_OutBuffer+2],A
	.dbline 186
	mov A,6
	push A
	xcall _WriteDisplay
	add SP,-1
	.dbline 187
L71:
	.dbline 183
	inc [X+0]
L73:
	.dbline 183
; 	for (i=0; i<sizeof(NoFiles)-1; i++) {
	cmp [X+0],14
	jc L70
X6:
	.dbline -2
	.dbline 188
; 		OutBuffer[1] = NoFiles[i];
; 		OutBuffer[2] = i;
; 		WriteDisplay(6);
; 		}
; 	}
L66:
	add SP,-1
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l i 0 c
	.dbend
	.dbfunc e ConvertToASCII _ConvertToASCII fV
;              T -> X+1
;              H -> X+0
;          Value -> X-4
_ConvertToASCII::
	.dbline -1
	push X
	mov X,SP
	add SP,2
	.dbline 189
; void ConvertToASCII(byte Value) {
	.dbline 191
; 	byte H, T;
; 	H = Value/100;
	mov A,100
	push A
	mov A,[X-4]
	push A
	xcall __divmodu_8X8_8
	pop A
	mov [X+0],A
	add SP,-1
	.dbline 192
; 	Value -= H * 100;
	mov A,[X+0]
	mov REG[0xe8],A
	mov REG[0xe9],100
	nop
	mov A,REG[0xeb]
	mov [__r0],A
	mov A,[X-4]
	sub A,[__r0]
	mov [X-4],A
	.dbline 193
; 	T = Value/10;
	mov A,10
	push A
	mov A,[X-4]
	push A
	xcall __divmodu_8X8_8
	pop A
	mov [X+1],A
	add SP,-1
	.dbline 194
; 	Value -= T * 10;
	mov A,[X+1]
	mov REG[0xe8],A
	mov REG[0xe9],10
	nop
	mov A,REG[0xeb]
	mov [__r0],A
	mov A,[X-4]
	sub A,[__r0]
	mov [X-4],A
	.dbline 195
; 	OutBuffer[4] = H + '0';
	mov A,[X+0]
	add A,48
	mov [_OutBuffer+4],A
	.dbline 196
; 	OutBuffer[5] = T + '0';
	mov A,[X+1]
	add A,48
	mov [_OutBuffer+5],A
	.dbline 197
; 	OutBuffer[6] = Value + '0';
	mov A,[X-4]
	add A,48
	mov [_OutBuffer+6],A
	.dbline -2
	.dbline 198
; 	}
L76:
	add SP,-2
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l T 1 c
	.dbsym l H 0 c
	.dbsym l Value -4 c
	.dbend
	.dbfunc e main _main fV
;              i -> X+0
_main::
	.dbline -1
	push X
	mov X,SP
	add SP,1
	.dbline 200
; 
; void main() {
	.dbline 204
; 	byte i;
; // UART is initially connected to the Vinculum
; // UART is initially set to 9600 baud to match Vinculum's power-on value
; 	UART_Start(UART_PARITY_NONE);
	push X
	mov A,0
	xcall _UART_Start
	pop X
	.dbline 205
; 	InitializeVinculum();
	xcall _InitializeVinculum
	.dbline 206
; 	ReconfigureUART();
	xcall _ReconfigureUART
	.dbline 207
; 	InitializeDisplay();
	xcall _InitializeDisplay
	.dbline 209
; // Wait for Vinculum to be ready
; 	ReadVinculum();				// Vinculum will send another prompt at new baud rate
	xcall _ReadVinculum
	.dbline 210
; 	INT_MSK0 |= VC3_Interrupt;	// Enable for Wait/Delay function
	or REG[0xe0],-128
	.dbline 211
; 	M8C_EnableGInt;				// This is the first time that they have been enabled
		or  F, 01h

	xjmp L82
L81:
	.dbline 213
; // Initialization complete, enter the main loop
; 	while (1) {
	.dbline 215
; // Check if a flash drive is present, Vinculum responds with a prompt (=yes) or 'No Disk' (=no)
; 		OutBuffer[0] = CR;
	mov [_OutBuffer],13
	.dbline 216
; 		WriteVinculum(1);
	mov A,1
	push A
	xcall _WriteVinculum
	add SP,-1
	.dbline 217
; 		ReadVinculum();
	xcall _ReadVinculum
	.dbline 218
; 		if (InBuffer[0] == 'N') Display_NoDrive();
	cmp [_InBuffer],78
	jnz L84
	.dbline 218
	xcall _Display_NoDrive
	xjmp L85
L84:
	.dbline 219
; 		else {
	.dbline 221
	mov [X+0],0
	xjmp L89
L86:
	.dbline 221
	mov A,[X+0]
	mov [__r1],A
	mov [__r0],0
	add [__r1],<_FileCommand
	adc [__r0],>_FileCommand
	mov A,[__r0]
	push X
	mov X,[__r1]
	romx
	pop X
	mov [__r0],A
	mov A,[X+0]
	mov [__r3],A
	mov [__r2],0
	add [__r3],<_OutBuffer
	adc [__r2],>_OutBuffer
	mov A,[__r0]
	mvi [__r3],A
L87:
	.dbline 221
	inc [X+0]
L89:
	.dbline 221
; // Check if <index>.img is present using 'DIR <index>.img'
; 			for (i=0; i<sizeof(FileCommand); i++) OutBuffer[i] = FileCommand[i];
	cmp [X+0],13
	jc L86
X8:
	.dbline 222
; 			ConvertToASCII(++Index);
	add [_Index],1
	mov A,[_Index]
	push A
	xcall _ConvertToASCII
	.dbline 223
; 			WriteVinculum(sizeof(FileCommand)-1);
	mov A,12
	push A
	xcall _WriteVinculum
	add SP,-2
	.dbline 224
; 			ReadVinculum();
	xcall _ReadVinculum
	.dbline 226
; // Vinculum responds with "<index>.img <size>" if file is present
; 			if (InBuffer[0] == OutBuffer[4]) {
	mov A,[_InBuffer]
	cmp A,[_OutBuffer+4]
	jnz L90
	.dbline 226
	.dbline 229
; // .img file is present, get its size and copy it to the display
; // Note that PSoC is Big Endian, size is in Little Endian
; 				FileSize = InBuffer[10];
	mov [_FileSize+3],[_InBuffer+10]
	mov [_FileSize+2],0
	mov [_FileSize+1],0
	mov [_FileSize],0
	.dbline 230
; 				FileSize = InBuffer[8] + (InBuffer[9]<<8) + (FileSize<<16) + 1;
	mov [__r0],[_FileSize]
	mov [__r1],[_FileSize+1]
	mov [__r2],[_FileSize+2]
	mov [__r3],[_FileSize+3]
	mov A,16
X9:
	asl [__r3]
	rlc [__r2]
	rlc [__r1]
	rlc [__r0]
	dec A
	jnz X9
	mov [__r4],[_InBuffer+9]
	mov [__r5],0
	mov A,[_InBuffer+8]
	add A,[__r5]
	mov [__r5],A
	mov A,0
	adc A,[__r4]
	mov [__r7],[__r5]
	mov [__r6],A
	tst [__r6],-128
	jz X10
	mov [__r5],-1
	mov [__r4],-1
	jmp X11
X10:
	mov [__r5],0
	mov [__r4],0
X11:
	mov A,[__r7]
	add A,[__r3]
	mov [__r3],A
	mov A,[__r6]
	adc A,[__r2]
	mov [__r2],A
	mov A,[__r5]
	adc A,[__r1]
	mov [__r1],A
	mov A,[__r4]
	adc A,[__r0]
	mov [__r0],A
	mov A,[__r3]
	add A,1
	mov [_FileSize+3],A
	mov A,[__r2]
	adc A,0
	mov [_FileSize+2],A
	mov A,[__r1]
	adc A,0
	mov [_FileSize+1],A
	mov A,[__r0]
	adc A,0
	mov [_FileSize],A
	.dbline 231
; 				OutBuffer[0] = 0;
	mov [_OutBuffer],0
	.dbline 232
; 				OutBuffer[1] = 'R';
	mov [_OutBuffer+1],82
	.dbline 233
; 				OutBuffer[2] = 'D';
	mov [_OutBuffer+2],68
	.dbline 234
; 				WriteVinculum(sizeof(FileCommand)-2);
	mov A,11
	push A
	xcall _WriteVinculum
	add SP,-1
	.dbline 236
; // Change to data passthrough: data from Vinculum goes directly to Display
; 				DCB03OU  = 6;			// Enable RXout
	or F,0x10  ; iopage = 1
	mov REG[0x2e],6
	and F,0xEF ; iopage = 0
	.dbline 237
; 				RDI0LT1 &= 0xf3;		// RXout drives D_TX
	and REG[0xb4],-13
	xjmp L99
L98:
	.dbline 240
	push X
	xcall _UART_cGetChar
	pop X
L99:
	.dbline 240
; // Note that the ap will hang if the Flash Drive is removed during this file read
; // Allow for this in the next version
; 				while (FileSize--) UART_cGetChar();
	mov [__r0],[_FileSize]
	mov [__r1],[_FileSize+1]
	mov [__r2],[_FileSize+2]
	mov [__r3],[_FileSize+3]
	sub [_FileSize+3],1
	mov A,[__r2]
	sbb A,0
	mov [_FileSize+2],A
	mov A,[__r1]
	sbb A,0
	mov [_FileSize+1],A
	mov A,[__r0]
	sbb A,0
	mov [_FileSize],A
	cmp [__r0],0
	jnz L98
	cmp [__r1],0
	jnz L98
	cmp [__r2],0
	jnz L98
	cmp [__r3],0
	jnz L98
X12:
	.dbline 242
; // Now switch back
; 				DCB03OU  = 0;			// Disable RXout
	or F,0x10  ; iopage = 1
	mov REG[0x2e],0
	and F,0xEF ; iopage = 0
	.dbline 243
; 				RDI0LT1 |= 0x0f;		// Set D_TX high
	or REG[0xb4],15
	.dbline 244
; 				ReadVinculum();
	xcall _ReadVinculum
	.dbline 246
	mov [X+0],0
	xjmp L104
L101:
	.dbline 246
; // Now check if an MP3 file is present
; 				for (i=0; i<sizeof(MP3); i++) if (MP3[i]) OutBuffer[i] = MP3[i];
	mov A,[X+0]
	mov [__r1],A
	mov [__r0],0
	add [__r1],<_MP3
	adc [__r0],>_MP3
	mov A,[__r0]
	push X
	mov X,[__r1]
	romx
	pop X
	cmp A,0
	jz L105
	.dbline 246
	mov A,[X+0]
	mov [__r1],A
	mov [__r0],0
	add [__r1],<_MP3
	adc [__r0],>_MP3
	mov A,[__r0]
	push X
	mov X,[__r1]
	romx
	pop X
	mov [__r0],A
	mov A,[X+0]
	mov [__r3],A
	mov [__r2],0
	add [__r3],<_OutBuffer
	adc [__r2],>_OutBuffer
	mov A,[__r0]
	mvi [__r3],A
L105:
L102:
	.dbline 246
	inc [X+0]
L104:
	.dbline 246
	cmp [X+0],13
	jc L101
X13:
	.dbline 247
; 				WriteVinculum(sizeof(FileCommand)-1);
	mov A,12
	push A
	xcall _WriteVinculum
	add SP,-1
	.dbline 248
; 				ReadVinculum();
	xcall _ReadVinculum
	.dbline 249
; 				if (OutBuffer[4] == InBuffer[0]) {
	mov A,[_OutBuffer+4]
	cmp A,[_InBuffer]
	jnz L107
	.dbline 249
	.dbline 251
; // MP3 file is present, play it
; 					OutBuffer[0] = 'V';
	mov [_OutBuffer],86
	.dbline 252
; 					OutBuffer[1] = 'P';
	mov [_OutBuffer+1],80
	.dbline 253
; 					OutBuffer[2] = 'F';
	mov [_OutBuffer+2],70
	.dbline 254
; 					WriteVinculum(sizeof(FileCommand)-1);
	mov A,12
	push A
	xcall _WriteVinculum
	add SP,-1
	.dbline 258
; // Disable timeout while the MP3 file plays
; // If the flash drive is removed while the file is playing the ap will hang.
; // Fix this in the next version, reset the system for now
; 					INT_MSK0 &= ~VC3_Interrupt;
	and REG[0xe0],127
	.dbline 259
; 					ReadVinculum();
	xcall _ReadVinculum
	.dbline 260
; 					INT_MSK0 |= VC3_Interrupt;
	or REG[0xe0],-128
	.dbline 261
; 					}
	xjmp L91
L107:
	.dbline 262
; 				else Wait(60);		// Display picture for one minute if no MP3 file
	mov A,60
	push A
	xcall _Wait
	add SP,-1
	.dbline 263
; 				}
	xjmp L91
L90:
	.dbline 264
; 			else {
	.dbline 266
; // Check the special case of no .img files
; 				if (Index == 1) Display_NoFiles();
	cmp [_Index],1
	jnz L112
	.dbline 266
	xcall _Display_NoFiles
L112:
	.dbline 267
; 				Wait(2);
	mov A,2
	push A
	xcall _Wait
	add SP,-1
	.dbline 268
; 				Index = 0;			// At end of files, start again
	mov [_Index],0
	.dbline 269
; 				}
L91:
	.dbline 270
; 			}
L85:
	.dbline 271
L82:
	.dbline 213
	xjmp L81
X7:
	.dbline -2
	.dbline 272
; 		}
; 	}
L80:
	add SP,-1
	pop X
	.dbline 0 ; func end
	jmp .
	.dbsym l i 0 c
	.dbend
	.area bss(ram, con, rel)
	.dbfile ./main.c
_FileSize::
	.blkb 4
	.dbsym e FileSize _FileSize L
_PreScalar::
	.blkb 2
	.dbsym e PreScalar _PreScalar i
_CurrentUART::
	.blkb 1
	.dbsym e CurrentUART _CurrentUART c
_Delay::
	.blkb 1
	.dbsym e Delay _Delay c
_Index::
	.blkb 1
	.dbsym e Index _Index c
_OutBuffer::
	.blkb 32
	.dbsym e OutBuffer _OutBuffer A[32:32]c
_InBuffer::
	.blkb 32
	.dbsym e InBuffer _InBuffer A[32:32]c
