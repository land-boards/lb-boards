# kiPL.py
"""
Generate a PL from a netlist.
"""

import csv
import string
import sys
import os

from sys import argv

#print 'kiPL.py'

if (len(sys.argv) != 2):
  print len(sys.argv)
  print 'KiPL.py - Usage KiPL.py netFile.net'
  print 'Exiting...'
  exit()

fileToRead = ""
fileToWrite = ""

fileToRead = argv[1]
if fileToRead.upper()[-3:] != 'NET':
	print 'ERROR - Expected a net file type'
	exit()
#else:
#	print 'Input file is a net file as expected'

fileToWrite = fileToRead[:-4] + "_PL.csv"

try:
	inFile = open(fileToRead, 'rb')
except IOError:
	print 'ERROR - Cannot open input file', fileToRead
	exit()

try:
	outCSVFile = csv.writer(open(fileToWrite, 'wb'), delimiter=',', quotechar='\"', quoting=csv.QUOTE_MINIMAL)
except IOError:
	print 'ERROR - Cannot open the output file', fileToRead,
	print ' - Is the file already open in EXCEL?'
	exit()

LOOKING_FOR_DESIGN = 1
LOOKING_FOR_COMPONENTS = 2
LOOKING_FOR_COMP = 3
IN_COMP = 4
GOT_COMP = 5
GOT_LIBPARTS = 6

'''
  (design
  (components
    (comp (ref J4)
      (value CONN_6)
      (footprint MTA-156-6PIN-ALT)
      (fields
        (field (name Mfg) TE)
        (field (name MfgPN) 640445-6)
        (field (name Vendor) Mouser)
        (field (name VendorPN) 571-6404456)
        (field (name AACPN) 00779-640445-6))
    ...
    (comp (ref J3)
      (value IEC-C14)
      (footprint C14R)
'''

#print 'refDes,Value,Footprint,Manufacturer,ManufacturerPN,Vendor,VendorPN'

outRow = []
outRow.append('RefDes')
outRow.append('Value')
outRow.append('Footprint')
outRow.append('Manufacturer')
outRow.append('ManufacturerPN')
outRow.append('Vendor')
outRow.append('VendorPN')
outCSVFile.writerow(outRow)

progState = LOOKING_FOR_DESIGN
for inLine in inFile:
#  print progState
  inLine = inLine.strip('\n\r')
  if progState == LOOKING_FOR_DESIGN:
    if (string.find(inLine,"(design",0) != -1):
      progState = LOOKING_FOR_COMPONENTS
  elif progState == LOOKING_FOR_COMPONENTS:
    if (string.find(inLine,"(components",0) != -1):
      progState = LOOKING_FOR_COMP
  elif progState == LOOKING_FOR_COMP:
    refDes = 'N/A'
    value = 'N/A'
    footprint = 'N/A'
    mfg = 'N/A'
    mfgPN = 'N/A'
    vendor = 'N/A'
    vendorPN = 'N/A'
    if (string.find(inLine,"(comp (",0) != -1):
      refDes = inLine[15:-1]
      progState = IN_COMP
    elif (string.find(inLine,"(libparts",0) != -1):
      progState = GOT_LIBPARTS
  elif progState == IN_COMP:
    if (string.find(inLine,"(value",0) != -1):
      value = inLine[13:-1]
    if (string.find(inLine,"(footprint",0) != -1):
      footprint = inLine[17:-1]
    if (string.find(inLine,"(field (name",0) != -1):
      field = inLine[21:-1]
      if field[len(field) -1] == ')':
        field = field[0:-1]
        if field[len(field) -1] == ')':
          field = field[0:-1]
#      print 'field -',field
      if (string.find(field,"MfgPN",0) != -1):
        mfgPN = field[7:]
        if mfgPN[0] == '"' and mfgPN[-1:] == '"':
#          print 'mfgPN started and ended with a double quote'
          mfgPN = mfgPN[1:-1]
      elif (string.find(field,"Mfg",0) != -1):
        mfg = field[5:]
        if mfg[0] == '"' and mfg[len(mfg)-1] == '"':
#          print 'mfg started and ended with a double quote', mfg
          mfg = mfg[1:-1]
      elif (string.find(field,"VendorPN",0) != -1):
        vendorPN = field[10:]
        if vendorPN[0] == '"' and vendorPN[len(vendorPN)-1] == '"':
#          print 'vendorPN started and ended with a double quote'
          vendorPN = vendorPN[1:-1]
      elif (string.find(field,"Vendor",0) != -1):
        vendor = field[8:]
        if vendor[0] == '"' and vendor[len(vendor)-1] == '"':
#          print 'vendor started and ended with a double quote'
          vendor = vendor[1:-1]
    if (string.find(inLine,"))",0) != -1):
      '''
      outputString = refDes
      outputString += ','
      outputString += value
      outputString += ','
      outputString += footprint
      outputString += ','
      outputString += mfg
      outputString += ','
      outputString += mfgPN
      outputString += ','
      outputString += vendor
      outputString += ','
      outputString += vendorPN
      print outputString
      '''
      outRow = []6 
      outRow.append(refDes)
      outRow.append(value)
      outRow.append(footprint)
      outRow.append(mfg)
      outRow.append(mfgPN)
      outRow.append(vendor)
      outRow.append(vendorPN)
      outCSVFile.writerow(outRow)
      progState = LOOKING_FOR_COMP
  elif progState == GOT_LIBPARTS:
    print 'Completed'
    exit()
