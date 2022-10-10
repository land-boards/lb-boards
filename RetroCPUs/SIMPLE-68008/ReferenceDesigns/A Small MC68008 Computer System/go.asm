
            xdef    gocmd,resbp,restore_regs,stepcmd

            xref    gethex,synerr,skipspc
            xref    r_pc,r_ssp,r_usp,r_d0,r_a0,r_sr,bptbl,bpinstbl,step_count

            section one,code

gocmd
            move.l  r_pc,d0
            bsr     gethex
            move.l  d0,r_pc
            bsr     skipspc
            bne     synerr
            bclr.b  #7,r_sr
go_common
            bsr     setbp
restore_regs
            move.l  r_usp,a0
            move.l  a0,usp
            movem.l r_d0,d0-d7/a0-a6
            move.l  r_ssp,a7
            move.l  r_pc,-(a7)
            move.w  r_sr,-(a7)
            rte

stepcmd
            moveq   #1,d0
            bsr     gethex
            move.w  d0,step_count
            bsr     skipspc
            bne     synerr
            tst.w   step_count
            beq.s   nostep
            bset.b  #7,r_sr
            bra     go_common

nostep      rts

setbp
            move.l  r_pc,d0
            lea     bptbl,a0
            lea     bpinstbl,a1
bploop
            tst.l   (a0)
            beq.s   setdone
            move.l  (a0)+,a2
            move.w  (a2),(a1)+

            ; Don't install a breakpoint at the current program counter.
            ; This allows us to continue with "go" after hitting a
            ; breakpoint.

            cmp.l   a2,d0
            beq     bploop
            move.w  #$4e4f,(a2)
            bra     bploop

resbp
            lea     bptbl,a0
            lea     bpinstbl,a1
resloop
            tst.l   (a0)
            beq.s   setdone
            move.l  (a0)+,a2
            move.w  (a1)+,(a2)
            bra     resloop
setdone
            rts

            end
