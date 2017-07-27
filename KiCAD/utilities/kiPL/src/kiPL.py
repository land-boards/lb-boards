"""
kiPL.py
Generate a PL from a netlist.

There is some special coding that is used here.
The fields of the parts need to be named with particular names for this program to work.
This is a setup thing for Kicad and only needs to be done once.
The names must match exactly.

"""

import pygtk
pygtk.require('2.0')

import gtk

# Check for new pygtk: this is new class in PyGtk 2.4
if gtk.pygtk_version < (2,3,90):
	 print "PyGtk 2.3.90 or later required"
	 raise SystemExit

import csv
import string
import os
import sys

sys.path.append('C:\\Users\\Douglas\\Documents\\GitHub\\lb-Python-Code\\dgCommonModules')
sys.path.append('C:\\HWTeam\\Utilities\\dgCommonModules')
#sys.path.append('C:\\Users\\doug\\Documents\\GitHub\\lb-Python-Code\\dgCommonModules')

defaultPath = '.'

from dgProgDefaults import *
from dgWriteListtoCSV import *

from sys import argv

#print 'kiPL.py'

def errorDialog(errorString):
	"""
	Prints an error message as a dialog box
	"""
	message = gtk.MessageDialog(type=gtk.MESSAGE_ERROR, buttons=gtk.BUTTONS_OK)
	message.set_markup(errorString)
	message.run()		# Display the dialog box and hang around waiting for the "OK" button
	message.destroy()	# Takes down the dialog box
	return

class FindaNetFile:
	def	extractPathFromPathfilename(self,fullPathFilename):
		"""Extract Path from fullPathFilename
		"""
		return(fullPathFilename[0:fullPathFilename.rfind('\\')+1])
		
	def findNetFile(self, startingPath):
		"""findNetFile() - This is the dialog which locates the csv files
	
		:returns: path/name of the file that was selected
		"""
		global defaultPath
		csvFileString = "Select file"
		dialog = gtk.FileChooserDialog(csvFileString,
			None,
			gtk.FILE_CHOOSER_ACTION_OPEN,
			(gtk.STOCK_CANCEL, gtk.RESPONSE_CANCEL,
			gtk.STOCK_OPEN, gtk.RESPONSE_OK))
		dialog.set_default_response(gtk.RESPONSE_OK)

		if startingPath != '':
			dialog.set_current_folder(startingPath)
		filter = gtk.FileFilter()
		filter.set_name("NET files")
		filter.add_pattern("*.net")
		dialog.add_filter(filter)

		response = dialog.run()
		if response == gtk.RESPONSE_OK:
			retFileName = dialog.get_filename()
			dialog.destroy()
			defaultPath = self.extractPathFromPathfilename(retFileName)
			return retFileName
		elif response == gtk.RESPONSE_CANCEL:
			print 'Closed, no files selected'
			dialog.destroy()
			exit()
		dialog.destroy()

class ControlClass:
	def readInParts(self, inFile):
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

		LOOKING_FOR_DESIGN = 1
		LOOKING_FOR_COMPONENTS = 2
		LOOKING_FOR_COMP = 3
		IN_COMP = 4
		GOT_COMP = 5
		GOT_LIBPARTS = 6

		outRow = []

		progState = LOOKING_FOR_DESIGN
		outCSVList = []
		for inLine in inFile:
		#	print progState
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
					if (string.find(field,"MfgPN",0) != -1):
						mfgPN = field[7:]
						if mfgPN[0] == '"' and mfgPN[-1:] == '"':
							mfgPN = mfgPN[1:-1]
					elif (string.find(field,"Mfg",0) != -1):
						mfg = field[5:]
						if mfg[0] == '"' and mfg[len(mfg)-1] == '"':
							mfg = mfg[1:-1]
					elif (string.find(field,"VendorPN",0) != -1):
						vendorPN = field[10:]
						if vendorPN[0] == '"' and vendorPN[len(vendorPN)-1] == '"':
							vendorPN = vendorPN[1:-1]
					elif (string.find(field,"Vendor",0) != -1):
						vendor = field[8:]
						if vendor[0] == '"' and vendor[len(vendor)-1] == '"':
							vendor = vendor[1:-1]
				if (string.find(inLine,"))",0) != -1):
					outRow = []
					outRow.append(refDes)
					outRow.append(value)
					outRow.append(footprint)
					outRow.append(mfg)
					outRow.append(mfgPN)
					outRow.append(vendor)
					outRow.append(vendorPN)
					outCSVList.append(outRow)
					progState = LOOKING_FOR_COMP
			elif progState == GOT_LIBPARTS:
				return outCSVList

	def sortParts(self, outCSVList):
		# The sorting is kinda weird but it results in something that makes sense
#		print 'In sortParts, outCSVList is', outCSVList
		outCSVList = sorted(outCSVList, key = lambda errs: errs[0])		# sort by Ref Des to get them in order
		outCSVList = sorted(outCSVList, key = lambda errs: errs[1])		# sort by Sort by part value
		outCSVList = sorted(outCSVList, key = lambda errs: errs[0][0])	# sort by Sort by part number
		return outCSVList

	def combineRefDes(self,outCSVList):
		""" RefDes,Value,Footprint,Manufacturer,ManufacturerPN,Vendor,VendorPN
		"""
		lastPart	= []
		gotFirstPart = False
		newComboPart = ''
		inComboPart = False
		outPL = []
		qty = 1
#		print 'outCSVList', outCSVList
		for row in outCSVList:
			if gotFirstPart == False:		# the first part gets handled here
				gotFirstPart = True
				newComboPart += row[0]
			else:
				if row[1:] == lastPart[1:]:	# if this part matches the last part
					newComboPart += ',' + row[0]
					inComboPart = True
#					print 'got a match, new combo part ref des', newComboPart
					qty += 1
#					print 'qty', qty
				elif inComboPart == False:	# part didn't match and last part wasn't a combo part
#						outCSVFile.writerow(lastPart)
					outRow = []
					outRow.append(qty)
					outRow += lastPart
					outPL.append(outRow)
					newComboPart = row[0]
#					print 'not match'
					qty = 1
				elif inComboPart:	# part mismatch but last part was combo
					inComboPart = False
					outRow = []
					outRow.append(qty)
					outRow.append(newComboPart)
					outRow += lastPart[1:]
					outPL.append(outRow)
#					print 'changeup, writing new ref des', newComboPart
					newComboPart = row[0]
					qty = 1
			lastPart = row
		# handle the last part
		if inComboPart:
#			qty += 1
			outRow = []
			outRow.append(qty)
			outRow.append(newComboPart)
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
			newOutPLRow = []
			newOutPLRow.append(row[0])
			newOutPLRow.append(row[2])
			newOutPLRow.append(row[1])
			newOutPLRow += row[3:]
			newOutPL.append(newOutPLRow)
		return newOutPL

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

		partsList = self.readInParts(inFile)
#		print 'partsList', partsList
		sortedPL = self.sortParts(partsList)
#		print 'sortedPL', sortedPL
		reduxPL = self.combineRefDes(sortedPL)
		outCSVFile.writerow(['Qty','Value','RefDes','Footprint','Manufacturer','ManufacturerPN','Vendor','VendorPN'])
		outCSVFile.writerows(reduxPL)
		
		self.writeOutMWTable(outMWFile, reduxPL)
		#print 'complete'

class UIManager:
	"""The UI manager
	"""
	interface = """
	<ui>
		<menubar name="MenuBar">
			<menu action="File">
				<menuitem action="Open"/>
				<menuitem action="Quit"/>
			</menu>
			<menu action="Help">
				<menuitem action="About"/>
			</menu>
		</menubar>
	</ui>
	"""

	def __init__(self):
		"""Initialize the class
		"""
		# Create the top level window
		window = gtk.Window()
		window.connect('destroy', lambda w: gtk.main_quit())
		window.set_default_size(200, 200)
		
		vbox = gtk.VBox()
		
		# Create a UIManager instance
		uimanager = gtk.UIManager()

		# Add the accelerator group to the toplevel window
		accelgroup = uimanager.get_accel_group()
		window.add_accel_group(accelgroup)
		window.set_title('kiPL - Kicad Parts List creation program')

		# Create an ActionGroup
		actiongroup =	gtk.ActionGroup("kiPL")
		self.actiongroup = actiongroup

		# Create actions
		self.actiongroup.add_actions([
									("Open", gtk.STOCK_OPEN, "_Open", None, "Open an Existing Document", self.openIF),
									("Quit", gtk.STOCK_QUIT, "_Quit", None, "Quit the Application", self.quit_application),
									("File", None, "_File"),
									("Help", None, "_Help"),
									("About", None, "_About", None, "About kiPL", self.about_kiPL),
									])
		uimanager.insert_action_group(self.actiongroup, 0)
		uimanager.add_ui_from_string(self.interface)
		
		menubar = uimanager.get_widget("/MenuBar")
		vbox.pack_start(menubar, False)
		
		window.connect("destroy", lambda w: gtk.main_quit())
		
		window.add(vbox)
		window.show_all()

	def openIF(self, b):
		"""Open the interface by calling the control class
		"""
		myControl = ControlClass()
		myControl.theExecutive()

		message = gtk.MessageDialog(type=gtk.MESSAGE_INFO, buttons=gtk.BUTTONS_OK)
		message.set_markup("Conversion Complete")
		message.run()		# Display the dialog box and hang around waiting for the "OK" button
		message.destroy()	# Takes down the dialog box
		return

	def about_kiPL(self, b):
		"""The about dialog
		"""
		message = gtk.MessageDialog(type=gtk.MESSAGE_INFO, buttons=gtk.BUTTONS_OK)
		message.set_markup("About kiPL\nAuthor: Doug Gilliland\n(c) 2014 - AAC - All rights reserved\nkiPL Create a Parts List from a KiCad Netlist")
		message.run()
		message.destroy()
		return

	def quit_application(self, widget):
		gtk.main_quit()

if __name__ == '__main__':
	ba = UIManager()
	gtk.main()
