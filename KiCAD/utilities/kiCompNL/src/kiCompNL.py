"""
kiCompNL.py
Compare two KiCad netlists.

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

sys.path.append('C:\\Users\\doug_000\\Documents\\GitHub\\lb-Python-Code\\dgCommonModules')
sys.path.append('C:\\HWTeam\\Utilities\\dgCommonModules')

defaultPath = '.'

from dgProgDefaults import *
from dgWriteListtoCSV import *

from sys import argv

#print 'kiCompNL.py'

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
		'''
		(design
		 (nets
		  (net (code 1) (name "Net-(MTG1-Pad1)")
		   (node (ref MTG1) (pin 1)))
		  (net (code 7) (name /AD4)
		   (node (ref U1) (pin 27))
		   (node (ref K5) (pin 3)))
		'''

		LOOKING_FOR_DESIGN = 1
		LOOKING_FOR_NETS = 2
		FIRST_NET = 3
		IN_NET = 4
		IN_NET_NODE = 5

		netList = []

		progState = LOOKING_FOR_DESIGN
		outNetList = []
		theNode = []
		for inLine in inFile:
			#print progState
			inLine = inLine.strip('\n\r ')
			if progState == LOOKING_FOR_DESIGN:
				if "(design" in inLine:
					progState = LOOKING_FOR_NETS
			elif progState == LOOKING_FOR_NETS:
				if "(nets" in inLine:
					progState = FIRST_NET
			elif progState == FIRST_NET:
				if "(net ("  in inLine:		# (net (code 7) (name /AD4)
#					print 'net', inLine[inLine.find('"')+1:-1]
					theNode.append(inLine[inLine.find('(name ')+7:inLine.rfind('"')])
					progState = IN_NET
				else:
					errorDialog('Expected a net after the net start')
					SystemExit()
			elif progState == IN_NET:		## First pin in a net
				if "(node ("  in inLine:
					subString = inLine[11:-2]
					subString = subString.replace(') (pin ','-')
					subString = subString.replace(')','') 
					#print 'sub',subString 
					theNode.append(subString)
					progState = IN_NET_NODE
				else:
					errorDialog('Expected a pin after the first net start')
					SystemExit()
			elif progState == IN_NET_NODE:
				if "(net ("  in inLine:
					outNetList.append(theNode)
					theNode = []
#					print 'net', inLine[inLine.rfind('('):-1]
					theNode.append(inLine[inLine.find('(name ')+7:inLine.rfind('"')])
				elif "(node ("  in inLine:
					subString = inLine[11:-2]
					subString = subString.replace(') (pin ','-') 
					subString = subString.replace(')','') 
					#print 'sub',subString 
					theNode.append(subString)
				else:
					errorDialog('Expected a node after the first net start')
					SystemExit()
		outNetList.append(theNode)
		#print outNetList
		print 'Number of Nets:',len(outNetList)
		return outNetList

	def compareNetLists(self, nl1, nl2):
		diffs1to2 = []
		diffs2to1 = []
#		print '*** One ***'
		for row in nl1:
			if row not in nl2:
				diffs1to2.append(row)
#				print row
#		print '*** Two ***'
		for row in nl2:
			if row not in nl1:
				diffs2to1.append(row)
#				print row
				
#		return
				
		for row1 in diffs1to2:
			noNodeMatch = True
			for row2 in diffs2to1:
				if row1[0] == row2[0]:	# same net name
					noNodeMatch = False
					allPinsMatch = True
					pinRow = []
					for pin1 in row1[1:]:
						pinMatch = False					
						for pin2 in row2[1:]:
							if pin1 == pin2:
								pinMatch = True
						if pinMatch == False:
							pinRow.append(pin1)
					if pinRow != []:
						print 'Extra pin(s) in net (1):',row1[0],
						print 'pin(s)',pinRow
			if noNodeMatch == True:
				print 'Net is in 1 but not 2',row1
				
		for row2 in diffs2to1:
			noNodeMatch = True
			for row1 in diffs1to2:
				if row2[0] == row1[0]:
					noNodeMatch = False
					allPinsMatch = True
					pinRow = []
					for pin2 in row2[1:]:
						pinMatch = False					
						for pin1 in row1[1:]:
							if pin2 == pin1:
								pinMatch = True
						if pinMatch == False:
							pinRow.append(pin2)
					if pinRow != []:
						print 'Extra pin(s) in net (2):',row2[0],
						print 'pin(s)',pinRow
			if noNodeMatch == True:
				print 'Net is in 2 but not 1',row2
				
	def theExecutive(self):
		"""theExecutive - Function that runs the whole thing
		"""
		global defaultPath
		#Load the default path
		defaultParmsClass = HandleDefault()
		#defaultParmsClass.setVerboseMode(False)
		defaultParmsClass.initDefaults()
		defaultPath = defaultParmsClass.getKeyVal('DEFAULT_PATH')
		
		myCSV = FindaNetFile()
		fileToRead = myCSV.findNetFile(defaultPath)
		
		if fileToRead.upper()[-3:] != 'NET':
			errorDialog('ERROR - Expected a net file type')
			exit()
		try:
			inFile = open(fileToRead, 'rb')
		except IOError:
			errorDialog('ERROR - Cannot open input file')
			exit()
		print 'First netlist:',fileToRead
		nl1 = self.readInParts(inFile)

		fileToRead = myCSV.findNetFile(defaultPath)
		
		if fileToRead.upper()[-3:] != 'NET':
			errorDialog('ERROR - Expected a net file type')
			exit()
		defaultParmsClass.storeKeyValuePair('DEFAULT_PATH',defaultPath)

		try:
			inFile = open(fileToRead, 'rb')
		except IOError:
			errorDialog('ERROR - Cannot open input file')
			exit()

		print 'Second netlist:',fileToRead
		nl2 = self.readInParts(inFile)
		
		self.compareNetLists(nl1, nl2)

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
		window.set_title('kiCompNL - Kicad Compare two netlists')

		# Create an ActionGroup
		actiongroup =	gtk.ActionGroup("kiCompNL")
		self.actiongroup = actiongroup

		# Create actions
		self.actiongroup.add_actions([
									("Open", gtk.STOCK_OPEN, "_Open", None, "Open an Existing Document", self.openIF),
									("Quit", gtk.STOCK_QUIT, "_Quit", None, "Quit the Application", self.quit_application),
									("File", None, "_File"),
									("Help", None, "_Help"),
									("About", None, "_About", None, "About kiCompNL", self.about_kiCompNL),
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
		message.set_markup("Comparison Complete")
		message.run()		# Display the dialog box and hang around waiting for the "OK" button
		message.destroy()	# Takes down the dialog box
		return

	def about_kiCompNL(self, b):
		"""The about dialog
		"""
		message = gtk.MessageDialog(type=gtk.MESSAGE_INFO, buttons=gtk.BUTTONS_OK)
		message.set_markup("About kiCompNL\nAuthor: Doug Gilliland\n(c) 2016 - Douglas Gilliland - All rights reserved\nkiCompNL Compare two KiCad Netlists")
		message.run()
		message.destroy()
		return

	def quit_application(self, widget):
		gtk.main_quit()

if __name__ == '__main__':
	ba = UIManager()
	gtk.main()
