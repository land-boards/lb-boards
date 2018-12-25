# CompKiCadNets.py
# Compare two KiCad netlists

import time
import string
import sys

fileName1 = "screwduinov2p1.net"
fileName2 = "screwduinov2p1b.net"
 
print "Compare Two KiCad netlists", 
print fileName1,
print 'and',
print fileName2

# open the files for reading
f1 = open(fileName1, "rb") 
f2 = open(fileName2, "rb") 

firstFile = f1.read().split('\n')
firstFileFirstLine = firstFile[0]
secondFile = f2.read().split('\n')
secondFileFirstLine = secondFile[0]

if firstFileFirstLine == secondFileFirstLine:
	print 'Files have identical creation dates/times'
else:
	print fileName1,
	print 'was created',
	print firstFileFirstLine[firstFileFirstLine.index("created")+9:]
	print fileName2,
	print 'was created',
	print secondFileFirstLine[secondFileFirstLine.index("created")+9:]

print firstFile

print 'Closing files'
f1.close()
f2.close()

