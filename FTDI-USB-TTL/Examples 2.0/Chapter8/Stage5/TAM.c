/*
** TAM.c module for Chapter7 Example
**
** These routines support the Task Activity Monitor
*/

#include "main.h"

extern VOS_HANDLE hDevice[NUMBER_OF_DEVICES];

void CallVOS(BYTE ThreadID) {
// The thread is calling VOS and could loose the CPU
    BYTE PortData;
    vos_dev_read(hDevice[LA_In], &PortData, 1, NULL);
    PortData &= (ThreadID ^ 0xFF);
    vos_dev_write(hDevice[LA_Out], &PortData, 1, NULL);
    }

void ThreadRunning(BYTE ThreadID) {
// The thread now has the CPU
    BYTE PortData;
    vos_dev_read(hDevice[LA_In], &PortData, 1, NULL);
    PortData |= ThreadID;
    vos_dev_write(hDevice[LA_Out], &PortData, 1, NULL);
    }

