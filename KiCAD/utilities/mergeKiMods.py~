# fixKiMods.py
"""
Program parses a KiCad module (PCB footprint) file for errors.
Program compares the index table at the start to the modules later.
If the two tables match, the Modules list is printed.
If they don't match, an error message is printed and the differences between the modules and index lists are printed.
If a -s command is passed to the program, any modules with spaces will be removed.
"""

import string
import sys
import os

from sys import argv

"""
Command line processing
"""

stripSpaces = 0

if (len(sys.argv) == 3):
  optsString = argv[1]
  if (optsString == '-s'):
    stripSpaces = 1
    pass
  else:
    print 'Error in options string'
    print 'Options supported are'
    print '  -s =remove modules with spaces in the name'
    exit()
elif (len(sys.argv) != 2):
  print 'fixKiMods.py - Usage fixKiMods.py [opts] filename.lib'
  print 'where opts are'
  print '  -s =remove modules with spaces in their name'
  print 'Exiting...'
  exit()
 
fileToRead = argv[2]

"""
Open the input file
"""

try:
	inFile = open(fileToRead, 'rb')
except IOError:
	print 'Cannot open input file', fileToRead
	exit()

LOOKING_FOR_INDEX = 1
FOUND_INDEX = 2
LOOKING_FOR_MODULES = 3

state = LOOKING_FOR_INDEX

indexList = []
moduleList = []

for inLine in inFile:
  if state == LOOKING_FOR_INDEX:
    if (inLine.find("$INDEX",0) != -1):
        state = FOUND_INDEX
  elif state == FOUND_INDEX:
    if (inLine.find("$EndINDEX",0) != -1):
      state = LOOKING_FOR_MODULES
    else:
      indexList.append(inLine.strip("\n\r"))
  elif state == LOOKING_FOR_MODULES:
    if (inLine.find("$MODULE",0) != -1):
      moduleList.append(inLine[8:].strip("\n\r"))

if len(indexList) != len(moduleList):
  print 'Error: List size mismatch'
else:
  print 'List sizes match'

gotError = 0
if (indexList != moduleList):
  for item in moduleList:
    if item not in indexList:
      print 'Error: Module is not in index list: ', item
      gotError = 1
  for item in indexList:
    if item not in moduleList:
      print 'Error: Index list is missing module: ', item
      gotError = 1
  if gotError == 0:
    print 'Note: Lists match for content, but not in the same order'
else:
  print 'List contents match for content and order'
  print 'Modules are '
  for item in moduleList:
    print item,

modulesWithSpaces = []
print 'Status: Checking for modules with spaces in the name'
for moduleName in moduleList:
  if string.find(moduleName," ",0) != -1:
    modulesWithSpaces.append(moduleName)

if len(modulesWithSpaces) == 0:
  print 'No modules with spaces in the name were found'
  pass
else:
  print 'Error: Found', len(modulesWithSpaces),
  print 'modules with spaces in the name'
  for modName in modulesWithSpaces:
    print modName
  
indexesWithSpaces = []
print 'Status: Checking index for spaces in the names'
for indexName in indexList:
  if string.find(indexName," ",0) != -1:
    indexesWithSpaces.append(indexName)
  
if len(indexesWithSpaces) == 0:
  print 'No index list values with spaces in the name were found'
  pass
else:
  print 'Error: Found', len(indexesWithSpaces),
  print 'index items with spaces in the name'
  for indName in indexesWithSpaces:
    print indName,

if stripSpaces == 0:
  inFile.close()
  exit()

if stripSpaces == 1:
  print 'Action: Deleting modules which have spaces in the name'

outFile = []
try:
	outFile = open("outFile.tmp", 'wb')
except IOError:
	print 'Cannot open output file outFile.mod'
	exit()

inFile.seek(0)
inBadModule = 0
for inLine in inFile:
  currentModule = []
  if inLine.find("$MODULE",0) != -1:
    currentModule = inLine[8:].strip("\n\r")
    if currentModule in modulesWithSpaces:
      print 'Current module',
      print currentModule,
      print 'is in modules with spaces...Deleting'
      inBadModule = 1
  if inBadModule == 0:
    outFile.write(inLine)
  if inLine.find("$EndMODULE",0) != -1:
    inBadModule = 0
inFile.close()
outFile.close()

os.rename(fileToRead,fileToRead[:-4] + "_old.mod")
os.rename("outFile.tmp",fileToRead)
