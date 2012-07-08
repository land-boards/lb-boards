# mergeKiMods.py
"""
Program merges two KiCad modules (PCB footprint) into a single file.
Program compares the index tables of the two files and looks for duplicates.
"""

import string
import sys
import os

from sys import argv

"""
Command line processing
"""

if (len(sys.argv) != 4):
  print 'mergeKiMods.py - Usage mergeKiMods.py merge1.lib merge2.lib result.lib'
  print 'Exiting...'
  exit()
 
file1ToRead = argv[1]
file2ToRead = argv[2]
fileToWrite = argv[3]

"""
Open the input files
"""

try:
	inFile1 = open(file1ToRead, 'rb')
except IOError:
	print 'Cannot open input file', file1ToRead
	exit()

try:
	inFile2 = open(file2ToRead, 'rb')
except IOError:
	print 'Cannot open input file', file2ToRead
	exit()

LOOKING_FOR_INDEX = 1
FOUND_INDEX = 2
DONE_LOOKING_FOR_INDEXES = 3

state = LOOKING_FOR_INDEX

indexList1 = []

for inLine in inFile1:
	if state == LOOKING_FOR_INDEX:
		if (inLine.find("$INDEX",0) != -1):
		  state = FOUND_INDEX
	elif (state == FOUND_INDEX):
	  if (inLine.find("$EndINDEX",0) != -1):
	    state = DONE_LOOKING_FOR_INDEXES
	  else:
	    indexList1.append(inLine.strip("\n\r"))

state = LOOKING_FOR_INDEX

indexList2 = []

for inLine in inFile2:
	if state == LOOKING_FOR_INDEX:
		if (inLine.find("$INDEX",0) != -1):
		  state = FOUND_INDEX
	elif (state == FOUND_INDEX):
	  if (inLine.find("$EndINDEX",0) != -1):
	    state = DONE_LOOKING_FOR_INDEXES
	  else:
	    indexList2.append(inLine.strip("\n\r"))

partInBothIndexes = 0
for part in indexList1:
  if part in indexList2:
    print 'ERROR - Part is in both files', part
    partInBothIndexes = 1

if partInBothIndexes == 1:
  for part in indexList1:
    if part not in indexList2:
      print 'Part is in the first list, not the second', part
  for part in indexList2:
    if part not in indexList1:
      print 'Part is in the second list, not the first', part
  print 'Quitting, parts were in both files'
  exit()

inFile1.seek(0)
inFile2.seek(0)

try:
	outFile = open(fileToWrite, 'wb')
except IOError:
	print 'Cannot open output file', fileToWrite
	exit()

line = inFile1.next()
outFile.write(line)
line = inFile1.next()
outFile.write(line)

line1 = inFile1.next().strip("\n\r")
if line1 != '$INDEX':
  print 'Expected an index in the first file at the third line'
  exit()

outFile.write('$INDEX\n')

line1 = inFile1.next().strip("\n\r")
while line1 != '$EndINDEX':
  outFile.write(line1)
  outFile.write('\n')
  line1 = inFile1.next().strip("\n\r")

line2 = inFile2.next()
line2 = inFile2.next()
line2 = inFile2.next().strip("\n\r")
if line2 != '$INDEX':
  print 'Expected an index in the second file at the third line'
  exit()

line2 = inFile2.next().strip("\n\r")
while line2 != '$EndINDEX':
  outFile.write(line2)
  outFile.write('\n')
  line2 = inFile2.next().strip("\n\r")

outFile.write('$EndINDEX\n')

line1 = inFile1.next().strip("\n\r")
while line1 != '$EndLIBRARY':
  outFile.write(line1)
  outFile.write('\n')
  line1 = inFile1.next().strip("\n\r")

line2 = inFile2.next().strip("\n\r")
while line2 != '$EndLIBRARY':
  outFile.write(line2)
  outFile.write('\n')
  line2 = inFile2.next().strip("\n\r")

outFile.write('$EndLIBRARY\n')

inFile1.close()
inFile2.close()
#outFile.close()


