"""
kiPL.py
Generate a PL from a netlist.

There is some special coding that is used here.
The fields of the parts need to be named with particular names for this program to work.
This is a setup thing for Kicad and only needs to be done once.
The names must match exactly.

"""
from tkinter import filedialog
from tkinter import *
from tkinter import messagebox

import csv
#import string
import os
import sys

sys.path.append('C:\\HWTeam\\Utilities\\dgCommonModules\\TKDGCommon')
sys.path.append('C:\\Users\\HPz420\\Documents\\GitHub\\land-boards\\lb-Python-Code\\dgCommonModules\\TKDGCommon')
defaultPath = '.'

from dgProgDefaultsTK import *
from dgWriteListtoCSVTK import *

from sys import argv

#print 'kiPL.py'

def errorDialog(errorString):
	messagebox.showerror("Error", errorString)

def infoBox(msgString):
	messagebox.showinfo("kiPL",msgString)

class FindaNetFile:
	def openFile(self):
		global defaultPath
		#Load the default path
		defaultParmsClass = HandleDefault()
		defaultParmsClass.setVerboseMode(False)
		defaultParmsClass.initDefaults()
		defaultPath = defaultParmsClass.getKeyVal('DEFAULT_PATH')
		#print('openFile: defaultPath was :', defaultPath)
		
		fileToRead = self.findNetFile(defaultPath)
		if fileToRead == '':
			return
		if fileToRead.upper()[-3:] != 'NET':
			errorDialog('openFile: ERROR - Expected a net file type')
			exit()
		defaultParmsClass.setVerboseMode(False)
		defaultParmsClass.storeKeyValuePair('DEFAULT_PATH',defaultPath)
		#print('openFile: defaultPath now is :', defaultPath)

		fileToWriteCSV = fileToRead[:-4] + "_PL.csv"
		with open(fileToRead) as file_in:
			inContents = []
			for line in file_in:
				inContents.append(line.strip())
		#print("\nFindaNetFile: inContents",inContents)
		partsList = control.readNetFileIntoPartsList(inContents)
		#print("openFile: partsList",partsList)
#		print 'partsList', partsList
		sortedPL = control.sortPartsList(partsList)
#		print 'sortedPL', sortedPL
		reduxPL = control.combineRefDes(sortedPL)
		try:
			outCSVFile = csv.writer(open(fileToWriteCSV, 'w', newline=''), delimiter=',', quotechar='\"')
		except IOError:
			errorDialog('ERROR - Cannot open the output file.\nIs the file already open in EXCEL?\nClose the file and return.')
			try:
				outCSVFile = csv.writer(open(fileToWriteCSV, 'w', newline=''), delimiter=',', quotechar='\"')
			except IOError:
				errorDialog('ERROR - Tried again,  - Is the file already open in EXCEL?')
				exit()
		outCSVFile.writerow(['Qty','Value','RefDes'])
		outCSVFile.writerows(reduxPL)
		#print 'complete'
		infoBox("PL created")
	
	def	extractPathFromPathfilename(self,fullPathFilename):
		"""Extract Path from fullPathFilename
		"""
		#print("extractPathFromPathfilename: fullPathFilename",fullPathFilename)
		retVal = fullPathFilename[0:fullPathFilename.rfind('/')+1]
		#print("extractPathFromPathfilename: retVal",retVal)
		return(retVal)
		
	def findNetFile(self, startingPath):
		"""findNetFile() - This is the dialog which locates the csv files
	
		:returns: path/name of the file that was selected
		"""
		global defaultPath
		
		filename =  filedialog.askopenfilename(initialdir = defaultPath,title = "Select file",filetypes = (("net files","*.net"),("all files","*.*")))
		#print("findNetFile: filename",filename)
		defaultPath = self.extractPathFromPathfilename(filename)
		#print("findNetFile: defaultPath",defaultPath)
		return (filename)
		
class ControlClass:
	def readNetFileIntoPartsList(self, inList):
		"""
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
		"""

		# LOOKING_FOR_DESIGN = 1
		# LOOKING_FOR_COMPONENTS = 2
		# LOOKING_FOR_COMP = 3
		# IN_COMP = 4
		# GOT_COMP = 5
		# GOT_LIBPARTS = 6

		outRow = []

		progState = 'LOOKING_FOR_DESIGN'
		outCSVList = []
		#print("readNetFileIntoPartsList: inList",inList)
		for inLine in inList:
			if progState == 'LOOKING_FOR_DESIGN':
				if (inLine.find("(design",0) != -1):
					progState = 'LOOKING_FOR_COMPONENTS'
			elif progState == 'LOOKING_FOR_COMPONENTS':
				if (inLine.find("(components",0) != -1):
					progState = 'LOOKING_FOR_COMP'
			elif progState == 'LOOKING_FOR_COMP':
				refDes = 'N/A'
				value = 'N/A'
				footprint = 'N/A'
				mfg = 'N/A'
				mfgPN = 'N/A'
				vendor = 'N/A'
				vendorPN = 'N/A'
				if (inLine.find("(comp (",0) != -1):
					#print("inLine",inLine)
					refDes = inLine[11:-1]
					#print("refDes",refDes)
					progState = 'IN_COMP'
				elif (inLine.find("(libparts",0) != -1):
					progState = 'GOT_LIBPARTS'
			elif progState == 'IN_COMP':
				if (inLine.find("(value",0) != -1):
					value = inLine[7:-1]
				if (inLine.find("(footprint",0) != -1):
				#	print("inLine",inLine)
					footprint = inLine[11:-1]
				#	print("footprint",footprint)
				if (inLine.find("(field (name",0) != -1):
					field = inLine[21:-1]
					if field[len(field) -1] == ')':
						field = field[0:-1]
						if field[len(field) -1] == ')':
							field = field[0:-1]
					if (field.find("MfgPN",0) != -1):
						mfgPN = field[9:]
						if mfgPN[0] == '"' and mfgPN[-1:] == '"':
							mfgPN = mfgPN[1:-1]
					elif (field.find("Mfg PN",0) != -1):
						mfgPN = field[10:]
						if mfgPN[0] == '"' and mfgPN[-1:] == '"':
							mfgPN = mfgPN[1:-1]
					elif (field.find("Mfg",0) != -1):
						mfg = field[5:]
						if mfg[0] == '"' and mfg[len(mfg)-1] == '"':
							mfg = mfg[1:-1]
					elif (field.find("VendorPN",0) != -1):
						vendorPN = field[10:]
						if vendorPN[0] == '"' and vendorPN[len(vendorPN)-1] == '"':
							vendorPN = vendorPN[1:-1]
					elif (field.find("Vendor",0) != -1):
						vendor = field[8:]
						if vendor[0] == '"' and vendor[len(vendor)-1] == '"':
							vendor = vendor[1:-1]
				if (inLine.find("))",0) != -1):
					outRow = []
					outRow.append(refDes)
					outRow.append(value)
					outRow.append(footprint)
					outRow.append(mfg)
					outRow.append(mfgPN)
					outRow.append(vendor)
					outRow.append(vendorPN)
					outCSVList.append(outRow)
					progState = 'LOOKING_FOR_COMP'
			elif progState == 'GOT_LIBPARTS':
				return outCSVList

	def sortPartsList(self, outCSVList):
		# The sorting is kinda weird but it results in something that makes sense
#		print 'In sortPartsList, outCSVList is', outCSVList
		outCSVList = sorted(outCSVList, key = lambda errs: errs[0])		# sort by Ref Des to get them in order
		outCSVList = sorted(outCSVList, key = lambda errs: errs[1])		# sort by Sort by part value
		outCSVList = sorted(outCSVList, key = lambda errs: errs[0][0])	# sort by Sort by part number
		return outCSVList

	def combineRefDes(self,outCSVList):
		""" RefDes,Value,Footprint,Manufacturer,ManufacturerPN,Vendor,VendorPN
		OutList = ['Qty','Value','RefDes','Footprint','Manufacturer','ManufacturerPN','Vendor','VendorPN']
		"""
		previousPart	= []
		gotFirstPart = False
		combinedRefDesString = ''
		inComboPart = False
		outPL = []
		qty = 0
		# for row in outCSVList:
			# print row[0:3]
		for row in outCSVList:
			if gotFirstPart == False:		# the first part gets handled here
				gotFirstPart = True
				qty += 1
				combinedRefDesString += row[0]
			else:
				if row[1:3] == previousPart[1:3]:	# if this part matches the last part
					combinedRefDesString += ',' + row[0]
					inComboPart = True
#					print 'got a match, new combo part ref des', combinedRefDesString
					qty += 1
#					print 'qty', qty
				elif inComboPart == False:	# part didn't match and last part wasn't a combo part
#						outCSVFile.writerow(previousPart)
					outRow = []
					outRow.append(qty)
					outRow += previousPart
					outPL.append(outRow)
					combinedRefDesString = row[0]
#					print 'not match'
					qty = 1
				elif inComboPart:	# part mismatch but last part was combo
					inComboPart = False
					outRow = []
					outRow.append(qty)
					outRow.append(combinedRefDesString)
					outRow += previousPart[1:]
					outPL.append(outRow)
#					print 'changeup, writing new ref des', combinedRefDesString
					combinedRefDesString = row[0]
					qty = 1
			previousPart = row
		# handle the last part
		if inComboPart:
#			qty += 1
			outRow = []
			outRow.append(qty)
			outRow.append(combinedRefDesString)
			outRow += row[1:]
			outPL.append(outRow)
#			outCSVFile.writerow(outRow)
		else:
			outRow = []
			outRow.append(qty)
			outRow += row
			outPL.append(outRow)
		newOutPL = []
		for row in outPL:
			if row[1].find(',') != -1:
				row[1] = self.sortedRefDes(row[1])
		for row in outPL:
			newOutPLRow = []
			newOutPLRow.append(row[0])	# Qty
			newOutPLRow.append(row[2])	# Value
			newOutPLRow.append(row[1])	# Ref Des
			#newOutPLRow += row[3:]		# Rest of original line
			newOutPL.append(newOutPLRow)
		# print "Out"
		# for line in newOutPL:
			# print line
		return newOutPL

	def sortedRefDes(self,refString):
		""" Reference designators are pre-sorted but not in an ideal way
		This function sorts reference designators like this one:
		['C1', 'C10', 'C2', 'C3', 'C5', 'C6']
		Into a list like this one:
		['C1', 'C2', 'C3', 'C5', 'C6', 'C10']
		"""
		#print "sortedRefDes: stuff to sort",refString
		refDesList = refString.split(',')
		#print refDesList
		shortestRefDes = 10
		longestRefDes = 0
		newRefDesList = []
		for refDes in refDesList:
			if len(refDes) < shortestRefDes:
				shortestRefDes = len(refDes)
			if len(refDes) > longestRefDes:
				longestRefDes = len(refDes)
		if shortestRefDes == longestRefDes:
			return refString
		else:
			#print "Some sorting to do"	# Example: ['C1', 'C10', 'C2', 'C3', 'C5', 'C6']
			for leng in range(shortestRefDes,longestRefDes+1):
				for refDes in refDesList:
					if len(refDes) == leng:
						newRefDesList.append(refDes)
			#print "newRefDesList",newRefDesList
		newRefDesString = ''
		for item in newRefDesList:
			newRefDesString += item
			newRefDesString += ','
		return newRefDesString[:-1]
	
	def writeOutMWTable(self, outFilePtr, theList):
		"""
		:param outFilePtr: Points to the output file.
		:param theList: The list to write out.

		"""
		outFilePtr.write('{| class="wikitable"\n')
		firstRow = True
		for row in theList:
#			print row
			for cell in row:
				newCell = ''
				if isinstance(cell, int):
					newCell = str(cell)
				else:
					newCell = cell
#				print newCell
				if firstRow:
					outFilePtr.write('! ' + newCell + '\n')					
				else:
					outFilePtr.write('| ' + newCell + '\n')
			firstRow = False
			outFilePtr.write('|-\n')
		outFilePtr.write('|}\n')

	def theExecutive(self):
		"""theExecutive - Function that runs the whole thing
		"""
		global defaultPath
		#Load the default path
		defaultParmsClass = HandleDefault()
		#defaultParmsClass.setVerboseMode(False)
		defaultParmsClass.initDefaults()
		defaultPath = defaultParmsClass.getKeyVal('DEFAULT_PATH')
		#print 'defaultPath was :', defaultPath
		
		myCSV = FindaNetFile()
		fileToRead = myCSV.findNetFile(defaultPath)
		
		if fileToRead.upper()[-3:] != 'NET':
			errorDialog('ERROR - Expected a net file type')
			exit()
		defaultParmsClass.storeKeyValuePair('DEFAULT_PATH',defaultPath)
		#print 'defaultPath now is :', defaultPath

		fileToWriteCSV = fileToRead[:-4] + "_PL.csv"
		fileToWriteMW = fileToRead[:-4] + ".MW"

		try:
			inFile = open(fileToRead, 'rb')
		except IOError:
			errorDialog('ERROR - Cannot open input file')
			exit()

		try:
			outCSVFile = csv.writer(open(fileToWriteCSV, 'wb'), delimiter=',', quotechar='\"', quoting=csv.QUOTE_MINIMAL)
		except IOError:
			errorDialog('ERROR - Cannot open the output file.\nIs the file already open in EXCEL?\nClose the file and return.')
			try:
				outCSVFile = csv.writer(open(fileToWriteCSV, 'wb'), delimiter=',', quotechar='\"', quoting=csv.QUOTE_MINIMAL)
			except IOError:
				errorDialog('ERROR - Tried again,  - Is the file already open in EXCEL?')
				exit()

		try:
			outMWFile = open(fileToWriteMW, 'wb')
		except IOError:
			errorDialog('ERROR - Cannot open the output file.\nIs the file already open in EXCEL?\nClose the file and return.')
			try:
				outMWFile = open(fileToWriteMW, 'wb')
			except IOError:
				errorDialog('ERROR - Tried again,  - Is the file already open in EXCEL?')
				exit()

		partsList = self.readNetFileIntoPartsList(inFile)
#		print 'partsList', partsList
		sortedPL = self.sortPartsList(partsList)
#		print 'sortedPL', sortedPL
		reduxPL = self.combineRefDes(sortedPL)
		outCSVFile.writerow(['Qty','Value','RefDes'])
		outCSVFile.writerows(reduxPL)
		
		self.writeOutMWTable(outMWFile, reduxPL)
		#print 'complete'

class Dashboard:
	def __init__(self):
		self.win = Tk()
		self.win.geometry("320x240")
		self.win.title("kiPL - Create PL from netlist")

	def add_menu(self):
		self.mainmenu = Menu(self.win)
		self.win.config(menu=self.mainmenu)

		self.filemenu = Menu(self.mainmenu)
		self.mainmenu.add_cascade(label="File",menu=self.filemenu)

		self.filemenu.add_command(label="Open Net file",command=netFile.openFile)
		self.filemenu.add_separator()
		self.filemenu.add_command(label="Exit",command=self.win.quit)

		# self.editmenu = Menu(self.mainmenu)
		# self.mainmenu.add_cascade(label="Edit",menu=self.editmenu)

		# self.editmenu.add_command(label="Find")
		# self.editmenu.add_command(label="Replace")

		self.win.mainloop()

if __name__ == "__main__":
	netFile = FindaNetFile()
	control = ControlClass()
	x = Dashboard()
	x.add_menu()
	