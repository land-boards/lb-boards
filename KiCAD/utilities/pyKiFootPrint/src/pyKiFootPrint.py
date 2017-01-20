"""
pyKiFootPrint.py
Create a footprint file based on parametrics.

========
Workflow
========

* Run this program
* Select the footprint file name
* Creates the footprint file

=====
Usage
=====

Program is run by either typing python pyKiFootPrint.py or double clicking pyKiFootPrint.py.

=======
Formats
=======

===============
Output Messages
===============

* Error message are sent to the stdout.
* When the program is done it has a dialog box which gives time to look at the error log.

=======
Options
=======


===
API
===

"""

import csv
import os
import sys
import string
sys.path.append('C:\\Users\\doug_000\\Documents\\GitHub\\lb-Python-Code\\dgCommonModules')
sys.path.append('C:\\HWTeam\\Utilities\\dgCommonModules')

defaultPath = '.'

from dgProgDefaults import *

import pygtk
pygtk.require('2.0')

import gtk

# Check for new pygtk: this is new class in PyGtk 2.4
if gtk.pygtk_version < (2,3,90):
   print "PyGtk 2.3.90 or later required for this example"
   raise SystemExit

def errorDialog(errorString):
	"""
	Prints an error message as a dialog box
	"""
	message = gtk.MessageDialog(type=gtk.MESSAGE_ERROR, buttons=gtk.BUTTONS_OK)
	message.set_markup(errorString)
	message.run()		# Display the dialog box and hang around waiting for the "OK" button
	message.destroy()	# Takes down the dialog box
	return

class ProcessFootprints:
	"""Methods related to reading KiCad footprint, netlist and pcb files
	"""
	def	extractPathFromPathfilename(self,fullPathFilename):
		"""
		:param fullPathFilename: The path with file name
		:returns: the path without the file name
		
		Extract Path from fullPathFilename
		"""
		return(fullPathFilename[0:fullPathFilename.rfind('\\')+1])
	
	def selectFootprintFile(self):
		"""
		:returns: path/name of the file that was selected
		
		This is the dialog which locates the Kicad footprint files
		"""
		global defaultPath
		dialog = gtk.FileChooserDialog("Select sch file",None,gtk.FILE_CHOOSER_ACTION_OPEN,(gtk.STOCK_CANCEL, gtk.RESPONSE_CANCEL,gtk.STOCK_OPEN, gtk.RESPONSE_OK))
		dialog.set_default_response(gtk.RESPONSE_OK)

		filter = gtk.FileFilter()
		filter.set_name("Kicad footprint files")
		filter.add_pattern("*.sch")
		dialog.add_filter(filter)

		response = dialog.run()
		if response == gtk.RESPONSE_OK:
			retFileName = dialog.get_filename()
			dialog.destroy()
			defaultPath = self.extractPathFromPathfilename(retFileName)
			return retFileName
		elif response == gtk.RESPONSE_CANCEL:
			dialog.destroy()
			return ''
	
	def readInFile(self, inFileName):
		"""
		:param inFileName: The path with file name
		:returns: list of the lines in the file
		
		Read the text file into a list for  processing.
		"""
		schFilePtr = open(inFileName,'r')
		schList = []
		for line in schFilePtr:
			schList.append(line)
		schFilePtr.close()
		return schList

	def backupFootprint(self, footprintFileName):
		"""
		:param footprintFileName: The name of the footprint file
		:returns: True if passed, exits if fails
		
		Back up the footprint file by renaming the file as _sch.bak.
		"""
		cmdString = 'copy '
		cmdString += footprintFileName
		cmdString += ' '
		cmdString += footprintFileName[0:-4]
		cmdString += '_sch.bak'
		try:
			os.system(cmdString)
		except:
			print "Couldn't backup the footprint"
			raise SystemExit
		return True
	
	def doKiPcb2Sch(self):
		"""Backannotate option.
		The executive which calls all of the other functions.
		"""
		global defaultPath
		#Load the default path
		defaultParmsClass = HandleDefault()
		#defaultParmsClass.setVerboseMode(False)
		defaultParmsClass.initDefaults()
		defaultPath = defaultParmsClass.getKeyVal('DEFAULT_PATH')
		#print 'defaultPath was :', defaultPath
		
		footprintFileName = self.selectFootprintFile()
		if footprintFileName == '':
			errorDialog("Failed to open footprint file")
			return False
		if self.backupFootprint(footprintFileName) != True:
			errorDialog("Failed to back up the footprint file")
			return False
		schematicAsList = self.readInFile(footprintFileName)
		if schematicAsList == []:
			errorDialog("Failed to read in the footprint file")
			return False
		pcbFileAsList = self.readInFile(footprintFileName)
		if pcbFileAsList == []:
			failString = "Failed to read in the footprint file\n" + footprintFileName + "\nFile not found."
			errorDialog(failString)
			return False
		print 'footprint file has lines:', len(schematicAsList)
		
		# print 'refDesSchVsPc list:',refDesSchVsPc
		outList = self.backAnnotateSch(schematicAsList,refDesSchVsPc)
		outFileName = footprintFileName
		self.writeOutSchematic(outList,outFileName)
		return True
	
class UIManager:
	"""User Interface
	"""
	interface = """
	<ui>
		<menubar name="MenuBar">
			<menu action="File">
				<menuitem action="Open"/>
				<menuitem action="Quit"/>
			</menu>
			<menu action="Options">
				<menuitem action="BackAnn"/>
				<menuitem action="Analyze"/>
			</menu>
			<menu action="Help">
				<menuitem action="About"/>
			</menu>
		</menubar>
	</ui>
	"""

	def __init__(self):
		"""
		Create the top level window
		"""
		window = gtk.Window()
		window.connect('destroy', lambda w: gtk.main_quit())
		window.set_default_size(200, 200)
		
		vbox = gtk.VBox()
		
		# Create a UIManager instance
		uimanager = gtk.UIManager()

		# Add the accelerator group to the toplevel window
		accelgroup = uimanager.get_accel_group()
		window.add_accel_group(accelgroup)

		# Create an ActionGroup
		actiongroup =  gtk.ActionGroup("pyKiBackannSchem")
		self.actiongroup = actiongroup

		# Create actions
		self.actiongroup.add_actions([
			("Open", gtk.STOCK_OPEN, "_Open", None, "Open an Existing Document", self.openIF),
			("Quit", gtk.STOCK_QUIT, "_Quit", None, "Quit the Application", self.quit_application),
			("File", None, "_File"),
			("Options", None, "_Options"),
			("Help", None, "_Help"),
			("About", None, "_About", None, "About pyKiBackannSchem", self.about_pykifoot),
			])
		self.actiongroup.add_radio_actions([
			("BackAnn", gtk.STOCK_PREFERENCES, "_Back Annotate", '<Control>B', "Back annotate footprint from cmp file", 0),
			("Analyze", gtk.STOCK_PREFERENCES, "_Analyze", '<Control>A', "Analyze impact of backannotation", 1),
			], 2, self.setSelProcess)
		uimanager.insert_action_group(self.actiongroup, 0)
		uimanager.add_ui_from_string(self.interface)
		
		menubar = uimanager.get_widget("/MenuBar")
		vbox.pack_start(menubar, False)
		
		window.connect("destroy", lambda w: gtk.main_quit())
		
		window.add(vbox)
		window.show_all()

	def openIF(self, b):
		"""
		"""
		SchClass = ProcessFootprints()
		if backAnnotate == True:
			if SchClass.doKiPcb2Sch() != False:
				message = gtk.MessageDialog(type=gtk.MESSAGE_INFO, buttons=gtk.BUTTONS_OK)
				message.set_markup("Backannotation Completed")
				message.run()
				message.destroy()
		else:
			if SchClass.doKiSchChk() != False:
				message = gtk.MessageDialog(type=gtk.MESSAGE_INFO, buttons=gtk.BUTTONS_OK)
				message.set_markup("Analysis Completed")
				message.run()
				message.destroy()
		return

	def about_pykifoot(self, b):
		"""
		"""
		message = gtk.MessageDialog(type=gtk.MESSAGE_INFO, buttons=gtk.BUTTONS_OK)
		message.set_markup("About pyKiBackannSchem\nAuthor: Doug Gilliland\n(c) 2014 - All rights reserved\nProgram backannotates a Kicad sch file from a cmp file")
		message.run()
		message.destroy()
		
	def setSelProcess(self, action, current):
		"""
		"""
		global backAnnotate
		text = current.get_name()
		if (text == "BackAnn"):
			backAnnotate = True
			print 'Back annotate flag set'
		elif (text == "Analyze"):
			backAnnotate = False
			print 'Analyze flag set'
		return

	def quit_application(self, widget):
		gtk.main_quit()

if __name__ == '__main__':
	ba = UIManager()
	gtk.main()
