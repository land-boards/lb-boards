/*
** TAM.c module for Chapter9 Example
** These routines support the Task Activity Monitor
**
** Author:  John Hyde, USB Design By Example
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

// Declare the VOS calls that I use with surrounding instrumentation
uint8 i_vos_delay_msecs(BYTE ThreadID, uint16 ms) {
    uint8 Value;
    CallVOS(ThreadID);
    Value = vos_delay_msecs(ms);
    ThreadRunning(ThreadID);
    return Value;
    }

uint8 i_vos_dev_read(BYTE ThreadID, VOS_HANDLE h, BYTE* buffer, WORD len, WORD* read) {
    uint8 Value;
    CallVOS(ThreadID);
    Value = vos_dev_read(h, buffer, len, read);
    ThreadRunning(ThreadID);
    return Value;
    }

uint8 i_vos_dev_write(BYTE ThreadID, VOS_HANDLE h, BYTE* buffer, WORD len, WORD* written) {
    uint8 Value;
    CallVOS(ThreadID);
    Value = vos_dev_write(h, buffer, len, written);
    ThreadRunning(ThreadID);
    return Value;
    }

uint8 i_vos_dev_ioctl(BYTE ThreadID, VOS_HANDLE h, void* cb) {
    uint8 Value;
    CallVOS(ThreadID);
    Value = vos_dev_ioctl(h, cb);
    ThreadRunning(ThreadID);
    return Value;
    }

void i_vos_lock_mutex(BYTE ThreadID, vos_mutex_t* m) {
    CallVOS(ThreadID);
    vos_lock_mutex(m);
    ThreadRunning(ThreadID);
    }

void i_vos_wait_semaphore(BYTE ThreadID, vos_semaphore_t* s) {
    CallVOS(ThreadID);
    vos_wait_semaphore(s);
    ThreadRunning(ThreadID);
    }

void i_vos_signal_semaphore(BYTE ThreadID, vos_semaphore_t* s) {
    CallVOS(ThreadID);
    vos_signal_semaphore(s);
    ThreadRunning(ThreadID);
    }


