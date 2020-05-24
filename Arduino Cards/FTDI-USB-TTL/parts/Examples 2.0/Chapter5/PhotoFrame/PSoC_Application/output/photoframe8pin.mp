  ROM 56% full. 2070 bytes used (does not include absolute areas).
  RAM 32% full. 83 bytes used (does not include stack usage).

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   01A0   0101 =    257. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       01A0  _SignOn
       01B0  _NoDrive
       01BF  _NoFiles
       01CE  _SetBaudRate
       01D7  _FileCommand
       01E4  _MP3
       01F1  LoadConfigTBL_photoframe8pin_Ordered
       0249  LoadConfigTBL_photoframe8pin_Bank0
       0272  LoadConfigTBL_photoframe8pin_Bank1
       02A1  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   02A1   005E =     94. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       02A1  _LoadConfigInit
       02A1  LoadConfigInit
       02A8  _LoadConfig_photoframe8pin
       02A8  LoadConfig_photoframe8pin
       02FF  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   02FF   0136 =    310. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       02FF  _UART_TX_ISR
       0300  _UART_RX_ISR
       0301  _UART_EnableInt
       0301  UART_EnableInt
       0308  _UART_DisableInt
       0308  UART_DisableInt
       030F  _UART_SetTxIntMode
       030F  UART_SetTxIntMode
       0321  _UART_Start
       0321  UART_Start
       0328  UART_Stop
       0328  _UART_Stop
       032F  UART_SendData
       032F  _UART_SendData
       0332  UART_bReadTxStatus
       0332  bUART_ReadTxStatus
       0332  _UART_bReadTxStatus
       0332  _bUART_ReadTxStatus
       0335  _bUART_ReadRxData
       0335  _UART_bReadRxData
       0335  UART_bReadRxData
       0335  bUART_ReadRxData
       0338  bUART_ReadRxStatus
       0338  _bUART_ReadRxStatus
       0338  _UART_bReadRxStatus
       0338  UART_bReadRxStatus
       033B  UART_TxIntMode
       033B  _UART_TxIntMode
       034E  UART_IntCntl
       034E  _UART_IntCntl
       0379  UART_PutSHexByte
       0379  _UART_PutSHexByte
       038C  _UART_PutSHexInt
       038C  UART_PutSHexInt
       0393  UART_PutChar
       0393  _UART_PutChar
       039B  _UART_cGetChar
       039B  UART_cGetChar
       03A3  UART_cReadChar
       03A3  _UART_cReadChar
       03BA  _UART_iReadChar
       03BA  UART_iReadChar
       03D0  UART_PutString
       03D0  _UART_PutString
       03DA  UART_Write
       03DA  _UART_Write
       03F2  _UART_CWrite
       03F2  UART_CWrite
       041A  _UART_CPutString
       041A  UART_CPutString
       042C  UART_PutCRLF
       042C  _UART_PutCRLF
       0435  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0435   0581 =   1409. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0435  __text_start
       0435  _OneMillisecond_ISR
       046C  _Wait
       047F  _SwitchUART
       04CA  _WriteVinculum
       051F  _ReadVinculum
       058B  _WriteDisplay
       05B7  _InitializeVinculum
       0613  _InitializeDisplay
       067B  _ReconfigureUART
       06BB  _Display_NoDrive
       0708  _Display_NoFiles
       074B  _ConvertToASCII
       07A5  _main
       0992  __divmodu_8X8_8
       099D  __i_div8_block_util
       09B6  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
               virtual_registers   0000   000A =     10. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  __rY
       0001  __rX
       0002  __r7
       0003  __r6
       0004  __r5
       0005  __r4
       0006  __r3
       0007  __r2
       0008  __r1
       0009  __r0
       000A  __virtual_registers_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   000A   0049 =     73. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       000A  __bss_start
       000A  _FileSize
       000E  _PreScalar
       0010  _CurrentUART
       0011  _Delay
       0012  _Index
       0013  _OutBuffer
       0033  _InBuffer
       0053  __ramareas_end
       0053  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             TOP   0068   00D1 =    209. bytes (abs,ovr,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0068  __Start
       00CE  bGetPowerSetting
       00CE  _bGetPowerSetting

Files Linked      [ module(s) ]

./obj/boot.o	[ boot.asm ]
./obj/main.o	[ main.c ]
<library>	[ uartint.asm, uart.asm, psocconfigtbl.asm, psocconfig.asm, rY.asm, rX.asm, r7.asm, r6.asm, r5.asm ]
[ r4.asm, r3.asm, r2.asm, r1.asm, r0.asm, divmodu_8x8_8_util.asm, i_div8_block_util.asm ]

User Base Address Definitions

lit = 0x1a0
data = 0x0
SSCParmBlk:0x00F7.0x00FF

