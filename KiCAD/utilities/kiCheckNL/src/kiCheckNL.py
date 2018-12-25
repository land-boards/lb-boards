"""
kiCheckNL.py
Check a KiCad netlist.

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

#print 'kiCheckNL.py'

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

	def getSinglePointNets(self, nl1):
		singlePointNets = []
		for row in nl1:
			if len(row) == 2:
				singlePointNets.append(row)
		return singlePointNets
		
	def getNonSinglePointNets(self, nl1):
		nonSinglePointNets = []
		for row in nl1:
			if len(row) > 2:
				nonSinglePointNets.append(row)
		return nonSinglePointNets
			
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
		defaultParmsClass.storeKeyValuePair('DEFAULT_PATH',defaultPath)
		
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
		
		spNets = self.getSinglePointNets(nl1)
		sortedSPNets = sorted(spNets, key = lambda errs: errs[1])		# sort by pin column

		nonSPNets = self.getNonSinglePointNets(nl1)
		sortedNonSPNets = sorted(nonSPNets, key = lambda errs: errs[0])		# sort by net name column
		
		spFileName = defaultPath + 'SinglePointNets.csv'
		print 'spname', spFileName
		myOutCSV = WriteListtoCSV()
		myOutCSV.writeOutList(spFileName,['Signal','Net'],sortedSPNets)
		
		nspFileName = defaultPath + 'NonSinglePointNets.csv'
		print 'nspname', nspFileName
		myOutCSV.openCSVFile(nspFileName)
		myOutCSV.writeOutList(nspFileName,['Non Single Point Nets'],sortedNonSPNets)
		
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
		window.set_title('kiCheckNL - Kicad Check a netlist')

		# Create an ActionGroup
		actiongroup =	gtk.ActionGroup("kiCheckNL")
		self.actiongroup = actiongroup

		# Create actions
		self.actiongroup.add_actions([
									("Open", gtk.STOCK_OPEN, "_Open", None, "Open an Existing Document", self.openIF),
									("Quit", gtk.STOCK_QUIT, "_Quit", None, "Quit the Application", self.quit_application),
									("File", None, "_File"),
									("Help", None, "_Help"),
									("About", None, "_About", None, "About kiCheckNL", self.about_kiCheckNL),
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
		message.set_markup("Lists Generation Complete")
		message.run()		# Display the dialog box and hang around waiting for the "OK" button
		message.destroy()	# Takes down the dialog box
		return

	def about_kiCheckNL(self, b):
		"""The about dialog
		"""
		message = gtk.MessageDialog(type=gtk.MESSAGE_INFO, buttons=gtk.BUTTONS_OK)
		message.set_markup("About kiCheckNL\nAuthor: Doug Gilliland\n(c) 2017 - Douglas Gilliland - All rights reserved\nkiCheckNL Check a Netlist")
		message.run()
		message.destroy()
		return

	def quit_application(self, widget):
		gtk.main_quit()

if __name__ == '__main__':
	ba = UIManager()
	gtk.main()
