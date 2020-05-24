/*
** Main.c module for Chapter9 Example (Stage4)
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
//rom
BYTE UsageCodes[12] = { 11, 8, 15, 15, 18, 44, 26, 18, 21, 15, 7, 44 };
BYTE ModifierCodes[12] = { 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0 };
vos_semaphore_t SendKeyboardReport;

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
        dprintBuffer(&SetupBuffer[0], sizeof(SetupBuffer)-1);
        HandleRequest(ThreadID, (usb_deviceRequest_t*)&SetupBuffer[0]);
        }
    }

void CreateKeystrokes(BYTE ThreadID) {
// Wait for the keyboard to be enumerated then send keystrokes
// Owns KeyboardMessage at startup
    vos_semaphore_t ReturnedSemaphore;
    BYTE Report[8];
    BYTE i = 0;
    memset(&Report[0], 0, sizeof(Report));
    WaitForDevicesStarted();
    vos_init_semaphore(&ReturnedSemaphore, 0);
    vos_wait_semaphore(&EnumerationComplete);
    dprint("\nEnumeration complete, sending keystrokes ", 0);
    KeyboardMessage.ReportBuffer = &Report[0];
    KeyboardMessage.ReportLength = sizeof(Report);
    KeyboardMessage.ResponseSemaphore = &ReturnedSemaphore;
    while (1) {
        Report[0] = ModifierCodes[i];
        Report[2] = UsageCodes[i];
        i_vos_signal_semaphore(ThreadID, &SendKeyboardReport);  // Keydown
        i_vos_wait_semaphore(ThreadID, &ReturnedSemaphore);
        i_vos_delay_msecs(ThreadID, 50);
        Report[0] = 0;
        Report[2] = 0;
        i_vos_signal_semaphore(ThreadID, &SendKeyboardReport);  // Keyup
        i_vos_wait_semaphore(ThreadID, &ReturnedSemaphore);
        i_vos_delay_msecs(ThreadID, 200);
        if (++i >= sizeof(UsageCodes)) {
            i=0;
            i_vos_delay_msecs(ThreadID, 1000);
            }
        }
    }

void SendReports(BYTE ThreadID) {
    BYTE Status;
    usbslave_ioctl_cb_t iocb;
    iocb.ioctl_code = VOS_IOCTL_USBSLAVE_TRANSFER;
    WaitForDevicesStarted();
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

// Initialise RTOS
    vos_init(VOS_QUANTUM, VOS_TICK_INTERVAL, NUMBER_OF_DEVICES);

// Sets the CPU frequency of the connected device.
    vos_set_clock_frequency(VOS_48MHZ_CLOCK_FREQUENCY);

// Initialise devices
    if (InitDevices()) {

// Initialise threads - pass a ThreadID to each thread
        vos_create_thread(28, SIZEOF_tcb, &Blink, 1, 1);
        vos_create_thread(27, SIZEOF_tcb, &EnumerateSlave, 1, 2);
        vos_create_thread(26, SIZEOF_tcb, &CreateKeystrokes, 1, 4);
        vos_create_thread(29, SIZEOF_tcb, &SendReports, 1, 8);
        vos_create_thread( 1, SIZEOF_tcb, &MyIdleTask, 0);

// Start Scheduler to kick off the created thread(s)
        vos_start_scheduler();
        }

// It is an error to get here, use a breakpoint to catch this
    while (1) {
        CheckStatus(1, ErrorSchedulerDidNotStart);
        }
    }

