
            include "mon.i"

            xdef    curradr,monstk,r_pc,r_ssp,r_usp,r_a0,r_d0,r_sr
            xdef    bptbl,bpinstbl,lbuf,checksum,mon_stk,user_stk,step_count

            xdef    p_matchword,p_mr1a,p_mr2a,p_csra,p_mr1b,p_mr2b,p_csrb
            xdef    p_termport,p_checksum,keyflag,termport,auxport

bssbase     equ     $0400

curradr     equ     bssbase

monstk      equ     curradr+4

r_pc        equ     monstk+4
r_ssp       equ     r_pc+4
r_usp       equ     r_ssp+4
r_d0        equ     r_usp+4
r_a0        equ     r_d0+32
r_sr        equ     r_a0+28

bptbl       equ     r_sr+2
bpinstbl    equ     bptbl+numbrks*4+4

lbuf        equ     bpinstbl+numbrks*2

checksum    equ     lbuf+82
keyflag     equ     checksum+1

step_count  equ     keyflag+1

p_matchword equ     step_count+2        ; Contains 'PORT' when initialized.
p_mr1a      equ     p_matchword+4
p_mr2a      equ     p_mr1a+1
p_csra      equ     p_mr2a+1
p_mr1b      equ     p_csra+1
p_mr2b      equ     p_mr1b+1
p_csrb      equ     p_mr2b+1
p_termport  equ     p_csrb+1
p_checksum  equ     p_termport+2        ; Contains 16-bit checksum of above.

termport    equ     p_checksum+2
auxport     equ     termport+4

mon_stk     equ     $0800
user_stk    equ     $8000

            end
