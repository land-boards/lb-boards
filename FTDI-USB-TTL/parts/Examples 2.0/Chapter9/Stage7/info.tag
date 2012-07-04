<?xml version="1.0"?>
<VinTag>
 <version>1.0.0</version>
 <file name="Slave.c">
  <struct name="_EntryType" line="39" file="main.h">
   <member name="AtmelCommand" offset="0" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="UpperAddress" offset="8" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="BufferAddress" offset="16" size="16"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="Tag" offset="32" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="ElapsedTime" offset="40" size="16"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="Index" offset="56" size="16"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="KeyboardReport" offset="72" size="64"
    basetype="CHAR" baseattr="unsigned," basearray="8,"/>
   <member name="MouseReport" offset="136" size="24"
    basetype="CHAR" baseattr="unsigned," basearray="3,"/>
  </struct>
  <struct name="_vos_tcb_t" line="78" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h">
   <member name="next" offset="0" size="16"
    basename="_vos_tcb_t" basetype="STRUCT" baseattr="ptr,"/>
   <member name="state" offset="16" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="orig_priority" offset="24" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="priority" offset="32" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="quantum" offset="40" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="delay" offset="48" size="16"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="sp" offset="64" size="16"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="eax" offset="80" size="32"
    basetype="INT" baseattr="unsigned,"/>
   <member name="ebx" offset="112" size="32"
    basetype="INT" baseattr="unsigned,"/>
   <member name="ecx" offset="144" size="32"
    basetype="INT" baseattr="unsigned,"/>
   <member name="r0" offset="176" size="32"
    basetype="INT" baseattr="unsigned,"/>
   <member name="r1" offset="208" size="32"
    basetype="INT" baseattr="unsigned,"/>
   <member name="r2" offset="240" size="32"
    basetype="INT" baseattr="unsigned,"/>
   <member name="r3" offset="272" size="32"
    basetype="INT" baseattr="unsigned,"/>
   <member name="system_data" offset="304" size="16"
    basetype="VOID" baseattr="ptr,"/>
   <member name="system_profiler" offset="320" size="16"
    basetype="VOID" baseattr="ptr,"/>
   <member name="flags" offset="336" size="16"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="semaphore_list" offset="352" size="16"
    basetype="VOID" baseattr="ptr,"/>
  </struct>
  <struct name="_usb_hidDescriptor_t" line="38" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBHID.h">
   <member name="bLength" offset="0" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bDescriptorType" offset="8" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bcdHID" offset="16" size="16"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="bCountryCode" offset="32" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bNumDescriptors" offset="40" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bDescriptorType_0" offset="48" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="wDescriptorLength_0" offset="56" size="16"
    basetype="SHORT" baseattr="unsigned,"/>
  </struct>
  <struct name="_usb_deviceRequest_t" line="151" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USB.h">
   <member name="bmRequestType" offset="0" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bRequest" offset="8" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="wValue" offset="16" size="16"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="wIndex" offset="32" size="16"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="wLength" offset="48" size="16"
    basetype="SHORT" baseattr="unsigned,"/>
  </struct>
  <struct name="_usbslave_ioctl_cb_t" line="51" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBSlave.h">
   <member name="ioctl_code" offset="0" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="ep" offset="8" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="handle" offset="16" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="get" offset="24" size="16"
    basetype="VOID" baseattr="ptr,"/>
   <member name="set" offset="40" size="16"
    basetype="VOID" baseattr="ptr,"/>
   <member name="request" offset="56" size="48"
    basename="__unnamed_struct_9" basetype="STRUCT" baseattr=""/>
  </struct>
  <enum name="dma_status" line="29" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\dma.h">
   <value name="DMA_OK" const="0"/>
   <value name="DMA_INVALID_PARAMETER" const="1"/>
   <value name="DMA_ACQUIRE_ERROR" const="2"/>
   <value name="DMA_ENABLE_ERROR" const="3"/>
   <value name="DMA_DISABLE_ERROR" const="4"/>
   <value name="DMA_CONFIGURE_ERROR" const="5"/>
   <value name="DMA_ERROR" const="6"/>
   <value name="DMA_FIFO_ERROR" const="7"/>
  </enum>
  <struct name="_usb_hubDescriptor_t" line="333" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USB.h">
   <member name="bLength" offset="0" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bDescriptorType" offset="8" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bNbrPorts" offset="16" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="wHubCharacteristics" offset="24" size="16"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="bPwrOn2PwrGood" offset="40" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bHubContrCurrent" offset="48" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="DeviceRemovable" offset="56" size="128"
    basetype="CHAR" baseattr="unsigned," basearray="16,"/>
   <member name="PortPwrCtrlMask" offset="184" size="128"
    basetype="CHAR" baseattr="unsigned," basearray="16,"/>
  </struct>
  <struct name="_usb_hubPortStatus_t" line="394" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USB.h">
   <member name="currentConnectStatus" offset="0" size="1"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="portEnabled" offset="1" size="1"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="portSuspend" offset="2" size="1"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="portOverCurrent" offset="3" size="1"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="portReset" offset="4" size="1"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="resv1" offset="5" size="3"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="portPower" offset="8" size="1"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="portLowSpeed" offset="9" size="1"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="portHighSpeed" offset="10" size="1"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="portTest" offset="11" size="1"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="portIndicator" offset="12" size="1"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="resv2" offset="13" size="3"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="currentConnectStatusChange" offset="16" size="1"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="portEnabledChange" offset="17" size="1"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="portSuspendChange" offset="18" size="1"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="portOverCurrentChange" offset="19" size="1"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="portResetChange" offset="20" size="1"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="resv3" offset="21" size="3"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="portPowerChange" offset="24" size="1"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="portLowSpeedChange" offset="25" size="1"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="portHighSpeedChange" offset="26" size="1"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="portTestChange" offset="27" size="1"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="portIndicatorChange" offset="28" size="1"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="resv4" offset="29" size="3"
    basetype="SHORT" baseattr="unsigned,"/>
  </struct>
  <enum name="USBHOST_STATUS" line="29" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBHost.h">
   <value name="USBHOST_OK" const="0"/>
   <value name="USBHOST_NOT_FOUND" const="1"/>
   <value name="USBHOST_PENDING" const="2"/>
   <value name="USBHOST_INVALID_PARAMETER" const="3"/>
   <value name="USBHOST_INVALID_BUFFER" const="4"/>
   <value name="USBHOST_INCOMPLETE_ENUM" const="5"/>
   <value name="USBHOST_INVALID_CONFIGURATION" const="6"/>
   <value name="USBHOST_TD_FULL" const="7"/>
   <value name="USBHOST_EP_FULL" const="8"/>
   <value name="USBHOST_IF_FULL" const="9"/>
   <value name="USBHOST_EP_HALTED" const="10"/>
   <value name="USBHOST_EP_INVALID" const="11"/>
   <value name="USBHOST_INVALID_STATE" const="12"/>
   <value name="USBHOST_ERROR" const="13"/>
   <value name="USBHOST_CC_ERROR" const="16"/>
   <value name="USBHOST_FATAL_ERROR" const="255"/>
  </enum>
  <struct name="_spimaster_context_t" line="65" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\SPIMaster.h">
   <member name="buffer_size" offset="0" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
  </struct>
  <enum name="USBSLAVE_STATUS" line="106" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBSlave.h">
   <value name="USBSLAVE_OK" const="0"/>
   <value name="USBSLAVE_INVALID_PARAMETER" const="1"/>
   <value name="USBSLAVE_ERROR" const="2"/>
   <value name="USBSLAVE_FATAL_ERROR" const="255"/>
  </enum>
  <struct name="_usb_deviceEndpointDescriptor_t" line="291" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USB.h">
   <member name="bLength" offset="0" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bDescriptorType" offset="8" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bEndpointAddress" offset="16" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bmAttributes" offset="24" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="wMaxPacketSize" offset="32" size="16"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="bInterval" offset="48" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
  </struct>
  <struct name="_MessageType" line="30" file="main.h">
   <member name="ReportBuffer" offset="0" size="16"
    basetype="CHAR" baseattr="unsigned,ptr,"/>
   <member name="ReportLength" offset="16" size="16"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="SignalSemaphore" offset="32" size="16"
    basename="_vos_semaphore_t" basetype="STRUCT" baseattr="ptr,"/>
   <member name="ResponseSemaphore" offset="48" size="16"
    basename="_vos_semaphore_t" basetype="STRUCT" baseattr="ptr,"/>
   <member name="DataEP" offset="64" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="NamePtr" offset="72" size="16"
    basetype="CHAR" baseattr="signed,ptr,"/>
  </struct>
  <struct name="_vos_semaphore_list_t" line="151" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h">
   <member name="next" offset="0" size="16"
    basename="_vos_semaphore_list_t" basetype="STRUCT" baseattr="ptr,"/>
   <member name="siz" offset="16" size="8"
    basetype="CHAR" baseattr="signed,"/>
   <member name="flags" offset="24" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="result" offset="32" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="list" offset="40" size="16"
    basename="_vos_semaphore_t" basetype="STRUCT" baseattr="ptr," basearray="1,"/>
  </struct>
  <enum name="SPIMASTER_STATUS" line="55" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\SPIMaster.h">
   <value name="SPIMASTER_OK" const="0"/>
   <value name="SPIMASTER_INVALID_PARAMETER" const="1"/>
   <value name="SPIMASTER_DMA_NOT_ENABLED" const="2"/>
   <value name="SPIMASTER_ERROR" const="3"/>
   <value name="SPIMASTER_FATAL_ERROR" const="255"/>
  </enum>
  <struct name="_usb_deviceInterfaceDescriptor_t" line="276" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USB.h">
   <member name="bLength" offset="0" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bDescriptorType" offset="8" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bInterfaceNumber" offset="16" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bAlternateSetting" offset="24" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bNumEndpoints" offset="32" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bInterfaceClass" offset="40" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bInterfaceSubclass" offset="48" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bInterfaceProtocol" offset="56" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="iInterface" offset="64" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
  </struct>
  <struct name="_usb_deviceQualifierDescriptor_t" line="243" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USB.h">
   <member name="bLength" offset="0" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bDescriptorType" offset="8" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bcdUSB" offset="16" size="16"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="bDeviceClass" offset="32" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bDeviceSubclass" offset="40" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bDeviceProtocol" offset="48" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bMaxPacketSize0" offset="56" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bNumConfigurations" offset="64" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bReserved" offset="72" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
  </struct>
  <struct name="_vos_mutex_t" line="120" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h">
   <member name="threads" offset="0" size="16"
    basename="_vos_tcb_t" basetype="STRUCT" baseattr="ptr,"/>
   <member name="owner" offset="16" size="16"
    basename="_vos_tcb_t" basetype="STRUCT" baseattr="ptr,"/>
   <member name="attr" offset="32" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="ceiling" offset="40" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
  </struct>
  <enum name="AtmelCommands" line="88" file="main.h">
   <value name="AtmelProgramWithBuffer1" const="131"/>
   <value name="AtmelWriteBuffer1" const="132"/>
   <value name="AtmelProgramWithBuffer2" const="134"/>
   <value name="AtmelWriteBuffer2" const="135"/>
   <value name="AtmelGetDeviceID" const="159"/>
   <value name="AtmelGetStatus" const="215"/>
  </enum>
  <struct name="_vos_device_t" line="17" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\devman.h">
   <member name="mutex" offset="0" size="48"
    basename="_vos_mutex_t" basetype="STRUCT" baseattr=""/>
   <member name="driver" offset="48" size="16"
    basename="_vos_driver_t" basetype="STRUCT" baseattr="ptr,"/>
   <member name="context" offset="64" size="16"
    basetype="VOID" baseattr="ptr,"/>
  </struct>
  <struct name="_usb_deviceDescriptor_t" line="223" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USB.h">
   <member name="bLength" offset="0" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bDescriptorType" offset="8" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bcdUSB" offset="16" size="16"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="bDeviceClass" offset="32" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bDeviceSubclass" offset="40" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bDeviceProtocol" offset="48" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bMaxPacketSize0" offset="56" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="idVendor" offset="64" size="16"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="idProduct" offset="80" size="16"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="bcdDevice" offset="96" size="16"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="iManufacturer" offset="112" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="iProduct" offset="120" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="iSerialNumber" offset="128" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bNumConfigurations" offset="136" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
  </struct>
  <struct name="_vos_driver_t" line="6" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\devman.h">
   <member name="open" offset="0" size="32"
    basetype="VOID" baseattr=""/>
   <member name="close" offset="32" size="32"
    basetype="VOID" baseattr=""/>
   <member name="read" offset="64" size="32"
    basetype="CHAR" baseattr="signed,"/>
   <member name="write" offset="96" size="32"
    basetype="CHAR" baseattr="signed,"/>
   <member name="ioctl" offset="128" size="32"
    basetype="CHAR" baseattr="signed,"/>
   <member name="interrupt" offset="160" size="32"
    basetype="VOID" baseattr=""/>
   <member name="flags" offset="192" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
  </struct>
  <struct name="_vos_system_data_area_t" line="196" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h">
   <member name="next" offset="0" size="16"
    basename="_vos_system_data_area_t" basetype="STRUCT" baseattr="ptr,"/>
   <member name="tcb" offset="16" size="16"
    basename="_vos_tcb_t" basetype="STRUCT" baseattr="ptr,"/>
   <member name="count" offset="32" size="32"
    basetype="INT" baseattr="unsigned,"/>
  </struct>
  <struct name="_usb_deviceStringDescriptorZero_t" line="309" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USB.h">
   <member name="bLength" offset="0" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bDescriptorType" offset="8" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="wLANGID0" offset="16" size="16"
    basetype="SHORT" baseattr="unsigned,"/>
  </struct>
  <enum name="Tags" line="84" file="main.h">
   <value name="ValidKeyboardReport" const="1"/>
  </enum>
  <struct name="_tmr_context_t" line="64" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\Timers.h">
   <member name="timer_identifier" offset="0" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
  </struct>
  <enum name="IOMUX_INPUT_SIGNALS" line="26" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\iomux.h">
   <value name="IOMUX_IN_DEBUGGER" const="0"/>
   <value name="IOMUX_IN_UART_RXD" const="1"/>
   <value name="IOMUX_IN_UART_CTS_N" const="2"/>
   <value name="IOMUX_IN_UART_DSR_N" const="3"/>
   <value name="IOMUX_IN_UART_DCD" const="4"/>
   <value name="IOMUX_IN_UART_RI" const="5"/>
   <value name="IOMUX_IN_FIFO_DATA_0" const="6"/>
   <value name="IOMUX_IN_FIFO_DATA_1" const="7"/>
   <value name="IOMUX_IN_FIFO_DATA_2" const="8"/>
   <value name="IOMUX_IN_FIFO_DATA_3" const="9"/>
   <value name="IOMUX_IN_FIFO_DATA_4" const="10"/>
   <value name="IOMUX_IN_FIFO_DATA_5" const="11"/>
   <value name="IOMUX_IN_FIFO_DATA_6" const="12"/>
   <value name="IOMUX_IN_FIFO_DATA_7" const="13"/>
   <value name="IOMUX_IN_FIFO_OE_N" const="14"/>
   <value name="IOMUX_IN_FIFO_RD_N" const="15"/>
   <value name="IOMUX_IN_FIFO_WR_N" const="16"/>
   <value name="IOMUX_IN_SPI_SLAVE_0_CLK" const="17"/>
   <value name="IOMUX_IN_SPI_SLAVE_0_MOSI" const="18"/>
   <value name="IOMUX_IN_SPI_SLAVE_0_CS" const="19"/>
   <value name="IOMUX_IN_SPI_SLAVE_1_CLK" const="20"/>
   <value name="IOMUX_IN_SPI_SLAVE_1_MOSI" const="21"/>
   <value name="IOMUX_IN_SPI_SLAVE_1_CS" const="22"/>
   <value name="IOMUX_IN_SPI_MASTER_MISO" const="23"/>
   <value name="IOMUX_IN_GPIO_PORT_A_0" const="24"/>
   <value name="IOMUX_IN_GPIO_PORT_A_1" const="25"/>
   <value name="IOMUX_IN_GPIO_PORT_A_2" const="26"/>
   <value name="IOMUX_IN_GPIO_PORT_A_3" const="27"/>
   <value name="IOMUX_IN_GPIO_PORT_A_4" const="28"/>
   <value name="IOMUX_IN_GPIO_PORT_A_5" const="29"/>
   <value name="IOMUX_IN_GPIO_PORT_A_6" const="30"/>
   <value name="IOMUX_IN_GPIO_PORT_A_7" const="31"/>
   <value name="IOMUX_IN_GPIO_PORT_B_0" const="32"/>
   <value name="IOMUX_IN_GPIO_PORT_B_1" const="33"/>
   <value name="IOMUX_IN_GPIO_PORT_B_2" const="34"/>
   <value name="IOMUX_IN_GPIO_PORT_B_3" const="35"/>
   <value name="IOMUX_IN_GPIO_PORT_B_4" const="36"/>
   <value name="IOMUX_IN_GPIO_PORT_B_5" const="37"/>
   <value name="IOMUX_IN_GPIO_PORT_B_6" const="38"/>
   <value name="IOMUX_IN_GPIO_PORT_B_7" const="39"/>
   <value name="IOMUX_IN_GPIO_PORT_C_0" const="40"/>
   <value name="IOMUX_IN_GPIO_PORT_C_1" const="41"/>
   <value name="IOMUX_IN_GPIO_PORT_C_2" const="42"/>
   <value name="IOMUX_IN_GPIO_PORT_C_3" const="43"/>
   <value name="IOMUX_IN_GPIO_PORT_C_4" const="44"/>
   <value name="IOMUX_IN_GPIO_PORT_C_5" const="45"/>
   <value name="IOMUX_IN_GPIO_PORT_C_6" const="46"/>
   <value name="IOMUX_IN_GPIO_PORT_C_7" const="47"/>
   <value name="IOMUX_IN_GPIO_PORT_D_0" const="48"/>
   <value name="IOMUX_IN_GPIO_PORT_D_1" const="49"/>
   <value name="IOMUX_IN_GPIO_PORT_D_2" const="50"/>
   <value name="IOMUX_IN_GPIO_PORT_D_3" const="51"/>
   <value name="IOMUX_IN_GPIO_PORT_D_4" const="52"/>
   <value name="IOMUX_IN_GPIO_PORT_D_5" const="53"/>
   <value name="IOMUX_IN_GPIO_PORT_D_6" const="54"/>
   <value name="IOMUX_IN_GPIO_PORT_D_7" const="55"/>
   <value name="IOMUX_IN_GPIO_PORT_E_0" const="56"/>
   <value name="IOMUX_IN_GPIO_PORT_E_1" const="57"/>
   <value name="IOMUX_IN_GPIO_PORT_E_2" const="58"/>
   <value name="IOMUX_IN_GPIO_PORT_E_3" const="59"/>
   <value name="IOMUX_IN_GPIO_PORT_E_4" const="60"/>
   <value name="IOMUX_IN_GPIO_PORT_E_5" const="61"/>
   <value name="IOMUX_IN_GPIO_PORT_E_6" const="62"/>
   <value name="IOMUX_IN_GPIO_PORT_E_7" const="63"/>
  </enum>
  <struct name="_tmr_ioctl_cb_t" line="70" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\Timers.h">
   <member name="ioctl_code" offset="0" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="param" offset="8" size="16"
    basetype="SHORT" baseattr="unsigned,"/>
  </struct>
  <struct name="_vos_cond_var_t" line="176" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h">
   <member name="threads" offset="0" size="16"
    basename="_vos_tcb_t" basetype="STRUCT" baseattr="ptr,"/>
   <member name="lock" offset="16" size="16"
    basename="_vos_mutex_t" basetype="STRUCT" baseattr="ptr,"/>
   <member name="state" offset="32" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
  </struct>
  <struct name="_gpio_context_t" line="82" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\gpio.h">
   <member name="port_identifier" offset="0" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
  </struct>
  <struct name="_usbhost_ioctl_cb_class_t" line="293" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBHost.h">
   <member name="dev_class" offset="0" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="dev_subclass" offset="8" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="dev_protocol" offset="16" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
  </struct>
  <struct name="_usbhost_xfer_t" line="131" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBHost.h">
   <member name="ep" offset="0" size="16"
    basetype="VOID" baseattr="ptr,"/>
   <member name="s" offset="16" size="16"
    basename="_vos_semaphore_t" basetype="STRUCT" baseattr="ptr,"/>
   <member name="cond_code" offset="32" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="buf" offset="40" size="16"
    basetype="CHAR" baseattr="unsigned,ptr,"/>
   <member name="len" offset="56" size="16"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="flags" offset="72" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="resv1" offset="80" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="zero" offset="88" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
  </struct>
  <struct name="_uart_context_t" line="110" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\UART.h">
   <member name="buffer_size" offset="0" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
  </struct>
  <enum name="IOMUX_OUTPUT_SIGNALS" line="106" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\iomux.h">
   <value name="IOMUX_OUT_DEBUGGER" const="0"/>
   <value name="IOMUX_OUT_UART_TXD" const="1"/>
   <value name="IOMUX_OUT_UART_RTS_N" const="2"/>
   <value name="IOMUX_OUT_UART_DTR_N" const="3"/>
   <value name="IOMUX_OUT_UART_TX_ACTIVE" const="4"/>
   <value name="IOMUX_OUT_FIFO_DATA_0" const="5"/>
   <value name="IOMUX_OUT_FIFO_DATA_1" const="6"/>
   <value name="IOMUX_OUT_FIFO_DATA_2" const="7"/>
   <value name="IOMUX_OUT_FIFO_DATA_3" const="8"/>
   <value name="IOMUX_OUT_FIFO_DATA_4" const="9"/>
   <value name="IOMUX_OUT_FIFO_DATA_5" const="10"/>
   <value name="IOMUX_OUT_FIFO_DATA_6" const="11"/>
   <value name="IOMUX_OUT_FIFO_DATA_7" const="12"/>
   <value name="IOMUX_OUT_FIFO_RXF_N" const="13"/>
   <value name="IOMUX_OUT_FIFO_TXE_N" const="14"/>
   <value name="IOMUX_OUT_PWM_0" const="15"/>
   <value name="IOMUX_OUT_PWM_1" const="16"/>
   <value name="IOMUX_OUT_PWM_2" const="17"/>
   <value name="IOMUX_OUT_PWM_3" const="18"/>
   <value name="IOMUX_OUT_PWM_4" const="19"/>
   <value name="IOMUX_OUT_PWM_5" const="20"/>
   <value name="IOMUX_OUT_PWM_6" const="21"/>
   <value name="IOMUX_OUT_PWM_7" const="22"/>
   <value name="IOMUX_OUT_SPI_SLAVE_0_MOSI" const="23"/>
   <value name="IOMUX_OUT_SPI_SLAVE_0_MISO" const="24"/>
   <value name="IOMUX_OUT_SPI_SLAVE_1_MOSI" const="25"/>
   <value name="IOMUX_OUT_SPI_SLAVE_1_MISO" const="26"/>
   <value name="IOMUX_OUT_SPI_MASTER_CLK" const="27"/>
   <value name="IOMUX_OUT_SPI_MASTER_MOSI" const="28"/>
   <value name="IOMUX_OUT_SPI_MASTER_CS_0" const="29"/>
   <value name="IOMUX_OUT_SPI_MASTER_CS_1" const="30"/>
   <value name="IOMUX_OUT_FIFO_CLKOUT_245" const="31"/>
   <value name="IOMUX_OUT_GPIO_PORT_A_0" const="32"/>
   <value name="IOMUX_OUT_GPIO_PORT_A_1" const="33"/>
   <value name="IOMUX_OUT_GPIO_PORT_A_2" const="34"/>
   <value name="IOMUX_OUT_GPIO_PORT_A_3" const="35"/>
   <value name="IOMUX_OUT_GPIO_PORT_A_4" const="36"/>
   <value name="IOMUX_OUT_GPIO_PORT_A_5" const="37"/>
   <value name="IOMUX_OUT_GPIO_PORT_A_6" const="38"/>
   <value name="IOMUX_OUT_GPIO_PORT_A_7" const="39"/>
   <value name="IOMUX_OUT_GPIO_PORT_B_0" const="40"/>
   <value name="IOMUX_OUT_GPIO_PORT_B_1" const="41"/>
   <value name="IOMUX_OUT_GPIO_PORT_B_2" const="42"/>
   <value name="IOMUX_OUT_GPIO_PORT_B_3" const="43"/>
   <value name="IOMUX_OUT_GPIO_PORT_B_4" const="44"/>
   <value name="IOMUX_OUT_GPIO_PORT_B_5" const="45"/>
   <value name="IOMUX_OUT_GPIO_PORT_B_6" const="46"/>
   <value name="IOMUX_OUT_GPIO_PORT_B_7" const="47"/>
   <value name="IOMUX_OUT_GPIO_PORT_C_0" const="48"/>
   <value name="IOMUX_OUT_GPIO_PORT_C_1" const="49"/>
   <value name="IOMUX_OUT_GPIO_PORT_C_2" const="50"/>
   <value name="IOMUX_OUT_GPIO_PORT_C_3" const="51"/>
   <value name="IOMUX_OUT_GPIO_PORT_C_4" const="52"/>
   <value name="IOMUX_OUT_GPIO_PORT_C_5" const="53"/>
   <value name="IOMUX_OUT_GPIO_PORT_C_6" const="54"/>
   <value name="IOMUX_OUT_GPIO_PORT_C_7" const="55"/>
   <value name="IOMUX_OUT_GPIO_PORT_D_0" const="56"/>
   <value name="IOMUX_OUT_GPIO_PORT_D_1" const="57"/>
   <value name="IOMUX_OUT_GPIO_PORT_D_2" const="58"/>
   <value name="IOMUX_OUT_GPIO_PORT_D_3" const="59"/>
   <value name="IOMUX_OUT_GPIO_PORT_D_4" const="60"/>
   <value name="IOMUX_OUT_GPIO_PORT_D_5" const="61"/>
   <value name="IOMUX_OUT_GPIO_PORT_D_6" const="62"/>
   <value name="IOMUX_OUT_GPIO_PORT_D_7" const="63"/>
   <value name="IOMUX_OUT_GPIO_PORT_E_0" const="64"/>
   <value name="IOMUX_OUT_GPIO_PORT_E_1" const="65"/>
   <value name="IOMUX_OUT_GPIO_PORT_E_2" const="66"/>
   <value name="IOMUX_OUT_GPIO_PORT_E_3" const="67"/>
   <value name="IOMUX_OUT_GPIO_PORT_E_4" const="68"/>
   <value name="IOMUX_OUT_GPIO_PORT_E_5" const="69"/>
   <value name="IOMUX_OUT_GPIO_PORT_E_6" const="70"/>
   <value name="IOMUX_OUT_GPIO_PORT_E_7" const="71"/>
  </enum>
  <struct name="_gpio_ioctl_cb_t" line="89" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\gpio.h">
   <member name="ioctl_code" offset="0" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="value" offset="8" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
  </struct>
  <struct name="_usb_hubStatus_t" line="380" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USB.h">
   <member name="localPowerSource" offset="0" size="1"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="overCurrent" offset="1" size="1"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="resv1" offset="2" size="14"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="localPowerSourceChange" offset="16" size="1"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="overCurrentChange" offset="17" size="1"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="resv2" offset="18" size="14"
    basetype="SHORT" baseattr="unsigned,"/>
  </struct>
  <struct name="_vos_semaphore_t" line="144" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h">
   <member name="val" offset="0" size="16"
    basetype="SHORT" baseattr="signed,"/>
   <member name="threads" offset="16" size="16"
    basename="_vos_tcb_t" basetype="STRUCT" baseattr="ptr,"/>
   <member name="usage_count" offset="32" size="8"
    basetype="CHAR" baseattr="signed,"/>
  </struct>
  <struct name="_usb_deviceConfigurationDescriptor_t" line="258" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USB.h">
   <member name="bLength" offset="0" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bDescriptorType" offset="8" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="wTotalLength" offset="16" size="16"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="bNumInterfaces" offset="32" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bConfigurationValue" offset="40" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="iConfiguration" offset="48" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bmAttributes" offset="56" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bMaxPower" offset="64" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
  </struct>
  <enum name="Devices" line="57" file="main.h">
   <value name="LEDs" const="0"/>
   <value name="UART" const="1"/>
   <value name="LA_In" const="2"/>
   <value name="LA_Out" const="3"/>
   <value name="Host" const="4"/>
   <value name="Slave" const="5"/>
   <value name="SPIM" const="6"/>
   <value name="Timer0" const="7"/>
   <value name="Buttons" const="8"/>
  </enum>
  <struct name="_vos_dma_config_t" line="41" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\dma.h">
   <member name="src" offset="0" size="16"
    basename="__unnamed_struct_1" basetype="STRUCT" baseattr=""/>
   <member name="dest" offset="16" size="16"
    basename="__unnamed_struct_2" basetype="STRUCT" baseattr=""/>
   <member name="bufsiz" offset="32" size="16"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="mode" offset="48" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="fifosize" offset="56" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="flow_control" offset="64" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="afull_trigger" offset="72" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
  </struct>
  <struct name="_usbhost_ioctl_cb_vid_pid_t" line="288" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBHost.h">
   <member name="vid" offset="0" size="16"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="pid" offset="16" size="16"
    basetype="SHORT" baseattr="unsigned,"/>
  </struct>
  <struct name="_usbhost_ioctl_cb_ep_info_t" line="307" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBHost.h">
   <member name="number" offset="0" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="max_size" offset="8" size="16"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="speed" offset="24" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
  </struct>
  <enum name="__anon_enum_type_1" line="75" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h">
   <value name="IDLE" const="0"/>
   <value name="BLOCKED" const="1"/>
   <value name="READY" const="2"/>
   <value name="RUNNING" const="3"/>
   <value name="DELAYED" const="4"/>
   <value name="GONE" const="5"/>
  </enum>
  <enum name="__anon_enum_type_2" line="78" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBSlave.h">
   <value name="USBSLAVE_CONTROL_SETUP" const="0"/>
   <value name="USBSLAVE_CONTROL_OUT" const="1"/>
   <value name="USBSLAVE_CONTROL_IN" const="2"/>
  </enum>
  <enum name="__anon_enum_type_3" line="89" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBSlave.h">
   <value name="usbsStateNotAttached" const="0"/>
   <value name="usbsStateAttached" const="1"/>
   <value name="usbsStatePowered" const="2"/>
   <value name="usbsStateDefault" const="3"/>
   <value name="usbsStateAddress" const="4"/>
   <value name="usbsStateConfigured" const="5"/>
   <value name="usbsStateSuspended" const="6"/>
  </enum>
  <enum name="__anon_enum_type_4" line="103" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBSlave.h">
   <value name="usbsEvReset" const="0"/>
   <value name="usbsEvAddressAssigned" const="1"/>
   <value name="usbsEvDeviceConfigured" const="2"/>
   <value name="usbsEvDeviceDeconfigured" const="3"/>
   <value name="usbsEvHubReset" const="4"/>
   <value name="usbsEvHubConfigured" const="5"/>
   <value name="usbsEvHubDeconfigured" const="6"/>
   <value name="usbsEvBusActivity" const="7"/>
   <value name="usbsEvBusInactive" const="8"/>
   <value name="usbsEvPowerInterruption" const="9"/>
  </enum>
  <struct name="__unnamed_struct_1" line="45" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\dma.h">
   <member name="io_addr" offset="0" size="16"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="mem_addr" offset="0" size="16"
    basetype="CHAR" baseattr="unsigned,ptr,"/>
  </struct>
  <struct name="__unnamed_struct_2" line="49" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\dma.h">
   <member name="io_addr" offset="0" size="16"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="mem_addr" offset="0" size="16"
    basetype="CHAR" baseattr="unsigned,ptr,"/>
  </struct>
  <struct name="__unnamed_struct_3" line="68" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\ioctl.h">
   <member name="uart_baud_rate" offset="0" size="32"
    basetype="LONG" baseattr="unsigned,"/>
   <member name="spi_master_sck_freq" offset="0" size="32"
    basetype="LONG" baseattr="unsigned,"/>
   <member name="param" offset="0" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="data" offset="0" size="16"
    basetype="VOID" baseattr="ptr,"/>
  </struct>
  <struct name="__unnamed_struct_4" line="74" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\ioctl.h">
   <member name="spi_master_sck_freq" offset="0" size="32"
    basetype="LONG" baseattr="unsigned,"/>
   <member name="queue_stat" offset="0" size="16"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="param" offset="0" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="data" offset="0" size="16"
    basetype="VOID" baseattr="ptr,"/>
  </struct>
  <struct name="__unnamed_struct_5" line="190" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBHost.h">
   <member name="size" offset="0" size="11"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="pad" offset="11" size="1"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="cond_code" offset="12" size="4"
    basetype="SHORT" baseattr="unsigned,"/>
  </struct>
  <struct name="__unnamed_struct_6" line="281" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBHost.h">
   <member name="ep" offset="0" size="16"
    basetype="VOID" baseattr="ptr,"/>
   <member name="dif" offset="0" size="16"
    basetype="VOID" baseattr="ptr,"/>
  </struct>
  <struct name="__unnamed_struct_7" line="63" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBSlave.h">
   <member name="in_mask" offset="0" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="out_mask" offset="8" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
  </struct>
  <struct name="__unnamed_struct_8" line="68" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBSlave.h">
   <member name="buffer" offset="0" size="16"
    basetype="CHAR" baseattr="unsigned,ptr,"/>
   <member name="size" offset="16" size="16"
    basetype="SHORT" baseattr="signed,"/>
   <member name="bytes_transferred" offset="32" size="16"
    basetype="SHORT" baseattr="signed,"/>
  </struct>
  <struct name="__unnamed_struct_9" line="69" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBSlave.h">
   <member name="set_ep_masks" offset="0" size="16"
    basename="__unnamed_struct_7" basetype="STRUCT" baseattr=""/>
   <member name="setup_or_bulk_transfer" offset="0" size="48"
    basename="__unnamed_struct_8" basetype="STRUCT" baseattr=""/>
  </struct>
  <struct name="_common_ioctl_cb_t" line="61" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\ioctl.h">
   <member name="ioctl_code" offset="0" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="set" offset="8" size="32"
    basename="__unnamed_struct_3" basetype="STRUCT" baseattr=""/>
   <member name="get" offset="40" size="32"
    basename="__unnamed_struct_4" basetype="STRUCT" baseattr=""/>
  </struct>
  <enum name="GPIO_STATUS" line="71" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\gpio.h">
   <value name="GPIO_OK" const="0"/>
   <value name="GPIO_INVALID_PORT_IDENTIFIER" const="1"/>
   <value name="GPIO_INVALID_PARAMETER" const="2"/>
   <value name="GPIO_INTERRUPT_NOT_ENABLED" const="3"/>
   <value name="GPIO_ERROR" const="4"/>
   <value name="GPIO_FATAL_ERROR" const="255"/>
  </enum>
  <enum name="UART_STATUS" line="100" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\UART.h">
   <value name="UART_OK" const="0"/>
   <value name="UART_INVALID_PARAMETER" const="1"/>
   <value name="UART_DMA_NOT_ENABLED" const="2"/>
   <value name="UART_ERROR" const="3"/>
   <value name="UART_FATAL_ERROR" const="255"/>
  </enum>
  <struct name="_usbhost_ioctl_cb_dev_info_t" line="299" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBHost.h">
   <member name="port_number" offset="0" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="addr" offset="8" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="interface_number" offset="16" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="speed" offset="24" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="alt" offset="32" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
  </struct>
  <struct name="_usbhost_context_t" line="314" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBHost.h">
   <member name="if_count" offset="0" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="ep_count" offset="8" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="xfer_count" offset="16" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="iso_xfer_count" offset="24" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
  </struct>
  <enum name="TIMER_STATUS" line="54" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\Timers.h">
   <value name="TIMER_OK" const="0"/>
   <value name="TIMER_INVALID_IDENTIFIER" const="1"/>
   <value name="TIMER_INVALID_PARAMETER" const="2"/>
   <value name="TIMER_ERROR" const="3"/>
   <value name="TIMER_FATAL_ERROR" const="255"/>
  </enum>
  <enum name="IOMUX_STATUS" line="195" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\iomux.h">
   <value name="IOMUX_OK" const="0"/>
   <value name="IOMUX_INVALID_SIGNAL" const="1"/>
   <value name="IOMUX_INVALID_PIN_SELECTION" const="2"/>
   <value name="IOMUX_UNABLE_TO_ROUTE_SIGNAL" const="3"/>
   <value name="IOMUX_INVLAID_IOCELL_DRIVE_CURRENT" const="4"/>
   <value name="IOMUX_INVLAID_IOCELL_TRIGGER" const="5"/>
   <value name="IOMUX_INVLAID_IOCELL_SLEW_RATE" const="6"/>
   <value name="IOMUX_INVLAID_IOCELL_PULL" const="7"/>
   <value name="IOMUX_ERROR" const="8"/>
  </enum>
  <struct name="_usbhost_ioctl_cb_t" line="271" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBHost.h">
   <member name="ioctl_code" offset="0" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="hub_port" offset="8" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="handle" offset="16" size="16"
    basename="__unnamed_struct_6" basetype="STRUCT" baseattr=""/>
   <member name="get" offset="32" size="16"
    basetype="VOID" baseattr="ptr,"/>
   <member name="set" offset="48" size="16"
    basetype="VOID" baseattr="ptr,"/>
  </struct>
  <struct name="_usb_hub_selector_t" line="425" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USB.h">
   <member name="hub_port" offset="0" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="selector" offset="8" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
  </struct>
  <struct name="_usb_deviceStringDescriptor_t" line="321" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USB.h">
   <member name="bLength" offset="0" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bDescriptorType" offset="8" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="bString" offset="16" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
  </struct>
  <struct name="_AtmelType" line="50" file="main.h">
   <member name="Command" offset="0" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="Address" offset="8" size="16"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="DontCare" offset="24" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
  </struct>
  <enum name="ErrorCodes" line="72" file="main.h">
   <value name="NoError" const="0"/>
   <value name="ErrorSchedulerDidNotStart" const="1"/>
   <value name="ErrorInitDevices" const="2"/>
   <value name="ErrorStartupDevices" const="3"/>
   <value name="ErrorUnknownRequest" const="4"/>
   <value name="ErrorUnknownDescriptorType" const="5"/>
   <value name="ErrorCouldNotSendReport" const="6"/>
   <value name="ErrorNoDataFlash" const="7"/>
   <value name="ErrorTimer0" const="8"/>
  </enum>
  <struct name="_usbhost_xfer_iso_t" line="159" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBHost.h">
   <member name="ep" offset="0" size="16"
    basetype="VOID" baseattr="ptr,"/>
   <member name="s" offset="16" size="16"
    basename="_vos_semaphore_t" basetype="STRUCT" baseattr="ptr,"/>
   <member name="cond_code" offset="32" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="buf" offset="40" size="16"
    basetype="CHAR" baseattr="unsigned,ptr,"/>
   <member name="len" offset="56" size="16"
    basetype="SHORT" baseattr="unsigned,"/>
   <member name="flags" offset="72" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="resv1" offset="80" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="count" offset="88" size="8"
    basetype="CHAR" baseattr="unsigned,"/>
   <member name="len_psw" offset="96" size="128"
    basename="__unnamed_struct_5" basetype="STRUCT" baseattr="" basearray="8,"/>
   <member name="frame" offset="224" size="16"
    basetype="SHORT" baseattr="unsigned,"/>
  </struct>
  <typedef name="spimaster_context_t" line="67" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\SPIMaster.h"
   basename="_spimaster_context_t" basetype="STRUCT" baseattr=""/>
  <typedef name="usbslave_ep_handle_t" line="32" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBSlave.h"
   basetype="CHAR" baseattr="unsigned,"/>
  <typedef name="usb_deviceEndpointDescriptor_t" line="300" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USB.h"
   basename="_usb_deviceEndpointDescriptor_t" basetype="STRUCT" baseattr=""/>
  <typedef name="MessageType" line="37" file="main.h"
   basename="_MessageType" basetype="STRUCT" baseattr=""/>
  <typedef name="vos_semaphore_list_t" line="157" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basename="_vos_semaphore_list_t" basetype="STRUCT" baseattr=""/>
  <proto name="PF" line="35" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="CHAR" baseattr="signed,">
   <typedef name="__unknown" line="35" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    basetype="CHAR" baseattr="unsigned,"/>
  </proto>
  <typedef name="usb_deviceInterfaceDescriptor_t" line="288" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USB.h"
   basename="_usb_deviceInterfaceDescriptor_t" basetype="STRUCT" baseattr=""/>
  <typedef name="usbhost_device_handle" line="126" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBHost.h"
   basetype="VOID" baseattr="ptr,"/>
  <typedef name="usb_deviceQualifierDescriptor_t" line="255" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USB.h"
   basename="_usb_deviceQualifierDescriptor_t" basetype="STRUCT" baseattr=""/>
  <typedef name="vos_mutex_t" line="125" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basename="_vos_mutex_t" basetype="STRUCT" baseattr=""/>
  <typedef name="vos_device_t" line="21" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\devman.h"
   basename="_vos_device_t" basetype="STRUCT" baseattr=""/>
  <typedef name="usb_deviceDescriptor_t" line="240" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USB.h"
   basename="_usb_deviceDescriptor_t" basetype="STRUCT" baseattr=""/>
  <typedef name="vos_driver_t" line="14" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\devman.h"
   basename="_vos_driver_t" basetype="STRUCT" baseattr=""/>
  <typedef name="vos_system_data_area_t" line="200" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basename="_vos_system_data_area_t" basetype="STRUCT" baseattr=""/>
  <typedef name="usb_deviceStringDescriptorZero_t" line="318" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USB.h"
   basename="_usb_deviceStringDescriptorZero_t" basetype="STRUCT" baseattr=""/>
  <typedef name="BOOL" line="8" file="main.h"
   basetype="CHAR" baseattr="unsigned,"/>
  <typedef name="BYTE" line="9" file="main.h"
   basetype="CHAR" baseattr="unsigned,"/>
  <typedef name="WORD" line="10" file="main.h"
   basetype="SHORT" baseattr="unsigned,"/>
  <typedef name="tmr_context_t" line="66" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\Timers.h"
   basename="_tmr_context_t" basetype="STRUCT" baseattr=""/>
  <proto name="PF_IO" line="39" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="CHAR" baseattr="signed,">
   <typedef name="__unknown" line="39" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    basetype="CHAR" baseattr="unsigned,ptr,"/>
   <typedef name="__unknown" line="39" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    basetype="SHORT" baseattr="unsigned,"/>
   <typedef name="__unknown" line="39" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    basetype="SHORT" baseattr="unsigned,ptr,"/>
  </proto>
  <typedef name="tmr_ioctl_cb_t" line="73" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\Timers.h"
   basename="_tmr_ioctl_cb_t" basetype="STRUCT" baseattr=""/>
  <typedef name="vos_cond_var_t" line="180" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basename="_vos_cond_var_t" basetype="STRUCT" baseattr=""/>
  <proto name="PF_INT" line="40" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="VOID" baseattr="">
  </proto>
  <typedef name="gpio_context_t" line="84" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\gpio.h"
   basename="_gpio_context_t" basetype="STRUCT" baseattr=""/>
  <typedef name="usbhost_ioctl_cb_class_t" line="297" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBHost.h"
   basename="_usbhost_ioctl_cb_class_t" basetype="STRUCT" baseattr=""/>
  <typedef name="usbhost_xfer_t" line="156" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBHost.h"
   basename="_usbhost_xfer_t" basetype="STRUCT" baseattr=""/>
  <typedef name="uart_context_t" line="112" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\UART.h"
   basename="_uart_context_t" basetype="STRUCT" baseattr=""/>
  <typedef name="gpio_ioctl_cb_t" line="92" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\gpio.h"
   basename="_gpio_ioctl_cb_t" basetype="STRUCT" baseattr=""/>
  <proto name="PF_OPEN" line="36" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="VOID" baseattr="">
   <typedef name="__unknown" line="36" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    basetype="VOID" baseattr="ptr,"/>
  </proto>
  <typedef name="usb_hubStatus_t" line="391" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USB.h"
   basename="_usb_hubStatus_t" basetype="STRUCT" baseattr=""/>
  <typedef name="vos_semaphore_t" line="148" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basename="_vos_semaphore_t" basetype="STRUCT" baseattr=""/>
  <typedef name="usb_deviceConfigurationDescriptor_t" line="269" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USB.h"
   basename="_usb_deviceConfigurationDescriptor_t" basetype="STRUCT" baseattr=""/>
  <proto name="PF_CLOSE" line="37" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="VOID" baseattr="">
   <typedef name="__unknown" line="37" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    basetype="VOID" baseattr="ptr,"/>
  </proto>
  <typedef name="addr_t" line="21" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\C\include\config.h"
   basetype="SHORT" baseattr="signed,"/>
  <proto name="PF_IOCTL" line="38" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="CHAR" baseattr="signed,">
   <typedef name="__unknown" line="38" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    basetype="CHAR" baseattr="unsigned,ptr,"/>
  </proto>
  <typedef name="size_t" line="20" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\C\include\config.h"
   basetype="SHORT" baseattr="signed,"/>
  <typedef name="vos_dma_config_t" line="55" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\dma.h"
   basename="_vos_dma_config_t" basetype="STRUCT" baseattr=""/>
  <typedef name="usbhost_ioctl_cb_vid_pid_t" line="291" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBHost.h"
   basename="_usbhost_ioctl_cb_vid_pid_t" basetype="STRUCT" baseattr=""/>
  <typedef name="usbhost_ioctl_cb_ep_info_t" line="311" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBHost.h"
   basename="_usbhost_ioctl_cb_ep_info_t" basetype="STRUCT" baseattr=""/>
  <typedef name="common_ioctl_cb_t" line="75" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\ioctl.h"
   basename="_common_ioctl_cb_t" basetype="STRUCT" baseattr=""/>
  <typedef name="usbhost_ep_handle" line="128" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBHost.h"
   basetype="VOID" baseattr="ptr,"/>
  <typedef name="usbhost_ioctl_cb_dev_info_t" line="305" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBHost.h"
   basename="_usbhost_ioctl_cb_dev_info_t" basetype="STRUCT" baseattr=""/>
  <typedef name="usbhost_context_t" line="323" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBHost.h"
   basename="_usbhost_context_t" basetype="STRUCT" baseattr=""/>
  <typedef name="usbhost_ioctl_cb_t" line="286" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBHost.h"
   basename="_usbhost_ioctl_cb_t" basetype="STRUCT" baseattr=""/>
  <typedef name="usb_hub_selector_t" line="428" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USB.h"
   basename="_usb_hub_selector_t" basetype="STRUCT" baseattr=""/>
  <typedef name="usb_deviceStringDescriptor_t" line="330" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USB.h"
   basename="_usb_deviceStringDescriptor_t" basetype="STRUCT" baseattr=""/>
  <typedef name="AtmelType" line="54" file="main.h"
   basename="_AtmelType" basetype="STRUCT" baseattr=""/>
  <typedef name="usbhost_xfer_iso_t" line="195" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBHost.h"
   basename="_usbhost_xfer_iso_t" basetype="STRUCT" baseattr=""/>
  <proto name="fnVoidPtr" line="42" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="VOID" baseattr="">
  </proto>
  <typedef name="EntryType" line="48" file="main.h"
   basename="_EntryType" basetype="STRUCT" baseattr=""/>
  <typedef name="vos_tcb_t" line="97" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basename="_vos_tcb_t" basetype="STRUCT" baseattr=""/>
  <typedef name="usb_hidDescriptor_t" line="52" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBHID.h"
   basename="_usb_hidDescriptor_t" basetype="STRUCT" baseattr=""/>
  <typedef name="usb_deviceRequest_t" line="173" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USB.h"
   basename="_usb_deviceRequest_t" basetype="STRUCT" baseattr=""/>
  <typedef name="usbslave_ioctl_cb_t" line="70" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBSlave.h"
   basename="_usbslave_ioctl_cb_t" basetype="STRUCT" baseattr=""/>
  <typedef name="usb_hubDescriptor_t" line="346" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USB.h"
   basename="_usb_hubDescriptor_t" basetype="STRUCT" baseattr=""/>
  <typedef name="usb_hubPortStatus_t" line="423" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USB.h"
   basename="_usb_hubPortStatus_t" basetype="STRUCT" baseattr=""/>
  <proto name="HandleHIDClassRequest" line="144" file="Slave.c"
   basetype="VOID" baseattr="">
   <var name="ThreadID" line="144" file="Slave.c"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="Setup" line="144" file="Slave.c"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basename="_usb_deviceRequest_t" basetype="STRUCT" baseattr="ptr,"/>
  </proto>
  <proto name="HandleChapter9Request" line="89" file="Slave.c"
   basetype="VOID" baseattr="">
   <var name="ThreadID" line="89" file="Slave.c"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="Setup" line="89" file="Slave.c"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basename="_usb_deviceRequest_t" basetype="STRUCT" baseattr="ptr,"/>
  </proto>
  <proto name="SendResponse" line="68" file="Slave.c"
   basetype="VOID" baseattr="">
   <var name="ThreadID" line="68" file="Slave.c"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="BufferPtr" line="68" file="Slave.c"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="VOID" baseattr="ptr,"/>
   <var name="RequestedLength" line="68" file="Slave.c"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,"/>
   <var name="ActualLength" line="68" file="Slave.c"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,"/>
  </proto>
  <proto name="HandleRequest" line="173" file="Slave.c"
   basetype="VOID" baseattr="">
   <var name="ThreadID" line="173" file="Slave.c"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="Setup" line="173" file="Slave.c"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basename="_usb_deviceRequest_t" basetype="STRUCT" baseattr="ptr,"/>
  </proto>
  <proto name="SendACK" line="79" file="Slave.c"
   basetype="VOID" baseattr="">
   <var name="ThreadID" line="79" file="Slave.c"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
  </proto>
  <proto name="vos_dma_get_fifo_flow_control" line="85" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\dma.h"
   basetype="CHAR" baseattr="unsigned,">
   <var name="h" line="85" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\dma.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,"/>
  </proto>
  <proto name="vos_start_scheduler" line="54" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="VOID" baseattr="">
  </proto>
  <proto name="GetReports" line="106" file="main.h"
   basetype="CHAR" baseattr="unsigned,">
   <var name="ThreadID" line="106" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="ifDev" line="106" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="VOID" baseattr="ptr,"/>
   <var name="Message" line="106" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basename="_MessageType" basetype="STRUCT" baseattr="ptr,"/>
  </proto>
  <proto name="vos_signal_semaphore_from_isr" line="169" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="VOID" baseattr="">
   <var name="s" line="169" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basename="_vos_semaphore_t" basetype="STRUCT" baseattr="ptr,"/>
  </proto>
  <proto name="vos_malloc" line="25" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\memmgmt.h"
   basetype="VOID" baseattr="ptr,">
   <var name="size" line="25" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\memmgmt.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,"/>
  </proto>
  <proto name="vos_memcpy" line="28" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\memmgmt.h"
   basetype="VOID" baseattr="ptr,">
   <var name="destination" line="28" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\memmgmt.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="VOID" baseattr="ptr,"/>
   <var name="source" line="28" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\memmgmt.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="VOID" baseattr="const,ptr,"/>
   <var name="num" line="28" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\memmgmt.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="signed,"/>
  </proto>
  <proto name="vos_memset" line="27" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\memmgmt.h"
   basetype="VOID" baseattr="ptr,">
   <var name="dstptr" line="27" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\memmgmt.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="VOID" baseattr="ptr,"/>
   <var name="value" line="27" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\memmgmt.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="INT" baseattr="signed,"/>
   <var name="num" line="27" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\memmgmt.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="signed,"/>
  </proto>
  <proto name="vos_get_package_type" line="220" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="CHAR" baseattr="unsigned,">
  </proto>
  <proto name="vos_dma_get_fifo_data_register" line="84" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\dma.h"
   basetype="SHORT" baseattr="unsigned,">
   <var name="h" line="84" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\dma.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,"/>
  </proto>
  <proto name="SendAndReceiveSPIBytes" line="108" file="main.h"
   basetype="VOID" baseattr="">
   <var name="ThreadID" line="108" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="BufferPtr" line="108" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,ptr,"/>
   <var name="Length" line="108" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,"/>
   <var name="Receive" line="108" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
  </proto>
  <proto name="i_vos_wait_semaphore" line="118" file="main.h"
   basetype="VOID" baseattr="">
   <var name="ThreadID" line="118" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="s" line="118" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basename="_vos_semaphore_t" basetype="STRUCT" baseattr="ptr,"/>
  </proto>
  <proto name="InitDevices" line="98" file="main.h"
   basetype="CHAR" baseattr="unsigned,">
  </proto>
  <proto name="vos_signal_semaphore" line="168" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="VOID" baseattr="">
   <var name="s" line="168" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basename="_vos_semaphore_t" basetype="STRUCT" baseattr="ptr,"/>
  </proto>
  <proto name="CheckStatus" line="100" file="main.h"
   basetype="VOID" baseattr="">
   <var name="Status" line="100" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="ErrorCode" line="100" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
  </proto>
  <proto name="vos_dma_get_fifo_data" line="87" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\dma.h"
   basetype="CHAR" baseattr="unsigned,">
   <var name="h" line="87" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\dma.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,"/>
   <var name="dat" line="87" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\dma.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,ptr,"/>
  </proto>
  <proto name="vos_iocell_get_config" line="234" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\iomux.h"
   basetype="CHAR" baseattr="unsigned,">
   <var name="pin" line="234" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\iomux.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="drive_current" line="234" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\iomux.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,ptr,"/>
   <var name="trigger" line="234" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\iomux.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,ptr,"/>
   <var name="slew_rate" line="234" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\iomux.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,ptr,"/>
   <var name="pull" line="234" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\iomux.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,ptr,"/>
  </proto>
  <proto name="vos_iomux_define_bidi" line="232" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\iomux.h"
   basetype="CHAR" baseattr="unsigned,">
   <var name="pin" line="232" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\iomux.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="input_signal" line="232" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\iomux.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="output_signal" line="232" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\iomux.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
  </proto>
  <proto name="vos_iocell_set_config" line="235" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\iomux.h"
   basetype="CHAR" baseattr="unsigned,">
   <var name="pin" line="235" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\iomux.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="drive_current" line="235" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\iomux.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="trigger" line="235" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\iomux.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="slew_rate" line="235" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\iomux.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="pull" line="235" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\iomux.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
  </proto>
  <proto name="vos_get_chip_revision" line="223" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="CHAR" baseattr="unsigned,">
  </proto>
  <proto name="vos_wait_semaphore_ex" line="167" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="CHAR" baseattr="signed,">
   <var name="l" line="167" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basename="_vos_semaphore_list_t" basetype="STRUCT" baseattr="ptr,"/>
  </proto>
  <proto name="vos_enable_interrupts" line="53" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\devman.h"
   basetype="VOID" baseattr="">
   <var name="mask" line="53" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\devman.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="INT" baseattr="unsigned,"/>
  </proto>
  <proto name="dprintBuffer" line="102" file="main.h"
   basetype="VOID" baseattr="">
   <var name="BufferPtr" line="102" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,ptr,"/>
   <var name="Count" line="102" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="INT" baseattr="signed,"/>
  </proto>
  <proto name="vos_dev_read" line="35" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\devman.h"
   basetype="CHAR" baseattr="unsigned,">
   <var name="h" line="35" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\devman.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,"/>
   <var name="buf" line="35" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\devman.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,ptr,"/>
   <var name="num_to_read" line="35" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\devman.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,"/>
   <var name="num_read" line="35" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\devman.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,ptr,"/>
  </proto>
  <proto name="vos_dev_open" line="34" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\devman.h"
   basetype="SHORT" baseattr="unsigned,">
   <var name="dev_num" line="34" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\devman.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
  </proto>
  <proto name="vos_halt_cpu" line="235" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="VOID" baseattr="">
  </proto>
  <proto name="vos_dev_init" line="31" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\devman.h"
   basetype="VOID" baseattr="">
   <var name="dev_num" line="31" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\devman.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="driver_cb" line="31" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\devman.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basename="_vos_driver_t" basetype="STRUCT" baseattr="ptr,"/>
   <var name="context" line="31" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\devman.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="VOID" baseattr="ptr,"/>
  </proto>
  <proto name="vos_dma_get_fifo_count" line="86" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\dma.h"
   basetype="SHORT" baseattr="unsigned,">
   <var name="h" line="86" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\dma.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,"/>
  </proto>
  <proto name="usbhost_init" line="326" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBHost.h"
   basetype="CHAR" baseattr="unsigned,">
   <var name="devNum_1" line="326" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBHost.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="devNum_2" line="326" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBHost.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="context" line="326" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBHost.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basename="_usbhost_context_t" basetype="STRUCT" baseattr="ptr,"/>
  </proto>
  <proto name="i_vos_signal_semaphore" line="119" file="main.h"
   basetype="VOID" baseattr="">
   <var name="ThreadID" line="119" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="s" line="119" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basename="_vos_semaphore_t" basetype="STRUCT" baseattr="ptr,"/>
  </proto>
  <proto name="vos_iomux_define_input" line="230" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\iomux.h"
   basetype="CHAR" baseattr="unsigned,">
   <var name="pin" line="230" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\iomux.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="signal" line="230" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\iomux.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
  </proto>
  <proto name="CheckDataFlash" line="109" file="main.h"
   basetype="CHAR" baseattr="unsigned,">
   <var name="ThreadID" line="109" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
  </proto>
  <proto name="vos_disable_interrupts" line="54" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\devman.h"
   basetype="VOID" baseattr="">
   <var name="mask" line="54" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\devman.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="INT" baseattr="unsigned,"/>
  </proto>
  <proto name="vos_init_heap" line="24" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\memmgmt.h"
   basetype="VOID" baseattr="">
  </proto>
  <proto name="vos_dev_close" line="38" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\devman.h"
   basetype="VOID" baseattr="">
   <var name="h" line="38" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\devman.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,"/>
  </proto>
  <proto name="GetElapsedTime" line="110" file="main.h"
   basetype="SHORT" baseattr="unsigned,">
  </proto>
  <proto name="vos_dev_ioctl" line="37" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\devman.h"
   basetype="CHAR" baseattr="unsigned,">
   <var name="h" line="37" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\devman.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,"/>
   <var name="cb" line="37" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\devman.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="VOID" baseattr="ptr,"/>
  </proto>
  <proto name="usbslave_init" line="114" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBSlave.h"
   basetype="CHAR" baseattr="unsigned,">
   <var name="s_num" line="114" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBSlave.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="d_num" line="114" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\USBSlave.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
  </proto>
  <proto name="vos_dev_write" line="36" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\devman.h"
   basetype="CHAR" baseattr="unsigned,">
   <var name="h" line="36" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\devman.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,"/>
   <var name="buf" line="36" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\devman.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,ptr,"/>
   <var name="num_to_write" line="36" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\devman.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,"/>
   <var name="num_written" line="36" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\devman.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,ptr,"/>
  </proto>
  <proto name="vos_get_clock_frequency" line="213" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="CHAR" baseattr="unsigned,">
  </proto>
  <proto name="Swap" line="111" file="main.h"
   basetype="SHORT" baseattr="unsigned,">
   <var name="Data" line="111" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,"/>
  </proto>
  <proto name="vos_set_clock_frequency" line="212" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="VOID" baseattr="">
   <var name="frequency" line="212" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
  </proto>
  <proto name="vos_dma_enable" line="81" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\dma.h"
   basetype="CHAR" baseattr="unsigned,">
   <var name="h" line="81" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\dma.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,"/>
  </proto>
  <proto name="vos_reset_vnc2" line="238" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="VOID" baseattr="">
  </proto>
  <proto name="StartupDevices" line="99" file="main.h"
   basetype="VOID" baseattr="">
  </proto>
  <proto name="i_vos_dev_read" line="114" file="main.h"
   basetype="CHAR" baseattr="unsigned,">
   <var name="ThreadID" line="114" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="h" line="114" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,"/>
   <var name="buffer" line="114" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,ptr,"/>
   <var name="len" line="114" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,"/>
   <var name="read" line="114" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,ptr,"/>
  </proto>
  <proto name="vos_iomux_define_output" line="231" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\iomux.h"
   basetype="CHAR" baseattr="unsigned,">
   <var name="pin" line="231" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\iomux.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="signal" line="231" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\iomux.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
  </proto>
  <proto name="spimaster_init" line="74" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\SPIMaster.h"
   basetype="CHAR" baseattr="unsigned,">
   <var name="devNum" line="72" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\SPIMaster.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="context" line="73" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\SPIMaster.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basename="_spimaster_context_t" basetype="STRUCT" baseattr="ptr,"/>
  </proto>
  <proto name="WaitForKeyboard" line="103" file="main.h"
   basetype="VOID" baseattr="ptr,">
   <var name="ThreadID" line="103" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
  </proto>
  <proto name="vos_dma_wait_on_complete" line="83" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\dma.h"
   basetype="VOID" baseattr="">
   <var name="h" line="83" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\dma.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,"/>
  </proto>
  <proto name="vos_lock_mutex" line="132" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="VOID" baseattr="">
   <var name="m" line="132" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basename="_vos_mutex_t" basetype="STRUCT" baseattr="ptr,"/>
  </proto>
  <proto name="vos_power_down" line="232" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="CHAR" baseattr="unsigned,">
   <var name="wakeMask" line="232" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
  </proto>
  <proto name="vos_init_mutex" line="131" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="VOID" baseattr="">
   <var name="m" line="131" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basename="_vos_mutex_t" basetype="STRUCT" baseattr="ptr,"/>
   <var name="state" line="131" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
  </proto>
  <proto name="vos_get_priority_ceiling" line="135" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="CHAR" baseattr="unsigned,">
   <var name="m" line="135" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basename="_vos_mutex_t" basetype="STRUCT" baseattr="ptr,"/>
  </proto>
  <proto name="vos_dma_disable" line="82" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\dma.h"
   basetype="CHAR" baseattr="unsigned,">
   <var name="h" line="82" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\dma.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,"/>
  </proto>
  <proto name="vos_set_priority_ceiling" line="136" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="VOID" baseattr="">
   <var name="m" line="136" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basename="_vos_mutex_t" basetype="STRUCT" baseattr="ptr,"/>
   <var name="priority" line="136" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
  </proto>
  <proto name="vos_dma_release" line="78" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\dma.h"
   basetype="VOID" baseattr="">
   <var name="h" line="78" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\dma.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,"/>
  </proto>
  <proto name="vos_dma_acquire" line="77" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\dma.h"
   basetype="SHORT" baseattr="unsigned,">
  </proto>
  <proto name="i_vos_dev_ioctl" line="116" file="main.h"
   basetype="CHAR" baseattr="unsigned,">
   <var name="ThreadID" line="116" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="h" line="116" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,"/>
   <var name="cb" line="116" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="VOID" baseattr="ptr,"/>
  </proto>
  <proto name="vos_delay_msecs" line="102" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="CHAR" baseattr="unsigned,">
   <var name="ms" line="102" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,"/>
  </proto>
  <proto name="vos_stack_usage" line="191" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="SHORT" baseattr="unsigned,">
   <var name="__unknown" line="191" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basename="_vos_tcb_t" basetype="STRUCT" baseattr="ptr,"/>
  </proto>
  <proto name="vos_get_profile" line="194" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="INT" baseattr="unsigned,">
   <var name="__unknown" line="194" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basename="_vos_tcb_t" basetype="STRUCT" baseattr="ptr,"/>
  </proto>
  <proto name="i_vos_dev_write" line="115" file="main.h"
   basetype="CHAR" baseattr="unsigned,">
   <var name="ThreadID" line="115" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="h" line="115" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,"/>
   <var name="buffer" line="115" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,ptr,"/>
   <var name="len" line="115" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,"/>
   <var name="written" line="115" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,ptr,"/>
  </proto>
  <proto name="DecodeDescriptor" line="105" file="main.h"
   basetype="VOID" baseattr="">
   <var name="DescriptorPtr" line="105" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,ptr,"/>
  </proto>
  <proto name="memset" line="25" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\C\include\string.h"
   basetype="VOID" baseattr="ptr,">
   <var name="dstptr" line="25" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\C\include\string.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="VOID" baseattr="ptr,"/>
   <var name="value" line="25" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\C\include\string.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="INT" baseattr="signed,"/>
   <var name="num" line="25" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\C\include\string.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="signed,"/>
  </proto>
  <proto name="memcpy" line="24" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\C\include\string.h"
   basetype="VOID" baseattr="ptr,">
   <var name="destination" line="24" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\C\include\string.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="VOID" baseattr="ptr,"/>
   <var name="source" line="24" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\C\include\string.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="VOID" baseattr="const,ptr,"/>
   <var name="num" line="24" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\C\include\string.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="signed,"/>
  </proto>
  <proto name="vos_delay_cancel" line="103" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="VOID" baseattr="">
   <var name="tcb" line="103" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basename="_vos_tcb_t" basetype="STRUCT" baseattr="ptr,"/>
  </proto>
  <proto name="dprint" line="101" file="main.h"
   basetype="CHAR" baseattr="unsigned,">
   <var name="StringPtr" line="101" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,ptr,"/>
   <var name="DataPtr" line="101" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="VOID" baseattr="ptr,"/>
  </proto>
  <proto name="strcat" line="30" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\C\include\string.h"
   basetype="CHAR" baseattr="signed,ptr,">
   <var name="destination" line="30" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\C\include\string.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="signed,ptr,"/>
   <var name="source" line="30" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\C\include\string.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="const,signed,ptr,"/>
  </proto>
  <proto name="strlen" line="31" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\C\include\string.h"
   basetype="SHORT" baseattr="signed,">
   <var name="str" line="31" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\C\include\string.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="const,signed,ptr,"/>
  </proto>
  <proto name="strcmp" line="26" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\C\include\string.h"
   basetype="INT" baseattr="signed,">
   <var name="str1" line="26" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\C\include\string.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="const,signed,ptr,"/>
   <var name="str2" line="26" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\C\include\string.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="const,signed,ptr,"/>
  </proto>
  <proto name="strcpy" line="28" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\C\include\string.h"
   basetype="CHAR" baseattr="signed,ptr,">
   <var name="destination" line="28" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\C\include\string.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="signed,ptr,"/>
   <var name="source" line="28" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\C\include\string.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="const,signed,ptr,"/>
  </proto>
  <proto name="vos_dma_retained_configure" line="80" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\dma.h"
   basetype="CHAR" baseattr="unsigned,">
   <var name="h" line="80" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\dma.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,"/>
   <var name="mem_addr" line="80" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\dma.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,ptr,"/>
   <var name="bufsiz" line="80" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\dma.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,"/>
  </proto>
  <var name="hDevice" line="9" file="Slave.c"
   type="AUTO" storage="EXTERN" attr="global,"
   basetype="SHORT" baseattr="unsigned," basearray="9,"/>
  <proto name="i_vos_lock_mutex" line="117" file="main.h"
   basetype="VOID" baseattr="">
   <var name="ThreadID" line="117" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="m" line="117" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basename="_vos_mutex_t" basetype="STRUCT" baseattr="ptr,"/>
  </proto>
  <proto name="vos_unlock_mutex" line="134" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="VOID" baseattr="">
   <var name="m" line="134" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basename="_vos_mutex_t" basetype="STRUCT" baseattr="ptr,"/>
  </proto>
  <proto name="vos_create_thread" line="100" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basename="_vos_tcb_t" basetype="STRUCT" baseattr="ptr,">
   <var name="__unknown" line="100" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="__unknown" line="100" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,"/>
   <var name="__unknown" line="100" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    type="FUNCTION" storage="AUTO VAR" attr="param,"
    basetype="VOID" baseattr=""/>
   <var name="__unknown" line="100" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="signed,"/>
  </proto>
  <proto name="strncmp" line="27" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\C\include\string.h"
   basetype="INT" baseattr="signed,">
   <var name="str1" line="27" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\C\include\string.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="const,signed,ptr,"/>
   <var name="str2" line="27" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\C\include\string.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="const,signed,ptr,"/>
   <var name="num" line="27" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\C\include\string.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="signed,"/>
  </proto>
  <proto name="i_vos_delay_msecs" line="113" file="main.h"
   basetype="CHAR" baseattr="unsigned,">
   <var name="ThreadID" line="113" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="ms" line="113" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,"/>
  </proto>
  <proto name="vos_dma_configure" line="79" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\dma.h"
   basetype="CHAR" baseattr="unsigned,">
   <var name="h" line="79" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\dma.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,"/>
   <var name="cb" line="79" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\dma.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basename="_vos_dma_config_t" basetype="STRUCT" baseattr="ptr,"/>
  </proto>
  <proto name="strncpy" line="29" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\C\include\string.h"
   basetype="CHAR" baseattr="signed,ptr,">
   <var name="destination" line="29" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\C\include\string.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="signed,ptr,"/>
   <var name="source" line="29" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\C\include\string.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="const,signed,ptr,"/>
   <var name="num" line="29" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\C\include\string.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="signed,"/>
  </proto>
  <proto name="vos_init_cond_var" line="182" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="VOID" baseattr="">
   <var name="cv" line="182" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basename="_vos_cond_var_t" basetype="STRUCT" baseattr="ptr,"/>
  </proto>
  <proto name="vos_wait_cond_var" line="183" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="VOID" baseattr="">
   <var name="cv" line="183" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basename="_vos_cond_var_t" basetype="STRUCT" baseattr="ptr,"/>
   <var name="m" line="183" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basename="_vos_mutex_t" basetype="STRUCT" baseattr="ptr,"/>
  </proto>
  <proto name="vos_stop_profiler" line="193" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="VOID" baseattr="">
  </proto>
  <proto name="vos_trylock_mutex" line="133" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="CHAR" baseattr="unsigned,">
   <var name="m" line="133" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basename="_vos_mutex_t" basetype="STRUCT" baseattr="ptr,"/>
  </proto>
  <proto name="vos_free" line="26" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\memmgmt.h"
   basetype="VOID" baseattr="">
   <var name="ptrFree" line="26" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\memmgmt.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="VOID" baseattr="ptr,"/>
  </proto>
  <proto name="tmr_init" line="80" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\Timers.h"
   basetype="CHAR" baseattr="unsigned,">
   <var name="devNum" line="78" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\Timers.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="context" line="79" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\Timers.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="VOID" baseattr="ptr,"/>
  </proto>
  <proto name="DisplayDescriptors" line="104" file="main.h"
   basetype="CHAR" baseattr="unsigned,">
   <var name="ThreadID" line="104" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="ifDev" line="104" file="main.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="VOID" baseattr="ptr,"/>
  </proto>
  <proto name="vos_init" line="53" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="VOID" baseattr="">
   <var name="quantum" line="53" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="tick_cnt" line="53" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="unsigned,"/>
   <var name="num_devices" line="53" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
  </proto>
  <proto name="vos_init_semaphore" line="165" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="VOID" baseattr="">
   <var name="sem" line="165" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basename="_vos_semaphore_t" basetype="STRUCT" baseattr="ptr,"/>
   <var name="count" line="165" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="SHORT" baseattr="signed,"/>
  </proto>
  <proto name="vos_wait_semaphore" line="166" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="VOID" baseattr="">
   <var name="s" line="166" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basename="_vos_semaphore_t" basetype="STRUCT" baseattr="ptr,"/>
  </proto>
  <proto name="vos_start_profiler" line="192" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="VOID" baseattr="">
  </proto>
  <var name="EnumerationComplete" line="10" file="Slave.c"
   type="AUTO" storage="EXTERN" attr="global,"
   basename="_vos_semaphore_t" basetype="STRUCT" baseattr=""/>
  <proto name="gpio_init" line="99" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\gpio.h"
   basetype="CHAR" baseattr="unsigned,">
   <var name="devNum" line="97" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\gpio.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="context" line="98" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\gpio.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="VOID" baseattr="ptr,"/>
  </proto>
  <proto name="uart_init" line="119" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\UART.h"
   basetype="CHAR" baseattr="unsigned,">
   <var name="devNum" line="117" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\UART.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basetype="CHAR" baseattr="unsigned,"/>
   <var name="context" line="118" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\drivers\include\UART.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basename="_uart_context_t" basetype="STRUCT" baseattr="ptr,"/>
  </proto>
  <proto name="vos_signal_cond_var" line="184" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
   basetype="VOID" baseattr="">
   <var name="cv" line="184" file="C:\Program Files (x86)\FTDI\Vinculum II Toolchain\Firmware\kernel\include\vos.h"
    type="AUTO" storage="AUTO VAR" attr="param,"
    basename="_vos_cond_var_t" basetype="STRUCT" baseattr="ptr,"/>
  </proto>
  <var name="KeyboardLEDs" line="15" file="Slave.c"
   type="AUTO" storage="AUTO VAR" attr="global,"
   basetype="CHAR" baseattr="unsigned,"/>
  <var name="Configuration" line="14" file="Slave.c"
   type="AUTO" storage="AUTO VAR" attr="global,"
   basetype="CHAR" baseattr="unsigned,"/>
  <var name="KeyboardReportDescriptor" line="19" file="Slave.c"
   type="AUTO" storage="AUTO VAR" attr="global,"
   basetype="CHAR" baseattr="unsigned," basearray="59,"/>
  <var name="EP0_In" line="13" file="Slave.c"
   type="AUTO" storage="AUTO VAR" attr="global,"
   basetype="CHAR" baseattr="unsigned,"/>
  <var name="EP1_In" line="13" file="Slave.c"
   type="AUTO" storage="AUTO VAR" attr="global,"
   basetype="CHAR" baseattr="unsigned,"/>
  <var name="MyConfigurationDescriptor" line="57" file="Slave.c"
   type="AUTO" storage="AUTO VAR" attr="global,"
   basetype="CHAR" baseattr="unsigned," basearray="34,"/>
  <var name="EP0_Out" line="13" file="Slave.c"
   type="AUTO" storage="AUTO VAR" attr="global,"
   basetype="CHAR" baseattr="unsigned,"/>
  <var name="MyDeviceDescriptor" line="54" file="Slave.c"
   type="AUTO" storage="AUTO VAR" attr="global,"
   basetype="CHAR" baseattr="unsigned," basearray="18,"/>
 <function name="SendResponse" line="68" file="Slave.c" 
  basetype="VOID" baseattr="">
  <var name="ThreadID" line="68" file="Slave.c"
   type="AUTO" storage="AUTO VAR" attr="param,"
   basetype="CHAR" baseattr="unsigned,"/>
  <var name="BufferPtr" line="68" file="Slave.c"
   type="AUTO" storage="AUTO VAR" attr="param,"
   basetype="VOID" baseattr="ptr,"/>
  <var name="RequestedLength" line="68" file="Slave.c"
   type="AUTO" storage="AUTO VAR" attr="param,"
   basetype="SHORT" baseattr="unsigned,"/>
  <var name="ActualLength" line="68" file="Slave.c"
   type="AUTO" storage="AUTO VAR" attr="param,"
   basetype="SHORT" baseattr="unsigned,"/>
  <block line="68" file="Slave.c">
    <var name="BufferPtr" line="68" file="Slave.c"
     type="AUTO" storage="AUTO VAR" attr="param,"
     basetype="VOID" baseattr="ptr,"/>
    <var name="RequestedLength" line="68" file="Slave.c"
     type="AUTO" storage="AUTO VAR" attr="param,"
     basetype="SHORT" baseattr="unsigned,"/>
    <var name="iocb" line="69" file="Slave.c"
     type="AUTO" storage="AUTO VAR" attr=""
     basename="_usbslave_ioctl_cb_t" basetype="STRUCT" baseattr=""/>
    <var name="ThreadID" line="68" file="Slave.c"
     type="AUTO" storage="AUTO VAR" attr="param,"
     basetype="CHAR" baseattr="unsigned,"/>
    <var name="ActualLength" line="68" file="Slave.c"
     type="AUTO" storage="AUTO VAR" attr="param,"
     basetype="SHORT" baseattr="unsigned,"/>
  </block>
 </function>
 <function name="SendACK" line="79" file="Slave.c" 
  basetype="VOID" baseattr="">
  <var name="ThreadID" line="79" file="Slave.c"
   type="AUTO" storage="AUTO VAR" attr="param,"
   basetype="CHAR" baseattr="unsigned,"/>
  <block line="79" file="Slave.c">
    <var name="iocb" line="80" file="Slave.c"
     type="AUTO" storage="AUTO VAR" attr=""
     basename="_usbslave_ioctl_cb_t" basetype="STRUCT" baseattr=""/>
    <var name="ThreadID" line="79" file="Slave.c"
     type="AUTO" storage="AUTO VAR" attr="param,"
     basetype="CHAR" baseattr="unsigned,"/>
  </block>
 </function>
 <function name="HandleChapter9Request" line="89" file="Slave.c" 
  basetype="VOID" baseattr="">
  <var name="ThreadID" line="89" file="Slave.c"
   type="AUTO" storage="AUTO VAR" attr="param,"
   basetype="CHAR" baseattr="unsigned,"/>
  <var name="Setup" line="89" file="Slave.c"
   type="AUTO" storage="AUTO VAR" attr="param,"
   basename="_usb_deviceRequest_t" basetype="STRUCT" baseattr="ptr,"/>
  <block line="89" file="Slave.c">
    <var name="Setup" line="89" file="Slave.c"
     type="AUTO" storage="AUTO VAR" attr="param,"
     basename="_usb_deviceRequest_t" basetype="STRUCT" baseattr="ptr,"/>
    <var name="Temp" line="90" file="Slave.c"
     type="AUTO" storage="AUTO VAR" attr=""
     basetype="CHAR" baseattr="unsigned,"/>
    <var name="iocb" line="91" file="Slave.c"
     type="AUTO" storage="AUTO VAR" attr=""
     basename="_usbslave_ioctl_cb_t" basetype="STRUCT" baseattr=""/>
    <var name="ThreadID" line="89" file="Slave.c"
     type="AUTO" storage="AUTO VAR" attr="param,"
     basetype="CHAR" baseattr="unsigned,"/>
   <block line="93" file="Slave.c">
    <block line="105" file="Slave.c">
    </block>
   </block>
  </block>
 </function>
 <function name="HandleHIDClassRequest" line="144" file="Slave.c" 
  basetype="VOID" baseattr="">
  <var name="ThreadID" line="144" file="Slave.c"
   type="AUTO" storage="AUTO VAR" attr="param,"
   basetype="CHAR" baseattr="unsigned,"/>
  <var name="Setup" line="144" file="Slave.c"
   type="AUTO" storage="AUTO VAR" attr="param,"
   basename="_usb_deviceRequest_t" basetype="STRUCT" baseattr="ptr,"/>
  <block line="144" file="Slave.c">
    <var name="Setup" line="144" file="Slave.c"
     type="AUTO" storage="AUTO VAR" attr="param,"
     basename="_usb_deviceRequest_t" basetype="STRUCT" baseattr="ptr,"/>
    <var name="iocb" line="145" file="Slave.c"
     type="AUTO" storage="AUTO VAR" attr=""
     basename="_usbslave_ioctl_cb_t" basetype="STRUCT" baseattr=""/>
    <var name="ThreadID" line="144" file="Slave.c"
     type="AUTO" storage="AUTO VAR" attr="param,"
     basetype="CHAR" baseattr="unsigned,"/>
   <block line="147" file="Slave.c">
   </block>
  </block>
 </function>
 <function name="HandleRequest" line="173" file="Slave.c" 
  basetype="VOID" baseattr="">
  <block line="173" file="Slave.c">
    <var name="Setup" line="173" file="Slave.c"
     type="AUTO" storage="AUTO VAR" attr="param,"
     basename="_usb_deviceRequest_t" basetype="STRUCT" baseattr="ptr,"/>
    <var name="ThreadID" line="173" file="Slave.c"
     type="AUTO" storage="AUTO VAR" attr="param,"
     basetype="CHAR" baseattr="unsigned,"/>
   <block line="175" file="Slave.c">
   </block>
  </block>
 </function>
 </file>
</VinTag>
