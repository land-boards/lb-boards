# kiFeet.py
"""
KiCad utility to compare the footprints from a CMP file vs a netlist file and dump the differences.
The intention is to allow someone who wants to manage the footprints in the netlist to manually
set their footprints in the schematic.

  Author: Douglas Gilliland
  Email: doug at douglasgilliland dot com
  
  Revision History
  2013-03-15 - Created.
"""

import string
import sys
import os

from sys import argv

"""
Command line processing
"""

if (len(sys.argv) != 4):
  print 'KiFeet.py - Usage kiFeet.py cmpfile.cmp netlist.net diffs.txt'
  print 'Exiting...'
  exit()
 
file1ToRead = argv[1]
if file1ToRead[-4:] != '.cmp':
  print 'first file has to be a .cmp file'

file2ToRead = argv[2]
if file2ToRead[-4:] != '.net':
  print 'second file has to be a .net file'

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

# read in the first parts list  

cmpFootprints = []
cmpRefDes = []

for inLine in inFile1:
  if inLine[0:12] == 'Reference = ':
    refDes = inLine[12:].strip("\n\r")
    cmpRefDes.append(refDes[:-1])
#    print 'Got a reference', refDes[:-1]
  elif inLine[0:12] == 'IdModule  = ':
    footprint = inLine[12:].strip("\n\r")
#    print 'Got a Footprint', footprint[:-1]
    cmpFootprints.append(footprint[:-1])

netFootprints = []
netRefDes = []  

gotLastFootprint = 1

for inLine in inFile2:
  if inLine[0:15] == '    (comp (ref ':
    if gotLastFootprint == 0:
      netFootprints.append('')
#    print 'Got a reference', inLine[15:]
    refDes = inLine[15:].strip("\n\r")
    netRefDes.append(refDes[:-1])
    gotLastFootprint = 0
  elif inLine[0:17] == '      (footprint ':
    footprint = inLine[17:].strip("\n\r")
#    print 'Got a Footprint', footprint[:-1]
    netFootprints.append(footprint[:-1])
    gotLastFootprint = 1

#print cmpFootprints
#print cmpRefDes
#print netFootprints
#print netRefDes

#print len(cmpFootprints)
#print len(cmpRefDes)
#print len(netFootprints)
#print len(netRefDes)

if len(cmpFootprints) != len(netFootprints):
  print 'ERROR - There is a difference in the number of parts between the two lists'

lenCmpFile = len(cmpRefDes)
lenNetFile = len(netRefDes)

try:
  outFile = open(fileToWrite, 'wb')
except IOError:
  print 'ERROR - Cannot open output file', fileToWrite
  print '  File may already be open in EXCEL'
  exit()

outFile.write('Comparison Results\n')
outFile.write('First file,')
outFile.write(file1ToRead)
outFile.write('\nSecond file,')
outFile.write(file2ToRead)
outFile.write('\n\n')
outFile.write('"Net Name","Cmp File","Net File"\n')

cmpIndex = 0
while (cmpIndex < lenCmpFile):
#  print 'looking for net named ', cmpRefDes[cmpIndex]
  netIndex = 0
  gotMatch = 0
  while (netIndex < lenNetFile) and (gotMatch == 0):
    if cmpRefDes[cmpIndex] == netRefDes[netIndex]:
      gotMatch = 1
      if cmpFootprints[cmpIndex] != netFootprints[netIndex]:
        print 'ERROR - footprint mismatch for component', cmpRefDes[cmpIndex]
        print ' CMP file has', cmpFootprints[cmpIndex]
        outFile.write('"')
        outFile.write(cmpRefDes[cmpIndex])
        outFile.write('","')
        outFile.write(cmpFootprints[cmpIndex])
        outFile.write('","')
        print ' NET file has',
        if netFootprints[netIndex] == '':
          print '[BLANK]'
          outFile.write('[BLANK]')
        else:
          print netFootprints[netIndex]
          outFile.write(netFootprints[netIndex])
        outFile.write('"\n')
    netIndex += 1
  cmpIndex += 1
