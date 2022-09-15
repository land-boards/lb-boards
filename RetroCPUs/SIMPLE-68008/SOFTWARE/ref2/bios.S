
.equ DUART_MR1A, 0x8000
.equ DUART_MR2A, 0x8000
.equ DUART_SRA, 0x8002
.equ DUART_CSRA, 0x8002
.equ DUART_CRA, 0x8004
.equ DUART_RHRA, 0x8006
.equ DUART_THRA, 0x8006
.equ DUART_IPCR, 0x8008
.equ DUART_ACR, 0x8008
.equ DUART_ISR, 0x800A
.equ DUART_IMR, 0x800A
.equ DUART_IVR, 0x8018
.equ DUART_OPCR, 0x801A
.equ DUART_SOPR, 0x801C
.equ DUART_ROPR, 0x801E
.equ INPORT_INT_BIT, 7
.equ BREAKB_INT_BIT, 6
.equ RXRDYB_INT_BIT, 5
.equ TXRDYB_INT_BIT, 4
.equ CTRRDY_INT_BIT, 3
.equ BREAKA_INT_BIT, 2
.equ RXRDYA_INT_BIT, 1
.equ TXRDYA_INT_BIT, 0
.equ CRA_RESET_MRA, 0x10
.equ CRA_RESET_RCVR, 0x20
.equ CRA_RESET_XMTR, 0x30
.equ CRA_RESER_ERROR, 0x40
.equ CRA_RESET_BREAK, 0x50
.equ CRA_START_BREAK, 0x60
.equ CRA_STOP_BREAK, 0x70
.equ CRA_DISABLE_TX, 0x08
.equ CRA_ENABLE_TX, 0x04
.equ CRA_DISABLE_RX, 0x02
.equ CRA_ENABLE_RX, 0x01

.equ ASCII_CR, 13
.equ ASCII_LF, 10

.equ INT_MASK, ~0x0700
.equ SSP_INIT, 0x17E00
.equ BUFR_SIZE, 128
.equ BUFR_SIZE_MASK, BUFR_SIZE - 1

    .org 0x00000000

TXRDYA_IV: .ds.l 1, SSP_INIT
RXRDYA_IV: .ds.l 1, INIT_RESET
BREAKA_IV: .ds.l 1, ERROR_RESET
CTRRDY_IV: .ds.l 1, ERROR_RESET
TXRDYB_IV: .ds.l 1, ERROR_RESET
RXRDYB_IV: .ds.l 1, ERROR_RESET
BREAKB_IV: .ds.l 1, ERROR_RESET
INPORT_IV: .ds.l 1, ERROR_RESET

RXBUFR: .ds.l(BUFR_SIZE / 4) - 8, ERROR_RESET
    .ds.l 1, BIOS_CALL
TXBUFR: .ds.l(BUFR_SIZE / 4) - 1, ERROR_RESET
    .ds.l 1, DUART_INT
CMND_BUFR: .ds.l(BUFR_SIZE / 4), 0xffffffff
TXTOP: .ds.b 2, 0xff
TXBOT: .ds.b 2, 0xff
RXTOP: .ds.b 2, 0xff
RXBOT: .ds.b 2, 0xff
IMR_IMAGE: .ds.b 1, 0xff
ISR_IMAGE: .ds.b 1, 0xff

    .org 0x00000400, 0xff

    .global _start
_start:
ERROR_RESET:
    reset
INIT_RESET:
    moveal #SSP_INIT, %sp
    moveal #SSP_INIT, %fp
    clrw %fp@(TXTOP)
    clrw %fp@(TXBOT)
    clrw %fp@(RXTOP)
    clrw %fp@(RXBOT)

    moveal #ERROR_RESET, %a0
    movel %a0, %fp@(INPORT_IV)
    movel %a0, %fp@(BREAKB_IV)
    movel %a0, %fp@(RXRDYB_IV)
    movel %a0, %fp@(TXRDYB_IV)
    movel %a0, %fp@(CTRRDY_IV)
    movel %a0, %fp@(BREAKA_IV)
    movel #RX_INT, %fp@(RXRDYA_IV)
    movel #TX_INT, %fp@(TXRDYA_IV)

    moveb #CRA_RESET_RCVR, (DUART_CRA).w
    moveb #CRA_RESET_XMTR, (DUART_CRA).w
    moveb #CRA_RESET_MRA, (DUART_CRA).w
    moveb #0x13, (DUART_MR1A).w
    moveb #7, (DUART_MR2A).w
    moveb #0xbb, (DUART_CSRA).w
    moveb #3, (DUART_IMR).w
    moveb #3, %fp@(IMR_IMAGE)
    moveb #64, (DUART_IVR).w
    moveb #CRA_ENABLE_RX, (DUART_CRA).w
    movew #0x2000, %sr

    /* loop */
    moveal #HEADER, %a2
    bsrw PUTS

COMMAND_LOOP:
    moveal #PROMPT, %a2
    bsrw PUTS

    lea %fp@(CMND_BUFR), %a2
    movew #BUFR_SIZE, %d4
    bsrw GETS
    lea %fp@(CMND_BUFR), %a2
    moveb %a2@+, %d0
    orib #32, %d0

    cmpib #'d', %d0
    bnes COMMAND_LOOP_1
    bsrw DUMP_MEMORY
    bras COMMAND_LOOP

COMMAND_LOOP_1:
    cmpib #'f', %d0
    bnes COMMAND_LOOP_2
    bsrw FILL_MEMORY
    bras COMMAND_LOOP

COMMAND_LOOP_2:
    cmpib #'s', %d0
    bnes COMMAND_LOOP_3
    bsrw DOWNLOAD
    bras COMMAND_LOOP

COMMAND_LOOP_3:
    cmpib #'j', %d0
    bnes COMMAND_LOOP_4
    bsrw JSR_TO
    bras COMMAND_LOOP

COMMAND_LOOP_4:
    cmpib #'?', %d0
    bnes COMMAND_LOOP
    moveaw #MENU_STR, %a2
    bsrw PUTS
    bras COMMAND_LOOP

MENU_STR:
    .ascii "D ADRS COUNT       - Dump Memory\r\n"
    .ascii "F ADRS VALUE COUNT - Fill Memory\r\n"
    .ascii "J ADRS             - JSR To Adrs\r\n"
    .ascii "S2xxx              - Download Hex Record\r\n"
    .ascii "?                  - Menu\r\n\0"
HEADER:
    .asciz "Mini 68008 BIOS\r\n"
PROMPT:
    .asciz ">"

DUART_INT:
    moveml %d0-%d1/%a0, %sp@-
    moveb (DUART_ISR).w, %d0
    andb %fp@(IMR_IMAGE),%d0
    moveb %d0,%fp@(ISR_IMAGE)
    btst #CTRRDY_INT_BIT,%d0
    beqs DUART_INT_1
    moveal %fp@(CTRRDY_IV),%a0
    jsr %a0@

DUART_INT_1:
    btst #INPORT_INT_BIT,%fp@(ISR_IMAGE)
    beqs DUART_INT_2
    moveal %fp@(INPORT_IV),%a0
    jsr %a0@

DUART_INT_2:
    btst #RXRDYA_INT_BIT,%fp@(ISR_IMAGE)
    beqs DUART_INT_3
    moveal %fp@(RXRDYA_IV),%a0
    jsr %a0@

DUART_INT_3:
    btst #RXRDYB_INT_BIT,%fp@(ISR_IMAGE)
    beqs DUART_INT_4
    moveal %fp@(RXRDYB_IV),%a0
    jsr %a0@

DUART_INT_4:
    btst #TXRDYA_INT_BIT,%fp@(ISR_IMAGE)
    beqs DUART_INT_5
    moveal %fp@(TXRDYA_IV),%a0
    jsr %a0@

DUART_INT_5:
    btst #TXRDYB_INT_BIT,%fp@(ISR_IMAGE)
    beqs DUART_INT_6
    moveal %fp@(TXRDYB_IV),%a0
    jsr %a0@

DUART_INT_6:
    btst #BREAKB_INT_BIT,%fp@(ISR_IMAGE)
    beqs DUART_INT_7
    moveal %fp@(BREAKB_IV),%a0
    jsr %a0@

DUART_INT_7:
    btst #BREAKA_INT_BIT,%fp@(ISR_IMAGE)
    beqs DUART_INT_X
    moveal %fp@(BREAKA_IV),%a0
    jsr %a0@

DUART_INT_X:
    moveml %sp@+,%d0-%d1/%a0
    rte

TX_INT:
    movew %fp@(TXBOT),%d0
    cmpw %fp@(TXTOP),%d0
    bnes TX_INT_1
    moveb #CRA_DISABLE_TX, (DUART_CRA).w
    bras TX_INT_X
TX_INT_1:
    lea %fp@(TXBUFR),%a0
    moveb %a0@(0,%d0:w),(DUART_THRA).w
    addqw #1,%d0
    andiw #BUFR_SIZE_MASK,%d0
    movew %d0,%fp@(TXBOT)
TX_INT_X:
    rts

PUTC:
    movew %fp@(TXTOP),%d1
    movew %d1,%d0
    addqw #1,%d1
    andiw #BUFR_SIZE_MASK,%d1
PUTC_1:
    cmpw %fp@(TXBOT),%d1
    beqs PUTC_1
    lea %fp@(TXBUFR),%a0
    moveb %d2,%a0@(0,%d0:w)
    movew %d1,%fp@(TXTOP)
    moveb #CRA_ENABLE_TX, (DUART_CRA).w
    rts

PUTS:
    moveb %a2@+,%d2
    beqs PUTS_X
    bsrs PUTC
    bras PUTS
PUTS_X:
    rts

RX_INT:
    moveb (DUART_RHRA).w,%d1
    lea %fp@(RXBUFR),%a0
    movew %fp@(RXTOP),%d0
    addaw %d0,%a0
    addqw #1,%d0
    andiw #BUFR_SIZE_MASK,%d0
    cmpw %fp@(RXBOT),%d0
    beqs RXINT_X
    moveb %d1,%a0@
    movew %d0,%fp@(RXTOP)
RXINT_X:
    rts

GETC:
    clrl %d2
    movew %fp@(RXBOT),%d1
    cmpw %fp@(RXTOP),%d1
    beqs GETC_X
    lea %fp@(RXBUFR),%a0
    moveb %a0@(0,%d1:w),%d2
    addqw #1,%d1
    andiw #BUFR_SIZE_MASK,%d1
    movew %d1,%fp@(RXBOT)
    addql #1,%d1
GETC_X:
    rts

GETS:
    subqw #1,%d4
    beqs GETS_X
GETS_1:
    bsrs GETC
    beqs GETS_1
    cmpb #ASCII_CR,%d2
    beqs GETS_X
    moveb %d2,%a2@+
    bras GETS
GETS_X:
    clrb %a2@
    rts

JSR_TO:
    lea %fp@(CMND_BUFR+1),%a2
    bsrw PARSE_PARM
    moveal %d0,%a0
    jsr %a0@
    rts

DOWNLOAD:
    lea %fp@(CMND_BUFR),%a2
    moveb %a2@+,%d0
    cmpb #'2',%d0
    bnew DOWNLOAD_X
    movew #2,%d4
    bsrw HEX2INT
    movel %d0,%d6
    movel %d0,%d7
    subqw #4,%d6
    movew #6,%d4
    bsrw HEX2INT
    moveal %d0,%a3
    addb %d0,%d7
    lsrl #8,%d0
    addb %d0,%d7
    lsrl #8,%d0
    addb %d0,%d7
DOWNLOAD_1:
    tstw %d6
    beqs DOWNLOAD_2
    movew #2,%d4
    bsrw HEX2INT
    moveb %d0,%a3@+
    addb %d0,%d7
    subqw #1,%d6
    bras DOWNLOAD_1
DOWNLOAD_2:
    movew #2,%d4
    bsrw HEX2INT
    addb %d0,%d7
    addqb #1,%d7
    beqs DOWNLOAD_X
    moveb #'X',%d2
    bsrw PUTC
DOWNLOAD_X:
    rts

HEX2INT:
    clrl %d0
HEX2INT_1:
    moveb %a2@+,%d1
    orib #32,%d1
    subib #48,%d1
    bmis HEX2INT_X

    cmpb #9,%d1
    bles HEX2INT_2

    subib #39,%d1
    bmis HEX2INT_X

    cmpb #15,%d1
    bgts HEX2INT_X

HEX2INT_2:
    lsll #4,%d0
    orb %d1,%d0
    subqw #1,%d4
    bnes HEX2INT_1
HEX2INT_X:
    rts

PARSE_PARM:
    movew #' ',%d0
PARSE_PARM_1:
    cmpb %a2@,%d0
    bnes PARSE_PARM_2
    addql #1,%a2
    bras PARSE_PARM_1
PARSE_PARM_2:
    movew #8,%d4
    bsrw HEX2INT
    rts

FILL_MEMORY:
    lea %fp@(CMND_BUFR + 1),%a2
    bsrw PARSE_PARM
    moveal %d0,%a3
    bsrw PARSE_PARM
    movew %d0,%d7
    bsrw PARSE_PARM
    movew %d0,%d6
FILL_MEMORY_1:
    moveb %d7,%a3@+
    subqw #1,%d6
    bnes FILL_MEMORY_1
    rts

DUMP_MEMORY:
    lea %fp@(CMND_BUFR + 1),%a2
    bsrw PARSE_PARM
    moveal %d0,%a3
    bsrw PARSE_PARM
    movew %d0,%d7
    subqw #1,%d7
DUMP_MEMORY_1:
    movel %a3,%d4
    movew #3,%d5
    bsrw PRINT_HEX
    movew #15,%d6
DUMP_MEMORY_2:
    moveb #' ',%d2
    bsrw PUTC
    moveb %a3@+,%d4
    movew #1,%d5
    bsrw PRINT_HEX
    dbf %d6,DUMP_MEMORY_2
    moveb #ASCII_CR,%d2
    bsrw PUTC
    moveb #ASCII_LF,%d2
    bsrw PUTC
    dbf %d7,DUMP_MEMORY_1
    rts

DIGIT_TABLE:
    .ascii "0123456789ABCDEF"

PRINT_HEX:
    lslw #3,%d5
    rorl %d5,%d4
    lsrw #2,%d5
    subqw #1,%d5
PRINT_HEX_1:
    roll #4,%d4
    movew %d4,%d2
    andiw #15,%d2
    moveb %pc@(DIGIT_TABLE,%d2:w),%d2
    bsrw PUTC
    dbf %d5,PRINT_HEX_1
    rts

ENABLE_ISR:
    movew %d1,%d0
    lslw #2,%d0
    lea %fp@(TXRDYA_IV,%d0:w),%a0
    movel %a1,%a0@
    moveb #1,%d0
    lslb %d1,%d0
    orb %d0,%fp@(IMR_IMAGE)
    moveb %fp@(IMR_IMAGE),(DUART_IMR).w
    rts

DISABLE_ISR:
    moveb #1,%d0
    lslb %d1,%d0
    notb %d0
    andb %d0,%fp@(IMR_IMAGE)
    moveb %fp@(IMR_IMAGE),(DUART_IMR).w
    rts

BIOS_CALL:
    moveal #BIOS_CALL_TABLE,%a0
    lslw #2,%d0
    moveal %a0@(0,%d0:w),%a0
    jsr %a0@
    rte

BIOS_CALL_TABLE:
    .ds.l 1,GETC
    .ds.l 1,PUTC
    .ds.l 1,GETS
    .ds.l 1,PUTS
    .ds.l 1
    .ds.l 1,PRINT_HEX
    .ds.l 1,ENABLE_ISR
    .ds.l 1,DISABLE_ISR


