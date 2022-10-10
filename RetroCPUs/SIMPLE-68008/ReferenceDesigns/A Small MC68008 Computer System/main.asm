
            include "mon.i"
            include "duart.i"

            xref    dinit,getchar,putchar,doputc
            xref    curradr,monstk,r_pc,r_ssp,r_usp,r_a0,r_d0,r_sr,bptbl
            xref    lbuf,checksum,mon_stk,user_stk,keyflag
            xref    cmdtbl,jmptbl

            xref    initexc

            xdef    helpcmd,dbbcmd,dbwcmd,dblcmd,modbcmd,modwcmd,modlcmd
            xdef    download,regcmd,fillcmd,movcmd,bpset,bpres,bplist,bpclear
            xdef    findcmd,dumpregs,prompt

            xdef    getline,crlf,skipspc,gethex,printhex,puts
            xdef    synerr,matchtoken,toupper

            section one,code

            dc.l    mon_stk
            dc.l    mon_base

mon_base
            move.w  #$2700,sr
            move.b  #boot_bit!led_bit,bitset
            lea     mon_stk,a7

            bsr     dinit
            bsr     initexc
            bsr     initregs
            clr.l   curradr
            clr.l   bptbl

            lea     signon,a0
            bsr     puts

prompt
            move.l  a7,monstk

            moveq   #'M',d0
            bsr     putchar
            moveq   #'>',d0
            bsr     putchar

            lea     lbuf,a0
            moveq   #80,d0
            bsr     getline

            lea     lbuf,a3
            bsr     skipspc
            beq     prompt

            cmp.b   #'.',d0
            beq     dotcmd

            lea     cmdtbl,a0
            moveq   #1,d1
            bsr     matchtoken
            tst.w   d0
            bpl.s   gotcmd

            lea     badcmd,a0
            bsr     puts
            bra     prompt
gotcmd
            asl.w   #2,d0
            lea     jmptbl,a0
            move.l  0(a0,d0.w),a1
            jsr     (a1)
            bra     prompt

helpcmd
            bsr     skipspc
            bne     synerr
            lea     cmdtbl,a2
helploop
            move.b  (a2)+,d0
            beq.s   cmdend
            bsr     putchar
            bra     helploop
cmdend
            tst.b   (a2)
            beq.s   helpend
            moveq   #' ',d0
            bsr     putchar
            bra     helploop
helpend
            bra     crlf

dbbcmd
            moveq   #-1,d2          ;address mask
            moveq   #1,d3           ;address increment
            bra.s   dblock
dbwcmd
            moveq   #-2,d2
            moveq   #2,d3
            bra.s   dblock

dblcmd      moveq   #-2,d2
            moveq   #4,d3
dblock
            move.l  curradr,d0
            bsr     gethex
            and.l   d2,d0
            move.l  d0,a2
            move.l  #256,d0
            bsr     gethex
            move.l  d0,d5
            bsr     skipspc
            bne     synerr
            sf.b    keyflag
dloop3
            move.l  a2,d0
            moveq   #6,d1
            bsr     printhex
            lea     dmpstr1,a0
            bsr     puts
            lea     lbuf,a3

            moveq   #16,d2
dloop4      move.w  d3,d4
            bra.s   inloop
dloop5      move.b  (a2)+,d0
            move.b  d0,(a3)+
            moveq   #2,d1
            bsr     printhex
inloop
            dbra    d4,dloop5
            moveq   #' ',d0
            bsr     putchar
            sub.b   d3,d2
            bhi     dloop4
            moveq   #' ',d0
            bsr     putchar
            lea     lbuf,a3
            moveq   #15,d2
dloop6
            move.b  (a3)+,d0
            cmp.b   #' ',d0
            bcs.s   notp
            cmp.b   #127,d0
            bcs.s   isp
notp        move.b  #'.',d0
isp         bsr     putchar
            dbra    d2,dloop6

            bsr     crlf
            tst.b   keyflag
            bne.s   finishdb
            sub.l   #16,d5
            bhi     dloop3
finishdb
            move.l  a2,curradr
            rts

modbcmd
            lea     disb,a2
            lea     storb,a5
            moveq   #-1,d3
            moveq   #1,d4
            bra.s   domod
modwcmd
            lea     disw,a2
            lea     storw,a5
            move.l  #$ffff0000,d2
            moveq   #-2,d3
            moveq   #2,d4
            bra.s   domod
modlcmd
            lea     disl,a2
            lea     storl,a5
            clr.l   d2
            moveq   #-2,d3
            moveq   #4,d4
domod
            move.l  curradr,d0
            bsr     gethex
            and.l   d3,d0
            move.l  d0,a4
            bsr     skipspc
            bne     synerr
modmain
            move.l  a4,d0
            moveq   #6,d1
            bsr     printhex
            lea     dmpstr1,a0
            bsr     puts
            jsr     (a2)
            bsr     printhex
            lea     modstr1,a0
            bsr     puts
            lea     lbuf,a0
            moveq   #80,d0
            bsr     getline
            lea     lbuf,a3
            bsr     skipspc
            beq     modskip
            cmp.b   #'.',d0
            beq     moddone
            bsr     toupper
            cmp.b   #'P',d0
            beq     modback
            cmp.b   #1,d4
            bne     modnum
isbyt
            bsr     getstr
            lea     lbuf,a0
cloop
            move.b  (a0)+,(a4)+
            cmp.l   a5,a0
            bcs     cloop
            bra     modmain
modnum
            bsr     gethex
            move.l  d0,d5
            bsr     skipspc
            beq.s   just1
            lea     synmsg,a0
            bsr     puts
            bra     modmain
just1
            move.l  d5,d0
            and.l   d2,d0
            beq.s   numok
            lea     range,a0
            bsr     puts
            bra     modmain

numok       jsr     (a5)

modskip     add.l   d4,a4
            bra     modmain

modback     sub.l   d4,a4
            bra     modmain

moddone     move.l  a4,curradr
            rts

disb        move.b  (a4),d0
            moveq   #2,d1
            rts
disw        move.w  (a4),d0
            moveq   #4,d1
            rts
disl        move.l  (a4),d0
            moveq   #8,d1
            rts

storb       move.b  d5,(a4)
            rts
storw       move.w  d5,(a4)
            rts
storl       move.l  d5,(a4)
            rts

download
            bsr     skipspc
            bne     synerr
            clr.b   d6              ; Download complete flag
            lea     dlmsg,a0
            bsr     puts

            ; Skip everything up to first 'S'.  This allows garbage (prompts,
            ; commands echoed back, etc) from the host computer to be
            ; skipped, so long as it doesn't contain an S.

waitloop
            bsr     dlgetc
            cmp.b   #'S',d0
            bne     waitloop

            ; Enter here to process a record after the initial 'S' has been
            ; received.

gots
            clr.b   checksum
            bsr     dlgetc

            ; Decode S1, S2, and S3 records (data with 16, 24, and 32-bit
            ; address fields, respectively).

            cmp.b   #'1',d0
            bcs.s   trynext
            cmp.b   #'3',d0
            bhi.s   trynext

            sub.b   #'0',d0
            ext.w   d0
            ext.l   d0
            move.l  d0,d2

            ; The number of address bytes, less 1, is in D2.

dstart
            bsr     dlgetbyt        ; Record length
            move.b  d0,d4
            and.w   #$00ff,d4       ; Store in D4 as 16 bits

            ; Adjust record length.  If it was too small, it will wrap
            ; around to negative.  This is not nice, but survivable, as
            ; we will simply bomb with another error later.

            sub.w   d2,d4
            subq.w  #2,d4

            ; Get address.

            clr.l   d3
aloop
            bsr     dlgetbyt
            asl.l   #8,d3
            or.b    d0,d3
            dbra    d2,aloop

            move.l  d3,a2
            bra.s   inloop2

s2loop      bsr     dlgetbyt
            move.b  d0,(a2)+
inloop2
            dbra    d4,s2loop
            bra.s   dochk

            ; Handle all other kinds of record.
            ; S0 and S5 records are just skipped.

trynext
            cmp.b   #'0',d0
            beq.s   skipit
            cmp.b   #'5',d0
            beq.s   skipit

            ; S7, S8, or S9 records indicate the end of the file.

            cmp.b   #'7',d0
            bcs.s   notsupp
            cmp.b   #'9',d0
            bhi.s   notsupp
            moveq   #1,d6           ; Set the "done" flag.

            ; Continue here to skip the body of a non-data record.

skipit  
            bsr     dlgetbyt
            move.b  d0,d2
skloop      bsr     dlgetbyt
            subq.b  #1,d2
            bne     skloop
            bra.s   dochk2

            ; Finally, get the checksum and verify it.  If OK, start waiting
            ; for the next record.  Otherwise print an error message and
            ; exit.

dochk       bsr     dlgetbyt
dochk2      move.b  checksum,d0
            addq.b  #1,d0
            beq.s   chkdone
            lea     chkmsg,a2
            bra.s   dlerr

            ; If an end record was received, print a message and finish up.

chkdone     moveq   #'.',d0
            bsr     putchar
            tst.b   d6
            beq.s   waitnext
            lea     okmsg,a0
            bra     puts

            ; Allow only non-printable characters (e.g. trailing spaces,
            ; tabs, extra linefeeds, etc) between records.  Any printable
            ; characters are a danger signal - they may mean that an 'S' was
            ; lost and a record is being skipped.  Thus we abort if printable
            ; characters occur between records.

waitnext
            bsr     dlgetc
            cmp.b   #'S',d0
            beq     gots
            cmp.b   #' ',d0
            bls     waitnext
            lea     garbmsg,a2
            bra.s   dlerr

            ; Enter here for an invalid record type (unrecognized character
            ; after the initial "S").

notsupp     lea     supmsg,a2

            ; Enter here for other errors - with a pointer to the error
            ; message in A2.

dlerr       lea     errmsg,a0
            bsr     puts
            move.l  a2,a0
dlerr2      bsr     puts
            move.l  monstk,a7
            bra     prompt

            ; Get a byte as 2 hex digits and update the checksum.

dlgetbyt
            bsr     dlgethex
            asl.b   #4,d0
            move.w  d0,-(a7)
            bsr     dlgethex
            or.w    (a7)+,d0
            move.b  d0,d1
            add.b   checksum,d1
            move.b  d1,checksum
            rts

            ; Get a hex character during download.  Exit with an error
            ; message if a bad character is received.  Upper and lower
            ; case hex is tolerated.

dlgethex
            bsr     dlgetc
            bsr     toupper
            cmp.b   #'0',d0
            bcs.s   baddigit
            cmp.b   #'F',d0
            bhi.s   baddigit
            cmp.b   #'9',d0
            bls.s   isnum2
            cmp.b   #'A',d0
            bcs.s   baddigit
            subq    #7,d0
isnum2      sub.b   #'0',d0
            rts

            ; Print error message for a bad hex digit.

baddigit
            lea     digmsg,a2
            bra     dlerr

            ; Get a character during download.  Exit to monitor prompt
            ; with 'Abort' message if an 'ESC' is received.

dlgetc      bsr     getchar
            cmp.b   #27,d0
            beq     abortdl
            rts
abortdl     lea     abstr,a0
            bra     dlerr2

;------------------------------------------------------------------------
;  Register dump and modify

dotcmd
            addq.l  #1,a3
            bsr     skipspc
            beq     synerr

            lea     rnames,a0
            clr.l   d1
            bsr     matchtoken
            tst.w   d0
            bpl.s   foundreg
            lea     namestr,a0
            bsr     puts
            bra     prompt

foundreg    lea     r_pc,a6
            asl.w   #2,d0
            move.l  d0,d2
            move.l  a1,a5
            bsr     skipspc
            bne.s   notdisp
            move.l  a5,a0
            bsr     puts
            moveq   #'=',d0
            bsr     putchar
            cmp.w   #72,d2
            bcc.s   dispsr
            move.l  0(a6,d2.w),d0
            moveq   #8,d1
regcommon
            bsr     printhex
            bsr     crlf
            bra     prompt
dispsr
            move.w  r_sr,d0
            moveq   #4,d1
            bra     regcommon

notdisp     cmp.b   #'=',d0
            beq.s   noerr

synerr      lea     synmsg,a0
            bsr     puts
            move.l  monstk,a7
            bra     prompt

noerr       addq.l  #1,a3
            bsr     skipspc
            beq     synerr
            bsr     gethex
            move.w  d0,d3
            bsr     skipspc
            bne     synerr
            cmp.w   #72,d2
            bcc.s   setsr
            move.l  d3,0(a6,d2.w)
            bra     prompt
setsr       move.w  d3,d1
            and.w   #$ffff8000,d1
            bne.s   badval
            move.w  d3,r_sr
            bra     prompt
badval      lea     range,a0
            bsr     puts
            bra     prompt

regcmd      bsr     skipspc
            bne     synerr
dumpregs
            lea     pcstr,a0
            bsr     puts
            move.l  r_pc,d0
            moveq   #8,d1
            bsr     printhex
            lea     sspstr,a0
            bsr     puts
            move.l  r_ssp,d0
            moveq   #8,d1
            bsr     printhex
            lea     uspstr,a0
            bsr     puts
            move.l  r_usp,d0
            moveq   #8,d1
            bsr     printhex
            lea     srstr,a0
            bsr     puts
            move.w  r_sr,d0
            moveq   #4,d1
            bsr     printhex
            lea     arstr,a0
            bsr     puts
            lea     r_a0,a2
            moveq   #6,d2
arloop
            moveq   #' ',d0
            bsr     putchar
            move.l  (a2)+,d0
            moveq   #8,d1
            bsr     printhex
            dbra    d2,arloop
            lea     drstr,a0
            bsr     puts
            lea     r_d0,a2
            moveq   #7,d2
drloop
            moveq   #' ',d0
            bsr     putchar
            move.l  (a2)+,d0
            moveq   #8,d1
            bsr     printhex
            dbra    d2,drloop
            bra     crlf

initregs
            move.l  #mon_base,r_pc
            move.l  #user_stk,r_usp
            move.l  #user_stk,r_ssp
            move.w  #$2700,r_sr
            moveq   #14,d0
            lea     r_d0,a0
icloop      clr.l   (a0)+
            dbra    d0,icloop
            rts

;------------------------------------------------------------------------

; Universal token match routine.
;
;   Inputs:  A3 - pointer to current command line location
;            A0 - pointer to token table
;            D1 - zero if exact match required, one if abbreviations
;                 are allowed.
;
;   Outputs: A3 - updated, points to character after token
;            D0 - number of token which was found, or -1 if not found
;            A1 - pointer to string of token which was matched
;
; NOTE: A3 must point to first character of token.  It is up to the caller
;       to ensure that it doesn't point to a space, or the terminating
;       zero of the command line.

matchtoken
            movem.l d2-d3/a2,-(a7)
            clr.l   d3
mrloop
            move.l  a3,a2
            move.l  a0,a1
mloop
            move.b  (a0)+,d2
            beq.s   foundit
            move.b  (a2)+,d0
            tst.w   d1
            beq.s   notabb
            cmp.b   #' ',d0
            beq.s   foundit
            tst.b   d0
            bne.s   notabb
            subq.l  #1,a2
            bra.s   foundit
notabb
            bsr     toupper
            cmp.b   d2,d0
            beq     mloop
msloop
            tst.b   (a0)+
            bne     msloop
            addq.l  #1,d3
            tst.b   (a0)
            bne     mrloop

            moveq   #-1,d3

foundit     move.l  a2,a3
            move.l  d3,d0
            movem.l (a7)+,d2-d3/a2
            rts

;------------------------------------------------------------------------
;  Memory move command

movcmd
            bsr     geta2a4
            bsr     skipspc
            beq     synerr
            bsr     gethex
            move.l  d0,a5
            bsr     skipspc
            bne     synerr

            cmp.l   a2,a5
            bhi.s   movup
            bra.s   iloop4
mloop1
            move.b  (a2)+,(a5)+
iloop4      cmp.l   a4,a2
            bls     mloop1
            rts

movup       move.l  a4,d4
            sub.l   a2,d4
            add.l   d4,a5
            addq.l  #1,a5
            addq.l  #1,a4
            bra.s   iloop5
mloop2
            move.b  -(a4),-(a5)
iloop5      cmp.l   a2,a4
            bhi     mloop2
            rts

;------------------------------------------------------------------------
;  Memory search command

findcmd
            bsr     geta2a4
            bsr     getstr

            clr.b   d7              ; Found flag

            move.b  lbuf,d2

initcmp     lea     lbuf+1,a3

floop0      cmp.l   a4,a2
            bhi.s   fdone
            cmp.b   (a2)+,d2
            bne     floop0

            ; First byte of search string was matched.  Try the rest.

            move.l  a2,a6
floop1      cmp.l   a5,a3
            bcc.s   foundone
            cmp.b   (a3)+,(a6)+
            beq     floop1
            bra     initcmp

foundone
            moveq   #1,d7
            lea     foundstr,a0
            bsr     puts
            move.l  a2,d0
            subq.l  #1,d0
            moveq   #8,d1
            bsr     printhex
            bsr     crlf
            bra     initcmp

fdone       tst.b   d7
            bne.s   fdone1
            lea     nfstr,a0
            bsr     puts
fdone1      rts

;------------------------------------------------------------------------
;  Memory fill command

fillcmd
            bsr     geta2a4
            bsr     skipspc
            bne.s   notstair

            ; Staircase fill

            clr.b   d0
fill1       cmp.l   a4,a2
            bhi.s   filldone
            move.b  d0,(a2)+
            addq.b  #1,d0
            bra     fill1
notstair
            bsr     getstr
startf
            lea     lbuf,a0
fill2       cmp.l   a4,a2
            bhi.s   filldone
            move.b  (a0)+,(a2)+
            cmp.l   a5,a0
            bcs     fill2
            bra     startf
filldone
            rts

;------------------------------------------------------------------------
;  Utility routines to get start/end address, and to get a byte string

geta2a4     bsr     skipspc
            beq     gsynerr
            bsr     gethex
            move.l  d0,a2
            bsr     skipspc
            beq     gsynerr
            bsr     gethex
            move.l  d0,a4
            rts
getstr
            bsr     skipspc
            beq     gsynerr
            lea     lbuf,a5
sloop0
            bsr     skipspc
            beq.s   strdone
            cmp.b   #$27,d0
            beq.s   isquote
            bsr     gethex
            cmp.l   #$100,d0
            bcs.s   numok0
            move.l  monstk,a7
            lea     bsmsg,a0
            bsr     puts
            bra     prompt
numok0
            move.b  d0,(a5)+
            bra     sloop0
isquote
            addq.l  #1,a3
copyit      move.b  (a3)+,d0
            beq.s   strdone
            cmp.b   #$27,d0
            beq.s   sloop0
            move.b  d0,(a5)+
            bra     copyit
strdone     rts

gsynerr
            move.l  monstk,a7
            lea     synmsg,a0
            bsr     puts
            bra     prompt

;------------------------------------------------------------------------
;  Breakpoint table editor

bpset
            bsr     skipspc
            beq     synerr
rloop3
            bsr     skipspc
            beq     bpdone
            bsr     gethex
            bclr    #0,d0
            move.l  d0,d2
            beq     rloop3
            lea     bptbl,a2
            move.l  a2,a4
            moveq   #numbrks-1,d0
rloop4
            cmp.l   (a2),d2
            beq     rloop3
            tst.l   (a2)+
            beq.s   notfull
            dbra    d0,rloop4
            lea     fullmsg,a0
            bra     puts
notfull
            move.l  -(a2),4(a2)
            cmp.l   a2,a4
            beq.s   inhere
            cmp.l   -4(a2),d2
            bcs     notfull
inhere
            move.l  d2,(a2)
            bra     rloop3

bpres       bsr     skipspc
            beq     synerr
rloop0
            bsr     skipspc
            beq.s   bpdone
            bsr     gethex
            move.l  d0,d2
            lea     bptbl,a2
rloop1
            move.l  (a2)+,d0
            beq.s   notfound
            cmp.l   d0,d2
            bne     rloop1

            ; Found breakpoint in list.  A2 points just past it.

rloop2      move.l  (a2)+,-8(a2)
            bne     rloop2
            bra     rloop0

notfound
            lea     bnfmsg,a0
            bsr     puts
            move.l  d2,d0
            moveq   #8,d1
            bsr     printhex
            bsr     crlf
            bra     rloop0

bplist
            tst.l   bptbl
            bne.s   havebp
            lea     nobpmsg,a0
            bra     puts
havebp
            lea     bptbl,a2
bploop      move.l  (a2)+,d0
            beq.s   bpdone
            moveq   #8,d1
            bsr     printhex
            bsr     crlf
            bra     bploop

bpclear     clr.l   bptbl
bpdone      rts

;------------------------------------------------------------------------
;  Utility routines

gethex
            movem.l d2-d5,-(a7)
            move.l  d0,d2
            bsr     skipspc
            beq     nonum

            ; There is something to evaluate here.

            addq.l  #1,a3
            clr.l   d2              ; Number accumulator
            clr.b   d3              ; Decimal flag
            clr.b   d5              ; Minus flag

            ; See if the number is in decimal.

            cmp.b   #'&',d0
            bne.s   tryminus

            ; It is.  Set the decimal flag, and get the next character.  If
            ; it is zero or space, we have an error.

            moveq   #1,d3
            move.b  (a3)+,d0
            beq     badnum
            cmp.b   #' ',d0
            beq     badnum

            ; See if the number is negative.  Set the negative flag if it is.

tryminus
            cmp.b   #'-',d0
            bne.s   afterget
            moveq   #1,d5
            move.b  (a3)+,d0
            beq     badnum
            cmp.b   #' ',d0
            beq     badnum
            bra.s   afterget

            ; Loop.  Get a character, and exit if zero or space.

dloop
            move.b  (a3)+,d0
            beq.s   back1
            cmp.b   #' ',d0
            beq.s   endnum
afterget

            ; Evaluate as hex or decimal digit.

            tst.b   d3
            bne.s   dodec

            ; Hex

            bsr     toupper
            cmp.b   #'0',d0
            bcs.s   badnum
            cmp.b   #'F',d0
            bhi.s   badnum
            cmp.b   #'9',d0
            bls.s   isnum
            cmp.b   #'A',d0
            bcs.s   badnum
            subq    #7,d0
isnum       sub.b   #'0',d0
            asl.l   #4,d2
            add.b   d0,d2
            bra     dloop
dodec

            ; Decimal

            cmp.b   #'0',d0
            bcs.s   badnum
            cmp.b   #'9',d0
            bhi.s   badnum
            sub.b   #'0',d0
            move.l  d2,d4
            asl.l   #2,d2
            add.l   d4,d2
            asl.l   #1,d2
            ext.w   d0
            ext.l   d0
            add.l   d0,d2
            bra     dloop

back1       subq.l  #1,a3
endnum      tst.b   d5
            beq.s   nonum
            neg.l   d2
nonum       move.l  d2,d0
            movem.l (a7)+,d2-d5
            rts

badnum
            lea     badnmsg,a0
            bsr     puts
            move.l  monstk,a7
            bra     prompt

printhex
            move.l  d2,-(a7)
            move.l  a7,a0
            lea     -10(a7),a7
            clr.b   -(a0)
dloop2
            move.b  d0,d2
            and.b   #15,d2
            add.b   #'0',d2
            cmp.b   #'9',d2
            bls.s   outnum
            addq    #7,d2
outnum      move.b  d2,-(a0)
            lsr.l   #4,d0
            sub.b   #1,d1
            bne     dloop2
            bsr     puts
            lea     10(a7),a7
            move.l  (a7)+,d2
            rts

skipspc
            move.b  (a3)+,d0
            cmp.b   #' ',d0
            beq     skipspc
            subq    #1,a3
            tst.b   d0
            rts

crlf
            moveq   #13,d0
            bsr     putchar
putlf       moveq   #10,d0
            bra     putchar

toupper
            cmp.b   #'a',d0
            bcs.s   notlower
            cmp.b   #'z',d0
            bhi.s   notlower
            sub.b   #32,d0
notlower
            rts

getline
            movem.l a2/d2-d3,-(a7)
            move.l  a0,a2
            move.w  d0,d2
gstart
            clr.w   d3
gloop       bsr     getchar
            cmp.b   #13,d0
            beq.s   gotall
            cmp.b   #8,d0
            beq.s   isbs
            cmp.b   #127,d0
            bne.s   notbs
isbs        tst.w   d3
            beq     gloop
            subq.w  #1,d3
            lea     bsstring,a0
            bsr     puts
            bra     gloop
notbs
            cmp.b   #'X'-64,d0
            beq.s   ctrlx
            cmp.b   #' ',d0
            bcs     gloop
            cmp.b   #126,d0
            bhi     gloop
            cmp.w   d2,d3
            bcc     gloop
            move.b  d0,0(a2,d3.w)
            addq.w  #1,d3
            bsr     putchar
            bra     gloop

cxloop      lea     bsstring,a0
            bsr     puts
ctrlx
            dbra    d3,cxloop
            bra     gstart
gotall
            clr.b   0(a2,d3.w)
            movem.l (a7)+,a2/d2-d3
            bra     crlf

puts
            move.l  a2,-(a7)
            move.l  a0,a2
ploop       move.b  (a2)+,d0
            beq     endstr
            bsr     putchar
            bra.s   ploop
endstr
            move.l  (a7)+,a2
            rts

            section two,data

rnames      dc.b    'PC',0,'SSP',0,'USP',0,'D0',0,'D1',0,'D2',0,'D3',0,'D4',0
            dc.b    'D5',0,'D6',0,'D7',0,'A0',0,'A1',0,'A2',0,'A3',0,'A4',0
            dc.b    'A5',0,'A6',0,'SR',0,0

badcmd      dc.b    'Invalid command',13,10,0
badnmsg     dc.b    'Bad number',13,10,0
range       dc.b    'Number out of range',13,10,0
dlmsg       dc.b    'Press ESC to abort download',13,10,0
abstr       dc.b    13,10,'Aborted',13,10,0
errmsg      dc.b    13,10,'Download error - ',0
digmsg      dc.b    'bad hex digit in S-record',13,10,0
supmsg      dc.b    'invalid S-record type',13,10,0
chkmsg      dc.b    'checksum error',13,10,0
garbmsg     dc.b    'garbage between S-records',13,10,0
okmsg       dc.b    13,10,'Download complete',13,10,0
dmpstr1     dc.b    ':  ',0
modstr1     dc.b    ' ? ',0
pcstr       dc.b    'PC = ',0
sspstr      dc.b    '  SSP = ',0
uspstr      dc.b    '  USP = ',0
srstr       dc.b    '  SR = ',0
arstr       dc.b    13,10,'A0-A6:',0
drstr       dc.b    13,10,'D0-D7:',0
namestr     dc.b    'Bad register name',13,10,0
synmsg      dc.b    'Syntax error',13,10,0
nobpmsg     dc.b    'No current breakpoints',13,10,0
bnfmsg      dc.b    'No breakpoint at ',0
fullmsg     dc.b    'Breakpoint table full',13,10,0
bsmsg       dc.b    'Only byte values allowed in string',13,10,0
nfstr       dc.b    'String not found',13,10,0
foundstr    dc.b    'Found at ',0
bsstring    dc.b    8,' ',8,0

signon      dc.b    13,10,'MC68000 Monitor Version 0.11+ (RAM debug version)',13,10
            dc.b    'By Markus Wandel, May 3, 1989',13,10,0

            end
