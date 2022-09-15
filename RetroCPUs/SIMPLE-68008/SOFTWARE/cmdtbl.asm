
            xdef    cmdtbl,jmptbl
            xref    helpcmd,dbbcmd,dbwcmd,dblcmd,modbcmd,modwcmd,modlcmd
            xref    download,regcmd,fillcmd,movcmd,bpset,bpres,bplist,bpclear
            xref    findcmd,gocmd,stepcmd,baudcmd,modecmd

            section two,data

cmdtbl      dc.b    '?',0
            dc.b    'DB.B',0
            dc.b    'DB.W',0
            dc.b    'DB.L',0
            dc.b    'M.B',0
            dc.b    'M.W',0
            dc.b    'M.L',0
            dc.b    'DLOAD',0
            dc.b    'REGISTERS',0
            dc.b    'FILL',0
            dc.b    'MOVE',0
            dc.b    'BREAK',0
            dc.b    'UNBREAK',0
            dc.b    'BLIST',0
            dc.b    'BCLEAR',0
            dc.b    'FIND',0
            dc.b    'GO',0
            dc.b    'STEP',0
            dc.b    'BAUD',0
            dc.b    'MODE',0
            dc.b    0

            section three,data

jmptbl      dc.l    helpcmd
            dc.l    dbbcmd
            dc.l    dbwcmd
            dc.l    dblcmd
            dc.l    modbcmd
            dc.l    modwcmd
            dc.l    modlcmd
            dc.l    download
            dc.l    regcmd
            dc.l    fillcmd
            dc.l    movcmd
            dc.l    bpset
            dc.l    bpres
            dc.l    bplist
            dc.l    bpclear
            dc.l    findcmd
            dc.l    gocmd
            dc.l    stepcmd
            dc.l    baudcmd
            dc.l    modecmd

            end
