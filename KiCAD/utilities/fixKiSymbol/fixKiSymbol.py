# fixKicadSymbol.py
"""
fixKicadSymbol.py - Fixes schematic symbols which have a particular class of error.
The symbols have comments inserted between DRAW and ENDDRAW commands.
These comments cause the schematic to print an error message when the library is loaded.
Removing the comments removes the error.
The program works with drag and drop.
Program renames the input file to filename_old.lib.
Program saves the output file with the name of the original library.
"""

import csv
import string
import sys
import os

from sys import argv

print 'fixKicadSymbol.py'

if (len(sys.argv) != 2):
  print len(sys.argv)
  print 'fixKicadSymbol.py - Usage fixKicadSymbol.py filename.lib'
  print 'Exiting...'
  exit()

fileToRead = ""
fileToWrite = ""

fileToRead = argv[1]
fileToWrite = fileToRead[:-4] + "_fix.lib"

try:
	inFile = open(fileToRead, 'rb')
except IOError:
	print 'Cannot open input file', fileToRead
	exit()

try:
	outFile = open(fileToWrite, 'wb')
except IOError:
	print 'Cannot open the output file', fileToRead, ' - Is the file already open in EXCEL?'
	exit()
	
outLine=[]
inDraw = 0
linesFixed = 0
for inLine in inFile:
  if (string.find(inLine,"DRAW",0,4) != -1):
    inDraw = 1
#    print 'found a draw command'
  elif (string.find(inLine,"ENDDRAW",0) != -1):
    inDraw = 0
#    print 'ended a draw command'
  outLine = inLine
  if (inDraw == 0):
#    print outLine
    outFile.write(outLine)
  elif (inLine[0] != '#'):
#    print outLine
    outFile.write(outLine)
  else:
    linesFixed += 1
print 'lines fixed ',
print linesFixed
inFile.close()
outFile.close()
os.rename(fileToRead,fileToRead + "_old.lib")
os.rename(fileToRead[:-4] + "_fix.lib",fileToRead)
