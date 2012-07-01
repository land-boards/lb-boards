/*
** Main.c module for Chapter9 Example (Stage6)
**
** Author:  John Hyde, USB Design By Example
*/

// Include global definitions, constants, etc
#include "main.h"

// Declare global variables
VOS_HANDLE hDevice[NUMBER_OF_DEVICES];
vos_semaphore_t DevicesStarted;
vos_mutex_t dprintLock;
WORD Delay;
MessageType KeyboardMessage;
//rom
char KeyboardName[9] = { "Keyboard\0" };
vos_semaphore_t EnumerationComplete;
vos_semaphore_t SendKeyboardReport;
vos_semaphore_t KeyboardReportReceived;
MessageType RecordMessage;
EntryType Entry;
vos_semaphore_t RecordThisReport;

void CheckStatus(BYTE Status, BYTE ErrorCode) {
    BYTE Reason;
    if (Status == 0) return;
// Set a breakpoint at the next line so that this error can be resolved
    Reason = ErrorCode;
    }

void WaitForDevicesStarted(void) {
    vos_wait_semaphore(&DevicesStarted);
    vos_signal_semaphore(&DevicesStarted);
    }

// Declare program thread(s)
// Blink thread, toggles LED3 on GPIO1
void Blink(BYTE ThreadID) {
    BYTE PortData = LED3;
    WaitForDevicesStarted();
    dprint("Blink (ID=%d) has started\n", &ThreadID);
    while (1) {
        i_vos_delay_msecs(ThreadID, Delay);
        PortData ^= LED3;
// Now write pattern to the GPIO port.
        i_vos_dev_write(ThreadID, hDevice[LEDs] ,&PortData, 1, NULL);
        }
    }

void EnumerateSlave (BYTE ThreadID) {
    usbslave_ioctl_cb_t iocb;
    BYTE SetupBuffer[9];
    BYTE Status;
    WaitForDevicesStarted();
    dprint("\nSlave Openned, SETUP thread (%d) started", &ThreadID);
    iocb.ioctl_code = VOS_IOCTL_USBSLAVE_WAIT_SETUP_RCVD;
    iocb.request.setup_or_bulk_transfer.buffer = &SetupBuffer[0];
    iocb.request.setup_or_bulk_transfer.size = sizeof(SetupBuffer);
    while (1) {
        Status = i_vos_dev_ioctl(ThreadID, hDevice[Slave], &iocb);
        dprint("\nSetup received:", 0);
        dprintBuffer(&SetupBuffer[0], sizeof(SetupBuffer));
        HandleRequest(ThreadID, (usb_deviceRequest_t*)&SetupBuffer[0]);
        }
    }

void FindKeyboard(BYTE ThreadID) {
// This thread looks for a keyboard attached to Host[2]
// It owns KeyboardMessage at startup
    usbhost_device_handle* ifDev;
    WaitForDevicesStarted();
    dprint("\nFindKeyboard (%d) started ", &ThreadID);
    while (1) {
        ifDev = WaitForKeyboard(ThreadID);
        dprint("\n\nKeyboard found (%X)", &ifDev);
        KeyboardMessage.ReportLength = 8;
        KeyboardMessage.SignalSemaphore = &KeyboardReportReceived;
        KeyboardMessage.NamePtr = &KeyboardName[0];
        GetReports(ThreadID, ifDev, &KeyboardMessage);
        }
    }

void ForwardReports(BYTE ThreadID) {
    BYTE Report[MaxReportLength];
    vos_semaphore_t Returned;
    vos_init_semaphore(&Returned, 0);
// This thread owns RecordMessage at startup
    RecordMessage.ReportBuffer = &Report[0];
    RecordMessage.ResponseSemaphore = &Returned;
    WaitForDevicesStarted();
    dprint("\nForwardReports (%d) started ", &ThreadID);
    while (1) {
// Wait for a keyboard report
        i_vos_wait_semaphore(ThreadID, &KeyboardReportReceived);
// Need to make a copy since I will be forwarding the report and therefore will not own it
        RecordMessage.ReportLength = KeyboardMessage.ReportLength;
        memcpy(&Report[0], KeyboardMessage.ReportBuffer, KeyboardMessage.ReportLength);
// Forward the Report to the Keyboard Slave
        i_vos_signal_semaphore(ThreadID, &SendKeyboardReport);
// Send a copy to Record and wait for the Return of ownership of RecordMessage
        i_vos_signal_semaphore(ThreadID, &RecordThisReport);
        i_vos_wait_semaphore(ThreadID, &Returned);
        }
    }

void SendReports(BYTE ThreadID) {
    BYTE Status;
    usbslave_ioctl_cb_t iocb;
    WaitForDevicesStarted();
    iocb.ioctl_code = VOS_IOCTL_USBSLAVE_TRANSFER;
    while (1) {
// Wait for ownership of KeyboardMessage
        i_vos_wait_semaphore(ThreadID, &SendKeyboardReport);
        iocb.handle = KeyboardMessage.DataEP;
        iocb.request.setup_or_bulk_transfer.buffer = KeyboardMessage.ReportBuffer;
        iocb.request.setup_or_bulk_transfer.size = KeyboardMessage.ReportLength;
        Status = i_vos_dev_ioctl(ThreadID, hDevice[Slave], &iocb);
        CheckStatus(Status, ErrorCouldNotSendReport);
// Give back KeyboardMessage
        i_vos_signal_semaphore(ThreadID, KeyboardMessage.ResponseSemaphore);
        }
    }

void Record(BYTE ThreadID) {
    AtmelType Atmel;
    EntryType Entry;
    WORD AtmelBlock = 0;
    WORD AtmelIndex = 0;
    Atmel.DontCare = 0;
    memset(&Entry, 0, sizeof(Entry));
    WaitForDevicesStarted();
    dprint("\nRecord (%d) started", &ThreadID);
// Check that the DataFlash is connected and in binary page mode
    if (CheckDataFlash(ThreadID)) {
        while (1) {
// Wait for a Report to be recorded
            i_vos_wait_semaphore(ThreadID, &RecordThisReport);
// Copy the Report into the Entry stucture (this saves multiple SPI Writes later)
            Entry.Tag = 0;
            if (RecordMessage.ReportLength == 8) {
                Entry.Tag = ValidKeyboardReport;
                memcpy(&Entry.KeyboardReport[0], RecordMessage.ReportBuffer, 8);
                }
            if (Entry.Tag) {
                Entry.AtmelCommand = (AtmelBlock & 1) ? AtmelWriteBuffer2 : AtmelWriteBuffer1;
                Entry.BufferAddress = Swap(AtmelIndex);
                Entry.ElapsedTime = ResetTimer0();
                Entry.Index++;
                SendAndReceiveSPIBytes(ThreadID, &Entry.AtmelCommand, sizeof(Entry), 0);
                AtmelIndex += 16;
                if (AtmelIndex >= 512) {
// Buffer is full, copy it to Flash memory and start filling the other buffer
                    Atmel.Command = (AtmelBlock & 1) ? AtmelProgramWithBuffer2: AtmelProgramWithBuffer1;
                    Atmel.Address = Swap(AtmelBlock<<1);
                    SendAndReceiveSPIBytes(ThreadID, &Atmel.Command, sizeof(Atmel), 0);
                    AtmelIndex = 0;
                    AtmelBlock++;
                    }
                }
// Return ownership of RecordMessage
            i_vos_signal_semaphore(ThreadID, RecordMessage.ResponseSemaphore);
            }
        }
    else CheckStatus(1, ErrorNoDataFlash);
    }


void MyIdleTask(void) {
// This thread is always ready to run and effectively replaces VOS's IdleTask
// I toggle bit 7 of the Logic Analyser Port to show activity
    StartupDevices();
    while (1) {
        asm { ORPORT 393 $0x80; };
        asm {ANDPORT 393 $0x7F; };
        }
    }


// Declare Main application
void main(void) {
// Initialize variables
    vos_init_semaphore(&DevicesStarted, 0);
    vos_init_mutex(&dprintLock, VOS_MUTEX_UNLOCKED);
    Delay = 511;
    vos_init_semaphore(&EnumerationComplete, 0);
    vos_init_semaphore(&SendKeyboardReport, 0);
    vos_init_semaphore(&KeyboardReportReceived, 0);
    vos_init_semaphore(&RecordThisReport, 0);

// Initialise RTOS
    vos_init(VOS_QUANTUM, VOS_TICK_INTERVAL, NUMBER_OF_DEVICES);

// Sets the CPU frequency of the connected device.
    vos_set_clock_frequency(VOS_48MHZ_CLOCK_FREQUENCY);

// Initialise devices
    if (InitDevices()) {

// Initialise threads - pass a ThreadID to each thread
        vos_create_thread(28, SIZEOF_tcb, &Blink, 1, 1);
        vos_create_thread(27, SIZEOF_tcb, &EnumerateSlave, 1, 2);
        vos_create_thread(26, SIZEOF_tcb, &FindKeyboard, 1, 4);
        vos_create_thread(25, SIZEOF_tcb, &SendReports, 1, 8);
        vos_create_thread(24, SIZEOF_tcb, &ForwardReports, 1, 16);
        vos_create_thread(24, SIZEOF_tcb, &Record, 1, 32);
        vos_create_thread( 1, SIZEOF_tcb, &MyIdleTask, 0);

// Start Scheduler to kick off the created thread(s)
        vos_start_scheduler();
        }

// It is an error to get here, use a breakpoint to catch this
    while (1) {
        CheckStatus(1, ErrorSchedulerDidNotStart);
        }
    }

