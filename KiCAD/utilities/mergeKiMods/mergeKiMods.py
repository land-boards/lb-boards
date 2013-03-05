# mergeKiMods.py
"""
Program merges two KiCad modules (PCB footprint files) into a single file.
Program compares the index tables of the two files and looks for duplicates.
For duplicated parts, if the part is the same then the program can merge.
If the duplicated parts are different an error message is printed and the program ends.
All parts are checked.
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

indexList1.sort()

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

indexList2.sort()
allPartsList = []
partDiffersInBothIndexes = 0
partsInCommonList = []
for part in indexList1:
  if part in indexList2:
#    print 'ERROR - Part is in both files', part
    inFile1.seek(0)
    inFile2.seek(0)
    searchString = '$MODULE ' + part
    inLine1 = ''
    while inLine1 != searchString:
      inLine1 = inFile1.next().strip("\n\r")
#    print 'inLine1', inLine1
    inLine2 = ''
    while inLine2 != searchString:
      inLine2 = inFile2.next().strip("\n\r")
#    print 'inLine2', inLine2
    while (inLine1 == inLine2) and (inLine1[0:10] != '$EndMODULE') and (inLine2[0:10] != '$EndMODULE'):
      inLine1 = inFile1.next().strip("\n\r")
      inLine2 = inFile2.next().strip("\n\r")
    if (inLine1[0:10] != '$EndMODULE') and (inLine1[0:10] != '$EndMODULE'):
      print 'ERROR - Part is in both files but with different contents', part
      print 'Differences at lines'
      print ' file 1 - ',inLine1
      print ' file 2 - ',inLine2
      partDiffersInBothIndexes = 1
    else:
#      print 'Part is identical in both files -', part
      partsInCommonList.append(part)
      allPartsList.append(part)

partsInCommonList.sort()

#print partsInCommonList

if partDiffersInBothIndexes == 1:
  for part in indexList1:
    if part not in indexList2:
      print 'Part is in the first list, not the second', part
  for part in indexList2:
    if part not in indexList1:
      print 'Part is in the second list, not the first', part
  print 'Quitting, parts were in both files with different values, fix one of the files and re-run.'
  exit()
#else:
#  print 'Note: Files can be merged'  

uniqueToList1 = []
for part in indexList1:
  if part not in indexList2:
    uniqueToList1.append(part)
    allPartsList.append(part)
    print 'Note: Part is in file 1 but not file 2 -', part

uniqueToList2 = []
for part in indexList2:
  if part not in indexList1:
    uniqueToList2.append(part)
    allPartsList.append(part)
    print 'Note: Part is in file 2 but not file 1 -', part
    
#print 'parts in file 1 only'
#print uniqueToList1

#print 'parts in file 2 only'
#print uniqueToList2

#print 'parts in both files'
#print partsInCommonList

allPartsList.sort()

#print 'all parts'
#print allPartsList

try:
  outFile = open(fileToWrite, 'wb')
except IOError:
  print 'Cannot open output file', fileToWrite
  exit()

inFile1.seek(0)
inFile2.seek(0)

line = inFile1.next().strip("\n\r")
if line[0:7] != 'PCBNEW-':
  print 'expected PCBNEW- as the first line in the first file'
  exit()

line = inFile2.next().strip("\n\r")
if line[0:7] != 'PCBNEW-':
  print 'expected PCBNEW- as the first line in the second file'
  exit()

foundIndex = 0
while foundIndex == 0:
  line = inFile1.next().strip("\n\r")
  if line.strip("\n\r") == '$INDEX':
    foundIndex = 1

if foundIndex == 0:
  print 'Expected an index in the first file'
  exit()

while foundIndex == 0:
  line = inFile2.next().strip("\n\r")
  if line.strip("\n\r") == '$INDEX':
    foundIndex = 1

if foundIndex == 0:
  print 'Expected an index in the second file'
  exit()

outFile.write('PCBNEW-LibModule-V1  05/03/2013 13:00:00\n')
outFile.write('# encoding utf-8\n')
outFile.write('# Created by mergeKiMods\n')
outFile.write('$INDEX\n')

for part in allPartsList:
  outFile.write(part)
  outFile.write('\n')

outFile.write('$EndINDEX\n')

for part in allPartsList:
  searchString = '$MODULE ' + part
  if part in partsInCommonList or part in uniqueToList1:
    inFile1.seek(0)
    inLine1 = ''
    while inLine1 != searchString:
      inLine1 = inFile1.next().strip("\n\r")
#    print inLine1
    outFile.write(inLine1)
    outFile.write('\n')
    while inLine1[0:10] != '$EndMODULE':
      inLine1 = inFile1.next().strip("\n\r")
      outFile.write(inLine1)
      outFile.write('\n')
  elif part in uniqueToList2:
    inFile2.seek(0)
    inLine2 = ''
    while inLine2 != searchString:
      inLine2 = inFile2.next().strip("\n\r")
#    print inLine2
    outFile.write(inLine2)
    outFile.write('\n')
    while inLine2[0:10] != '$EndMODULE':
      inLine2 = inFile2.next().strip("\n\r")
      outFile.write(inLine2)
      outFile.write('\n')
   
print 'Files sucessfully merged'

inFile1.close()
inFile2.close()
outFile.close()
