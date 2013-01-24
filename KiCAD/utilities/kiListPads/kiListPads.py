# kiListPads.py
"""
Program parses a KiCad module file and generates a list of unique pads per part.
"""

import csv
import string
import sys
import os

from sys import argv

"""
Command line processing
"""

if (len(sys.argv) != 3):
  print 'kiListPads.py - Usage kiListPads.py lib1.mod lib1.csv'
  print 'Exiting...'
  exit()
 
fileToRead = argv[1]
fileToWrite = argv[2]

"""
Open the input files
"""

try:
	inFile = open(fileToRead, 'rb')
except IOError:
	print 'Cannot open input file', fileToRead
	exit()

try:
  outCSVFile = csv.writer(open(fileToWrite, 'wb'), delimiter=',', quotechar='\"', quoting=csv.QUOTE_MINIMAL)
except IOError:
  print 'Cannot open output file', fileToWrite
  exit()

inLine = inFile.next()
if inLine[0:17] != 'PCBNEW-LibModule-':
  print 'Expected PCBNEW-LibModule- at the start of the first line, got', inLine[0:17]

outRow = []
outRow.append("Module")
outRow.append("PinNum")
outRow.append("HoleType")
outRow.append("HoleSize")
outRow.append("PadSizeX")
outRow.append("PadSizeY")
outRow.append("AnnularRing")
outRow.append("Notes")
outCSVFile.writerow(outRow)
outRow = []

module = ''
pinNumber = ''
holeType = ''
HoleSize = ''
PadXSize = ''
PadYSize = ''

firstPad = 1
lastModule = ''
lastPinNumber = ''
lastholeType = ''
lastHoleSize = ''
lastPadXSize = ''
lastPadYSize = ''

endLibraryFound = 0

while endLibraryFound == 0:
  wantedString = '$MODULE '
  inLine = inFile.next().strip("\n\r")
  while inLine[0:len(wantedString)] != wantedString:
    inLine = inFile.next().strip("\n\r")
    if len(inLine) == 0:
      exit()
  module = inLine[8:]
  firstPad = 1
  print 'Module -', module
  endModuleFound = 0
  inLine = inFile.next()
  while endModuleFound == 0:
    wantedString = '$PAD'
    while inLine[0:len(wantedString)] != wantedString:
      inLine = inFile.next().strip("\n\r")
    #Sh "1" C 456 456 0 0 0
    wantedString = 'Sh'
    inLine = inFile.next()
    while inLine[0:len(wantedString)] != wantedString:
      inLine = inFile.next()
    lineOffset = inLine.find('"',4)
    pinNumber = inLine[4:lineOffset]
    lineOffset += 1
    if inLine[lineOffset] != ' ':
      print 'expected space after double quote'
      inFile.close()
      outFile.close()
      exit()
    lineOffset += 1
    if inLine[lineOffset] == 'C':
      holeType = 'circle'
    elif inLine[lineOffset] == 'R':
      holeType = 'rect'
    elif inLine[lineOffset] == 'O':
      holeType = 'oval'
    else:
      holeType = 'other'

    lineOffset += 2
    endOffset = inLine.find(' ',lineOffset)
    padXStr = inLine[lineOffset:endOffset]
    PadXSize = float(padXStr) / 10

    lineOffset = endOffset + 1
    endOffset = inLine.find(' ',lineOffset)
    padYStr = inLine[lineOffset:endOffset]
    PadYSize = float(padYStr) / 10

    inLine = inFile.next()
    if inLine[0:2] != 'Dr':
      print 'expected Dr'
      exit()
    lineOffset = 3
    endOffset = inLine.find(' ',lineOffset)
    drillSize = inLine[lineOffset:endOffset]
    HoleSize = float(drillSize) / 10

    # write out the CSV line
    outRow.append(module)
    outRow.append(pinNumber)
    outRow.append(holeType)
    outRow.append(HoleSize)
    outRow.append(PadXSize)
    outRow.append(PadYSize)
    if PadXSize >= PadYSize:
      annularRing = (PadXSize - HoleSize) / 2.0;
    else:
      annularRing = (PadYSize - HoleSize) / 2.0;
    outRow.append(annularRing)
    if firstPad != 1:
      notes = ''
      if pinNumber == lastPinNumber:
        notes += 'Duplicated pin number. '
      if HoleSize != lastHoleSize:
        notes += 'Hole size changed. '
      if PadXSize != lastPadXSize:
        notes += 'Pad X size changed. '
      if PadYSize != lastPadYSize:
        notes += 'Pad Y size changed. '
      if PadXSize != PadYSize:
        notes += 'Pad X and Y sizes are different. '
      if len(notes) > 0:
        outRow.append(notes)
    outCSVFile.writerow(outRow)
    
    outRow = []
    firstPad = 0
    lastModule = module
    lastPinNumber = pinNumber
    lastholeType = holeType
    lastHoleSize = HoleSize
    lastPadXSize = PadXSize
    lastPadYSize = PadYSize

    # cleanup the end and get ready for the next module or pin
    endPadFound = 0
    while endPadFound == 0:
      inLine = inFile.next().strip("\n\r")
      if inLine == '$EndPAD':
        endPadFound = 1
        #print 'end of pad'
    inLine = inFile.next().strip("\n\r")
    foundShape3D = 0
    if inLine == '$SHAPE3D':
      foundShape3D = 1
      #print 'found a shape3d token'
      while foundShape3D == 1:
        inLine = inFile.next().strip("\n\r")
        if inLine == '$EndSHAPE3D':
          foundShape3D = 0
      inLine = inFile.next().strip("\n\r")
      #print inLine
    if inLine[0:10] == '$EndMODULE':
      endModuleFound = 1
      #print 'End of Module Found'
#      inLine = inFile.next().strip("\n\r")
    if inLine == '$EndLIBRARY':
      endLibraryFound = 1
      print 'end of library found'

inFile.close()
exit()
