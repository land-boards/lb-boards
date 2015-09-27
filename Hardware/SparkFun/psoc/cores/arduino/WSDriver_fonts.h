/* ========================================
 *
 * Copyright YOUR COMPANY, THE YEAR
 * All Rights Reserved
 * UNPUBLISHED, LICENSED SOFTWARE.
 *
 * CONFIDENTIAL AND PROPRIETARY INFORMATION
 * WHICH IS THE PROPERTY OF your company.
 *
 * ========================================
*/

/*  FONTS  */

#define WSDriver_FONT_5X7  0

/* 5x7 Font */
//#define WSDriver_Font5x7_COLS  5
//#define WSDriver_Font5x7_ROWS  7
#define WSDriver_Font5x7_XSIZE  5
#define WSDriver_Font5x7_YSIZE  7
#define WSDriver_Font5x7_OFFSET 32u
#define WSDriver_COLORWHEEL_FONT  0x80000000
#define WSDriver_TRANS_BG         0xFF000000


void WSDriver_SetFont( uint32 font);
void WSDriver_PutChar(int32 row, int32 col, uint8 theChar, uint32 fg, uint32 bg);
void WSDriver_PrintString(int32 row, int32 col, char * theString, uint32 fg, uint32 bg);

//[] END OF FILE
