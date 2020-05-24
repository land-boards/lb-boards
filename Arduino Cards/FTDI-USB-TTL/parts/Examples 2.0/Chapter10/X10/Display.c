/*
** Display.c  - Displays text and variables
**
** Author:  John Hyde, USB Design By Example
*/

#include "main.h"

extern VOS_HANDLE hDevice[NUMBER_OF_DEVICES];
extern vos_mutex_t dprintLock;

BYTE LocalBuffer[128];
WORD BufferIndex;
rom char ASCII[] = "0123456789abcdef";

void DisplayChar(BYTE Character) {
    if (Character) {
        LocalBuffer[BufferIndex] = Character;
        if (BufferIndex < (sizeof(LocalBuffer)-1)) BufferIndex++;
        }
    }

void DisplayHex(BYTE Value) {
    DisplayChar(ASCII[Value >> 4]);
    DisplayChar(ASCII[Value & 15]);
    }

void DisplayDecimal(WORD Value) {
// Convert Value to Digits for printing
    BYTE Digits[5];        // Maximum is 64K
    BYTE i;
    for (i=0; i<sizeof(Digits); i++) {
        Digits[i] = Value % 10;
        Value = (Value - Digits[i])/10;
        }
// Supress leading 0's.  Note ASCII[16] = 0
    for (i=sizeof(Digits)-1; i>0; i--) {
        if (Digits[i]) break;
        else Digits[i] = 16;
        }
    for (i=sizeof(Digits); i>0; i--) {
        BYTE Temp = Digits[i-1];
        DisplayChar(ASCII[Temp]);
        }
    }

BOOL dprint(BYTE* StringPtr, void* DataPtr) {
// dprint is modelled after printf but can only take one parameter
// stringptr points to a format string that can include one of the following
// %d - void* points to a byte that is printed in decimal (0..255)
// %D - void* points to a word that is printed in decimal (0..65,535)
// %x - void* points to a byte that is printed in hex (0x00..0xFF)
// %X - void* points to a word that is printed in hex (0x0000..0xFFFF)
// %c - void* points to a single ASCII character
// %s - void* points to a 0-terminated string
    BYTE* BytePtr = (BYTE*) DataPtr;
// dprint can be called from multiple threads, so use a mutex to keep output from a single dprint() together
    vos_lock_mutex(&dprintLock);
    BufferIndex = 0;
    while (*StringPtr) {
        if (*StringPtr == '%') {
            switch (*(++StringPtr)) {
                case 'd': DisplayDecimal((WORD)*BytePtr); break;
                case 'D': DisplayDecimal(*(WORD*) DataPtr); break;
                case 'x': DisplayHex(*BytePtr); break;
                case 'X': DisplayHex(*(++BytePtr)); DisplayHex(*(--BytePtr)); break;    // Little endian
                case 'c': DisplayChar(*BytePtr); break;
                case 'S':
                case 's': while (*BytePtr) DisplayChar(*BytePtr++); break;
                case '%': DisplayChar('%'); break;
                default:  DisplayChar(*StringPtr); DisplayChar('?'); break;
                }
            StringPtr++;
            }
        else DisplayChar(*StringPtr++);
        }
    vos_dev_write(hDevice[UART], &LocalBuffer[0], BufferIndex, NULL);
    vos_unlock_mutex(&dprintLock);
    return 0;    // Used to break out of proceedures on errors
    }

 void dprintBuffer(BYTE* BufferPtr, int Count) {
    int i;
    for (i=0; i<Count; i++) {
//        if (!(i & 15)) dprint("\n", 0);
        dprint("%x ", BufferPtr++);
        }
    }








