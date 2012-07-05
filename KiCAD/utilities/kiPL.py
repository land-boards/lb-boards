# kiPL.py
"""
KiCad BOM converter - Read in a Parts List created by KiCad and convert it to a format
that can more easily be used by BOM processors, such as Mouser's input format.
"""

import csv
import string
import sys
import os

from sys import argv

print 'kiPL.py'

if (len(sys.argv) != 2):
  print len(sys.argv)
  print 'kiPL.py - Usage kiPL.py filename.csv'
  print 'Exiting...'
  exit()

fileToRead = ""
fileToWrite = ""

fileToRead = argv[1]
if fileToRead.upper()[-3:] != 'CSV':
	print 'ERROR - Expected a CSV file type'
	exit()
else:
	print 'Input file is a CSV file as expected'

fileToWrite = fileToRead[:-4] + "_mouser.csv"

try:
	inCSVFile = csv.reader(open(fileToRead, 'rb'), delimiter='\t')
except IOError:
	print 'ERROR - Cannot open input file', fileToRead
	exit()

try:
	outCSVFile = csv.writer(open(fileToWrite, 'wb'), delimiter=',', quotechar='\"', quoting=csv.QUOTE_MINIMAL)
except IOError:
	print 'ERROR - Cannot open the output file', fileToRead,
	print ' - Is the file already open in EXCEL?'
	exit()
	
firstCSVRow = inCSVFile.next()
#print 'first row is', firstCSVRow
if firstCSVRow[0] != 'ref':
	print 'ERROR - Expected a ref as the first element'
	exit()
outCSVRow = []
outCSVRow.append("Mfg Part Number")
outCSVRow.append("Quantity 1")
outCSVFile.writerow(outCSVRow)	# write out the header

partsList = []

# ['ref', 'value', 'footprint', 'Field1', 'Field2', 'Field3', 'Field4']

for row in inCSVFile:
  outCSVRow = row
  partsList.append(row)

#print partsList

print 'Parts List is', len(partsList),
print 'parts long'

parts = []
for row in partsList:
	if row[4] not in parts:
		parts.append(row[4])

print 'There are ', len(parts),

print 'unique parts'
# print 'Unique parts are', parts

qtys = []
partNum = 0
for part in parts:
	qtys.append(0)
	for inPart in partsList:
		if part == inPart[4]:
			qtys[partNum] += 1
	partNum += 1

numParts = len(parts)
loopCount = 0
while loopCount < numParts:
	outCSVRow = []
	outCSVRow.append(parts[loopCount])
	outCSVRow.append(qtys[loopCount])
	outCSVFile.writerow(outCSVRow)
	loopCount += 1

