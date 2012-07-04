/*
** Support.c module = helper routines for main.c
**
** Author:  John Hyde, USB Design By Example
*/

#include "main.h"

extern VOS_HANDLE hDevice[NUMBER_OF_DEVICES];

rom BYTE SetBinaryPageSize[4] = {0x3d, 0x2a, 0x80, 0xa6};

void SendAndReceiveSPIBytes(BYTE ThreadID, BYTE* BufferPtr, WORD Length, BOOL Receive) {
    BYTE Status;
    common_ioctl_cb_t iocb;
    iocb.ioctl_code = VOS_IOCTL_SPI_MASTER_SS_0;
    iocb.set.param = SPI_MASTER_SS_ENABLE;
    i_vos_dev_ioctl(ThreadID, hDevice[SPIM], &iocb);     // Drive CS 0
    Status = i_vos_dev_write(ThreadID, hDevice[SPIM], BufferPtr, Length, NULL);
    dprint("\nSending %D bytes to SPI:", &Length);
    dprintBuffer(BufferPtr, (BYTE)Length);
    if (Receive) {
        Status = i_vos_dev_read(ThreadID, hDevice[SPIM], BufferPtr, Length, NULL);
        dprint("\nReceived %D bytes from SPI:", &Length);
        dprintBuffer(BufferPtr, (BYTE)Length);
        }
    iocb.ioctl_code = VOS_IOCTL_SPI_MASTER_SS_0;
    iocb.set.param = SPI_MASTER_SS_DISABLE;
    i_vos_dev_ioctl(ThreadID, hDevice[SPIM], &iocb);
    }

BOOL CheckDataFlash(BYTE ThreadID) {
    BYTE Buffer[4];
    BYTE i;
// First check that the DataFlash is connected
    memset(&Buffer[0], 0xFF, sizeof(Buffer));
    Buffer[0] = AtmelGetDeviceID;
    SendAndReceiveSPIBytes(ThreadID, &Buffer[0], sizeof(Buffer), TRUE);
    if ((Buffer[1] != 0x1F) || (Buffer[2] != 0x26)) return dprint("WARNING: DataFlash not connected\n", 0);
// Now check that the DataFlash is set to binary page size
    memset(&Buffer[0], 0xFF, sizeof(Buffer));
    Buffer[0] = AtmelGetStatus;
    SendAndReceiveSPIBytes(ThreadID, &Buffer[0], sizeof(Buffer), TRUE);
    if (Buffer[2] & 1) return 1;
// Need to change Page Size
    for (i=0; i<sizeof(Buffer); i++) Buffer[i] = SetBinaryPageSize[i];
    SendAndReceiveSPIBytes(ThreadID, &Buffer[0], sizeof(Buffer), FALSE);
    return dprint("WARNING: Need to power off to reset Atmel DataFlash page size\n", 0);
    }

WORD GetElapsedTime(void) {
    tmr_ioctl_cb_t tmr_iocb;
    WORD CurrentCount;
    BYTE Status = 0;
    tmr_iocb.ioctl_code = VOS_IOCTL_TIMER_STOP;
    Status |= vos_dev_ioctl(hDevice[Timer0], &tmr_iocb);
    tmr_iocb.ioctl_code = VOS_IOCTL_TIMER_GET_CURRENT_COUNT;
    Status |= vos_dev_ioctl(hDevice[Timer0], &tmr_iocb);
    CurrentCount = tmr_iocb.param;
    tmr_iocb.ioctl_code = VOS_IOCTL_TIMER_START;
    Status |= vos_dev_ioctl(hDevice[Timer0], &tmr_iocb);
    CheckStatus(Status, ErrorTimer0);
    return CurrentCount;
    }

WORD Swap(WORD w) {
    WORD swapped = ( ((w<<8) & 0xFF00) | ((w>>8) & 0xFF) );
    return swapped;
    }

