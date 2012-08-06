# DupsCheck.py
"""
Duplicates checker.
"""

import csv
import string
import sys
import os

from sys import argv

print 'DupsCheck.py'

if (len(sys.argv) != 2):
  print len(sys.argv)
  print 'DupsCheck.py - Usage DupsCheck.py filename.csv'
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

fileToWrite = fileToRead[:-4] + "_duplicates.csv"

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

readCSVRow = inCSVFile.next()
print 'first row is', readCSVRow
readString = readCSVRow[0]
if readString[0] != 'V':
	print 'ERROR - Expected Volume as the first line'
	exit()

inCSVFile.next()  # blank line next

readCSVRow = inCSVFile.next()
if readCSVRow[0] != 'Date':
	print 'ERROR - Expected Date as the third line'
	exit()

filesList = []

# ['ref', 'value', 'footprint', 'Field1', 'Field2', 'Field3', 'Field4']

for row in inCSVFile:
  filesList.append(row)

print filesList

#parts = []
#for row in filesList:
#	if row[3] not in parts:
#		parts.append(row[4])

