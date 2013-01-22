# mergeKiLibs.py
"""
Program merges two KiCad libraries (schematic libraries) into a single library file.
Program compares the two files and looks for duplicate parts. 
If there are matching part names, the program compares the matching parts.
If the matching part names have identical contents, the merged result is written out.
Parts that are unique to each of the single files are also written out.
The result is _not_ alphabetically sorted.
The parts that have matching part names are not written out.
The parts that have matching part names result in an warning message.
"""

import string
import sys
import os

from sys import argv

"""
Command line processing
"""

if (len(sys.argv) != 4):
  print 'mergeKiLibs.py - Usage mergeKiLibs.py lib1.lib lib2.lib mergedLib.lib'
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

warnings = 0
partCount1 = 0
partCount2 = 0
mergedPartCount = 0
  
#  EESchema-LIBRARY Version 2.3  Date: 15/01/2013 13:55:19

LOOKING_FOR_EESCHEM = 1
LOOKING_FOR_DEF_OR_ENDLIB = 2
LOOKING_FOR_ENDEF = 3
GOT_END_LIBRARY = 4

# read in the first parts list  

indexList1 = []

state = LOOKING_FOR_EESCHEM

for inLine in inFile1:
  if (state == LOOKING_FOR_EESCHEM):
    if inLine[0:16] == 'EESchema-LIBRARY':
      state = LOOKING_FOR_DEF_OR_ENDLIB
      dateOffset = inLine.find('Date: ',0)
      date1 = inLine[dateOffset+6:]
      print 'File 1 -', file1ToRead,
      print '- is dated', date1,
  elif (state == LOOKING_FOR_DEF_OR_ENDLIB):
    if inLine[0:3] == "DEF":
      indexList1.append(inLine[4:].strip("\n\r"))
      state = LOOKING_FOR_ENDEF
    if (inLine[0:12] == '#End Library'):
      state = GOT_END_LIBRARY
  elif (state == LOOKING_FOR_ENDEF):
    if (inLine.find('ENDDEF',0) != -1):
      state = LOOKING_FOR_DEF_OR_ENDLIB

#if (state == GOT_END_LIBRARY):
#  print 'Sucessfully read in the first file'
if (state == LOOKING_FOR_EESCHEM):
  print 'Never got EESCHEM header'
elif (state == LOOKING_FOR_DEF_OR_ENDLIB):
  print 'Never got End Library line, file may still be OK though'
elif (state == LOOKING_FOR_ENDEF):
  print 'Part started, but never ended'

partList1 = []
  
for part in indexList1:
  offsetToSpace = part.find(' ',0)
  partList1.append(part[0:offsetToSpace])

partList1.sort()

#print partList1

# read in the second parts list

indexList2 = []

state = LOOKING_FOR_EESCHEM

for inLine in inFile2:
  if (state == LOOKING_FOR_EESCHEM):
    if inLine[0:16] == 'EESchema-LIBRARY':
      dateOffset = inLine.find('Date: ',0)
      date2 = inLine[dateOffset+6:]
      print 'File 2 -', file2ToRead,
      print '- is dated', date2,
      state = LOOKING_FOR_DEF_OR_ENDLIB
  elif (state == LOOKING_FOR_DEF_OR_ENDLIB):
    if inLine[0:3] == "DEF":
      indexList2.append(inLine[4:].strip("\n\r"))
#      print inLine,
      state = LOOKING_FOR_ENDEF
    if (inLine[0:12] == '#End Library'):
      state = GOT_END_LIBRARY
  elif (state == LOOKING_FOR_ENDEF):
    if (inLine.find('ENDDEF',0) != -1):
      state = LOOKING_FOR_DEF_OR_ENDLIB

#if (state == GOT_END_LIBRARY):
#  print 'Sucessfully read in the second file'
if (state == LOOKING_FOR_EESCHEM):
  print 'Never got EESCHEM header'
elif (state == LOOKING_FOR_DEF_OR_ENDLIB):
  print 'Never got End Library line, file may still be OK though'
elif (state == LOOKING_FOR_ENDEF):
  print 'Part started, but never ended'

partList2 = []
  
for part in indexList2:
  offsetToSpace = part.find(' ',0)
  partList2.append(part[0:offsetToSpace])

partList2.sort()

try:
  outFile = open(fileToWrite, 'wb')
except IOError:
  print 'Cannot open output file', fileToWrite
  exit()

outFile.write('EESchema-LIBRARY Version 2.3  Date: 25/05/2011 21:47:41\n')
outFile.write('#encoding utf-8\n')

#print partList2

part1Lines = []
part2Lines = []

for part in partList1:
  if part in partList2:
    matchedPartLines = []
    #print 'ERROR - Part is in both files', part
    searchString = 'DEF ' + part
    # print 'looking for ', searchString
    inFile1.seek(0)
    inFile2.seek(0)
    matched = 0
    inLine1 = inFile1.next()
    while (matched == 0):
      if inLine1.find(searchString,0) == -1:
        inLine1 = inFile1.next()
      else:
        matched = 1
        # print 'found string in 1st file'
    matched = 0
    inLine2 = inFile2.next()
    while (matched == 0):
      if inLine2.find(searchString,0) == -1:
        inLine2 = inFile2.next()
      else:
        matched = 1
        # print 'found string in 2nd file'
    matchedPartContents = 1
    matchedPartLines.append('#\n')
    matchedPartLines.append('# ')
    matchedPartLines.append(part)
    matchedPartLines.append('\n#\n')
    matchedPartLines.append(inLine1);
    mergedPartCount += 1
    while inLine1.find('ENDDEF',0) == -1:
      if inLine1 != inLine2:
        print 'Warning: Mismatch in common part -', part
        print '1st file -', inLine1,
        print '2nd file -', inLine2,
        matchedPartContents = 0
        warnings += 1
      inLine1 = inFile1.next()
      matchedPartLines.append(inLine1);
      inLine2 = inFile2.next()
    if matchedPartContents == 1:
      # print 'Parts match -', part
      for element in matchedPartLines:
        outFile.write(element)

for part in partList1:
  partCount1 += 1
  searchString = 'DEF ' + part
  if part not in partList2:
    print 'Part is in the 1st list, not the 2nd -', part
    outFile.write('#\n')
    outFile.write('# ')
    outFile.write(part)
    outFile.write('\n#\n')
    mergedPartCount += 1
    inFile1.seek(0)
    matched = 0
    while (matched == 0):
      inLine1 = inFile1.next()
      if inLine1.find(searchString,0) != -1:
        matched = 1
    while (inLine1.find('ENDDEF') == -1):
      outFile.write(inLine1)
      inLine1 = inFile1.next()
    outFile.write(inLine1)

for part in partList2:
  partCount2 += 1
  searchString = 'DEF ' + part
  if part not in partList1:
    print 'Part is in the 2nd list, not the 1st -', part
    outFile.write('#\n')
    outFile.write('# ')
    outFile.write(part)
    outFile.write('\n#\n')
    mergedPartCount += 1
    inFile2.seek(0)
    matched = 0
    while (matched == 0):
      inLine2 = inFile2.next()
      if inLine2.find(searchString,0) != -1:
        matched = 1
    while (inLine2.find('ENDDEF') == -1):
      outFile.write(inLine2)
      inLine2 = inFile2.next()
    outFile.write(inLine2)

outFile.write('#\n')
outFile.write('#End Library\n')

print '1st file has', partCount1,
print 'parts'

print '2nd file has', partCount2,
print 'parts'

print 'Merged file has', mergedPartCount,
print 'parts'

if warnings != 0:
  print 'Program ended with', warnings,
  print 'warnings'

inFile1.close()
inFile2.close()
outFile.close()
exit()
