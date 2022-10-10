
            xdef    initexc
            xref    puts,printhex,dumpregs,prompt,mon_stk,crlf,resbp
            xref    restore_regs
            xref    r_d0,r_usp,r_ssp,r_pc,r_sr,lbuf,bptbl,step_count

            section one,code

;--------------------------------------------------------------------------

initexc
            lea     8,a0

            ; Initialize bus and address error vectors.

            move.l  #berrhnd,(a0)+
            move.l  #aerrhnd,(a0)+

            ; Initialize the next 5 vectors: Illegal instruction, 
            ; Divide by 0, CHK, TRAPV, Privilege violation.

            moveq   #4,d0
            lea     generic1,a1
init1
            move.l  a1,(a0)+
            addq.l  #2,a1
            dbra    d0,init1

            ; Initialise the Trace vector

            move.l  #tracehnd,(a0)+

            ; Initialize the Opcode 1010 and Opcode 1111 vectors.

            move.l  #alineb,(a0)+
            move.l  #flineb,(a0)+

            ; Initialize the next 12 vectors, which are reserved.

            moveq   #11,d0
init2
            move.l  a1,(a0)+
            dbra    d0,init2

            ; Initialize the spurious interrupt vector.

            move.l  #spurious,(a0)+

            ; The next 7 vectors are level 1-7 autovectors.

            moveq   #6,d0
            lea     autovects,a1
init3
            move.l  a1,(a0)+
            addq.l  #2,a1
            dbra    d0,init3

            ; The next 16 vectors are the TRAP vectors.  The first 15 are
            ; initialized to display "Exception: TRAP #n".  The last one
            ; is used to get back into the monitor and for breakpoints.

            moveq   #14,d0
            lea     trapvects,a1
init3a
            move.l  a1,(a0)+
            addq.l  #2,a1
            dbra    d0,init3a

            move.l  #trap15h,(a0)+

            ; Next, 16 more Motorola reserved vectors.

            moveq   #15,d0
            lea     reserved,a1
init4
            move.l  a1,(a0)+
            dbra    d0,init4

            ; And finally, 192 user interrupt vectors.

            move.w  #191,d0
            lea     unini,a1
init5
            move.l  a1,(a0)+
            dbra    d0,init5
            rts

;--------------------------------------------------------------------------

generic1    bsr.s   generichnd      ; Illegal instruction
generic2    bsr.s   generichnd      ; Divide by zero
            bsr.s   generichnd      ; CHK
            bsr.s   generichnd      ; TRAPV
            bsr.s   generichnd      ; Privilege violation
alineb      bsr.s   generichnd      ; Opcode 1010
flineb      bsr.s   generichnd      ; Opcode 1111
reserved    bsr.s   generichnd      ; Motorola reserved vector
spurious    bsr.s   generichnd      ; Spurious interrupt
unini       bsr.s   generichnd      ; Uninitialized vector in 64-255 range

            nop

generichnd
            bsr     save_regs
            lea     excstr,a0
            bsr     puts
            sub.l   #generic2,d2
            lea     generictbl,a0
            move.w  0(a0,d2.w),a0
            add.l   #illeg,a0
            bsr     puts
            bra     entry_common

;--------------------------------------------------------------------------

            section three,data

generictbl
            dc.w    0,div0-illeg,chkv-illeg,trapvv-illeg,priv-illeg
            dc.w    aline-illeg,fline-illeg,resv-illeg
            dc.w    spur-illeg,uninit-illeg

            section two,data

excstr      dc.b    13,10,'EXCEPTION: ',0
illeg       dc.b    'Illegal instruction.',0
div0        dc.b    'Divide by zero.',0
chkv        dc.b    'CHK instruction.',0
trapvv      dc.b    'TRAPV instruction.',0
priv        dc.b    'Privilege violation.',0
aline       dc.b    'Opcode 1010 trap.',0
fline       dc.b    'Opcode 1111 trap.',0
resv        dc.b    'Reserved vector.',0
spur        dc.b    'Spurious interrupt.',0
uninit      dc.b    'Uninitialized user interrupt vector.',0
int1msg     dc.b    'Level ',0
int2msg     dc.b    ' autovector interrupt.',0
trapmsg     dc.b    'TRAP #',0
aerrmsg     dc.b    13,10,'ADDRESS ERROR.',0
berrmsg     dc.b    13,10,'BUS ERROR.    ',0
abmsg1      dc.b    '  Type: ',0
abmsg2      dc.b    '  Address: ',0
abmsg3      dc.b    '  IR: ',0
bpstr       dc.b    13,10,'BREAKPOINT.',0
notbpstr    dc.b    13,10,'Monitor entered.',0


            section one,code

;--------------------------------------------------------------------------

autovects
            bsr.s   autohnd         ; Level 1-7 autovector
            bsr.s   autohnd
            bsr.s   autohnd
            bsr.s   autohnd
            bsr.s   autohnd
            bsr.s   autohnd
            bsr.s   autohnd

            nop
autohnd
            bsr     save_regs
            lea     excstr,a0
            bsr     puts
            lea     int1msg,a0
            bsr     puts
            sub.l   #autovects,d2
            lsr.w   #1,d2
            move.w  d2,d0
            moveq   #1,d1
            bsr     printhex
            lea     int2msg,a0
            bsr     puts
            bra     entry_common

;--------------------------------------------------------------------------

trapvects   bsr.s   traphnd         ; TRAP #0 - TRAP #14
trap1vect   bsr.s   traphnd
            bsr.s   traphnd
            bsr.s   traphnd
            bsr.s   traphnd
            bsr.s   traphnd
            bsr.s   traphnd
            bsr.s   traphnd
            bsr.s   traphnd
            bsr.s   traphnd
            bsr.s   traphnd
            bsr.s   traphnd
            bsr.s   traphnd
            bsr.s   traphnd
            bsr.s   traphnd

            nop
traphnd
            bsr     save_regs
            lea     excstr,a0
            bsr     puts
            lea     trapmsg,a0
            bsr     puts
            sub.l   #trap1vect,d2
            lsr.w   #1,d2
            move.w  d2,d0
            moveq   #1,d1
            bsr     printhex
            bra     entry_common

;--------------------------------------------------------------------------

aerrhnd
            move.l  (a7)+,lbuf
            bsr     save_regs
            lea     aerrmsg,a0
            bra.s   abcommon
berrhnd
            move.l  (a7)+,lbuf
            bsr     save_regs
            lea     berrmsg,a0
abcommon
            move.l  d2,lbuf+4
            bsr     puts
            lea     abmsg1,a0
            bsr     puts
            move.w  lbuf,d0
            moveq   #4,d1
            bsr     printhex
            lea     abmsg2,a0
            bsr     puts
            move.l  lbuf+2,d0
            moveq   #8,d1
            bsr     printhex
            lea     abmsg3,a0
            bsr     puts
            move.w  lbuf+6,d0
            moveq   #4,d1
            bsr     printhex
            bra     entry_common

;--------------------------------------------------------------------------

tracehnd
            sub.w   #1,step_count
            beq.s   trace_done
            rte

trace_done
            subq.l  #4,a7
            bsr     save_regs
            bra     entry_common

;--------------------------------------------------------------------------

trap15h
            subq.l  #4,a7
            bsr     save_regs
            move.l  r_pc,d0
            subq.l  #2,d0
            lea     bptbl,a0
floop
            move.l  (a0)+,d1
            beq.s   notbrk
            cmp.l   d0,d1
            bne     floop

            move.l  d0,r_pc

            lea     bpstr,a0
            bsr     puts
            bra     entry_common

notbrk      bsr     crlf
            bra.s   common2

entry_common
            bsr     crlf
            bsr     dumpregs
common2     bsr     resbp
            bra     prompt

;--------------------------------------------------------------------------

save_regs
            move.w  #$2700,sr
            movem.l d0-d7/a0-a6,r_d0
            move.l  (a7)+,a0
            move.l  (a7)+,d2
            move.w  (a7)+,r_sr
            move.l  (a7)+,r_pc
            move.l  a7,r_ssp
            move.l  usp,a1
            move.l  a1,r_usp
            lea     mon_stk,a7
            jmp     (a0)

        
            end
