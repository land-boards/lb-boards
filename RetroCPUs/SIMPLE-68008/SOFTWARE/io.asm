
            include "duart.i"

            xref    p_matchword,p_mr1a,p_mr2a,p_mr1b,p_mr2b,p_csra
            xref    p_csrb,p_checksum,p_termport,termport,auxport,keyflag
            xref    monstk

            xref    skipspc,matchtoken,toupper,synerr,crlf,puts,prompt

            xdef    bitset,bitres,ip

            xdef    dinit,getchar,putchar,baudcmd,modecmd

            section one,code

            ; Power-up initialize of UART and UART configuration table.

matchval    equ     $4b454550

dinit       bsr     keepcheck
            beq.s   isvalid

            ; Stored values were corrupt, so start off with defaults:
            ; Both ports at 9600 bps, 8N1, no CTS/RTS, and port A is the
            ; terminal port.

            lea     p_matchword,a3
            move.l  #matchval,(a3)+
            move.l  #$1307bb13,(a3)+
            move.l  #$07bb0000,(a3)+

            ; Now read the dip switches, and set up accordingly.

            lea     p_mr1a,a2
            move.b  ip,d0
            btst    #5,d0
            bne.s   notportb
            move.w  #1,p_termport
            addq    #3,a2
notportb
            and.w   #%11000,d0
            lsr.w   #3,d0
            lea     baudtbl,a1
            move.b  0(a1,d0.w),2(a2)
            bsr     dopchk
            move.w  d0,(a3)+

isvalid
            bsr     initptrs

            move.b  #$80,acr            ; Use baud rate set 2
            move.b  p_csra,csra         ; Set port A baud rate
            move.b  #$10,cra            ; Select MR1A
            move.b  p_mr1a,mr1a
            move.b  p_mr2a,mr2a
            move.b  p_csrb,csrb         ; Set port B baud rate
            move.b  #$10,crb            ; Select MR1B
            move.b  p_mr1b,mr1b
            move.b  p_mr2b,mr2b
            move.b  #$05,cra            ; Enable channel A TX/RX
            move.b  #$05,crb            ; Enable channel B TX/RX

            rts

            section three,data

baudtbl     dc.b    %01100110,%10001000,%10011001,%10111011

            section one,code

initptrs
            lea     chana,a0
            lea     chanb,a1
            tst.w   p_termport
            beq.s   notswitch
            exg     a0,a1
notswitch   movem.l a0-a1,termport
            rts

keepcheck   cmpi.l  #matchval,p_matchword
            bne.s   notvalid
            bsr     dopchk
            cmp.w   p_checksum,d0
notvalid    rts

keepfix     bsr     dopchk
            move.w  d0,p_checksum
            rts

dopchk      move.w  p_mr1a,d0
            add.w   p_csra,d0
            add.w   p_mr2b,d0
            add.w   p_termport,d0
            rts

getchar     move.l  termport,a0

getc        btst.b  #0,2(a0)
            beq     getc
            move.b  6(a0),d0
            rts

putchar     move.l  termport,a0
put2        btst.b  #0,2(a0)
            beq.s   putc
            cmp.b   #19,6(a0)
            bne.s   gotkey
wloop       btst.b  #0,2(a0)
            beq     wloop
            btst.b  #0,6(a0)
            bra.s   put2
gotkey:
            st.b    keyflag

putc        btst.b  #2,2(a0)
            beq     putc
            move.b  d0,6(a0)
            rts

baudcmd
            bsr     keepverify
            bsr     getab
            bsr     skipspc
            beq.s   showbaud
            lea     baudtbl2,a0
            clr.l   d1
            bsr     matchtoken
            tst.w   d0
            bpl.s   baudvalid
            lea     validstr,a0
            bsr     puts
            lea     baudtbl2,a2
            bsr     dumptokens
baudvalid
            move.b  d0,d2
            bsr     skipspc
            bne     synerr
            move.b  d2,d0
            asl.b   #4,d0
            or.b    d2,d0
            move.b  d0,2(a6)
            move.b  d0,2(a5)
            bra     keepfix
showbaud
            lea     baudtbl2,a0
            move.b  2(a6),d0
            and.w   #15,d0
            bra.s   inloop
loop        tst.b   (a0)+
            bne.s   loop
inloop      dbra    d0,loop
            bsr     puts
            bra     crlf

            section two,data

validstr    dc.b    'Invalid, must be one of the following:',13,10,0

baudtbl2    dc.b    '75',0,'110',0,'134.5',0,'150',0,'300',0,'600',0
            dc.b    '1200',0,'2000',0,'2400',0,'4800',0
            dc.b    '1800',0,'9600',0,'19200',0,0

keepmsg     dc.b    'Data table invalid - reset.',13,10,0

            section one,code

dumptokens  move.b  (a2)+,d0
            beq.s   tokend
dcont       bsr     putchar
            bra     dumptokens
tokend      moveq   #' ',d0
            bsr     putchar
            move.b  (a2)+,d0
            bne.s   dcont
            bra     crlf

getab       bsr     skipspc
            beq     synerr
            addq.l  #1,a3
            bsr     toupper
            cmp.b   #'A',d0
            beq.s   gota
            cmp.b   #'B',d0
            bne     synerr
            lea     chanb,a5
            lea     p_mr1b,a6
            rts
gota        lea     chana,a5
            lea     p_mr1a,a6
            rts

keepverify  bsr     keepcheck
            beq.s   keep_ok
            lea     keepmsg,a0
            bsr     puts
            move.l  monstk,a7
            bra     prompt
keep_ok     rts

modecmd
            bsr     keepverify
            bsr     getab
            bsr     skipspc
            bne.s   setmode
            move.b  (a6),d0
            and.b   #3,d0
            add.b   #'5',d0
            bsr     putchar
            move.b  (a6)+,d0
            lsr.b   #2,d0
            and.w   #7,d0
            lea     partbl,a0
            move.b  0(a0,d0.w),d0
            bsr     putchar
            move.b  (a6),d0
            lsr.b   #3,d0
            and.b   #1,d0
            add.b   #'1',d0
            bsr     putchar
            bra     crlf
setmode
            addq.l  #1,a3
            cmp.b   #'7',d0
            beq.s   wordok
            cmp.b   #'8',d0
            beq.s   wordok
            lea     wordmsg,a0
            bra     puts
wordok      sub.b   #'5',d0
            move.b  (a6),d1
            and.b   #$e0,d1
            or.b    d0,d1
            bsr     skipspc
            beq     synerr
            addq.l  #1,a3
            bsr     toupper
            moveq   #4,d2
            lea     partbl,a0
cloop       cmp.b   0(a0,d2.w),d0
            beq.s   gotpar
            dbra    d2,cloop
            lea     parmsg,a0
            bra     puts
gotpar      asl.b   #2,d2
            or.b    d1,d2
            bsr     skipspc
            beq     synerr
            move.b  (a3)+,d3
            bsr     skipspc
            bne     synerr
            cmp.b   #'1',d3
            beq.s   gotstop
            cmp.b   #'2',d3
            beq.s   gotstop
            lea     stopmsg,a0
            bra     puts
gotstop     sub.b   #'1',d3
            asl.b   #3,d3
            ori.b   #7,d3
            move.b  d2,(a6)+
            move.b  (a6),d1
            and.b   #$f0,d1
            or.b    d3,d1
            move.b  d1,(a6)
            move.b  #$10,4(a5)
            move.b  d2,(a5)
            move.b  d1,(a5)
            bra     keepfix

            section two,data

partbl      dc.b    'EOSMNN',0
wordmsg     dc.b    'Invalid word length.',13,10,0
parmsg      dc.b    'Invalid parity mode.',13,10,0
stopmsg     dc.b    'Invalid number of stop bits.',13,10,0

            end
