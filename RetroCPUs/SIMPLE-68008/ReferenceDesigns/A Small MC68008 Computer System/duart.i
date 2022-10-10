
; DUART base address.

duart       equ     $c0001

; DUART register definitions as per application note AN897.

chana       equ     duart+0
mr1a        equ     duart+0
mr2a        equ     duart+0
sra         equ     duart+2
csra        equ     duart+2
cra         equ     duart+4
rba         equ     duart+6
tba         equ     duart+6

ipcr        equ     duart+8
acr         equ     duart+8
isr         equ     duart+10
imr         equ     duart+10
cmsb        equ     duart+12
ctur        equ     duart+12
clsb        equ     duart+14
ctlr        equ     duart+14

chanb       equ     duart+16
mr1b        equ     duart+16
mr2b        equ     duart+16
srb         equ     duart+18
csrb        equ     duart+18
crb         equ     duart+20
rbb         equ     duart+22
tbb         equ     duart+22

ivr         equ     duart+24
ip          equ     duart+26
opcr        equ     duart+26
strc        equ     duart+28
bitset      equ     duart+28
stpc        equ     duart+30
bitres      equ     duart+30

            section one,code

