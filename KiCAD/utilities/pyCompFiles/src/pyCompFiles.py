"""
pyCompFiles.py
Compare two ASCII text files
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

sys.path.append('C:\\HWTeam\\Utilities\\dgCommonModules')

defaultPath = '.'

from dgProgDefaults import *

from sys import argv

def messageDialog(messageString):
	"""
	Prints an error message as a dialog box
	"""
	message = gtk.MessageDialog(type=gtk.MESSAGE_INFO, buttons=gtk.BUTTONS_OK)
	message.set_markup(messageString)
	message.run()		# Display the dialog box and hang around waiting for the "OK" button
	message.destroy()	# Takes down the dialog box
	return
			
def errorDialog(errorString):
	"""
	Prints an error message as a dialog box
	"""
	message = gtk.MessageDialog(type=gtk.MESSAGE_ERROR, buttons=gtk.BUTTONS_OK)
	message.set_markup(errorString)
	message.run()		# Display the dialog box and hang around waiting for the "OK" button
	message.destroy()	# Takes down the dialog box
	return
			
class FileAFile:
	def	extractPathFromPathfilename(self,fullPathFilename):
		"""Extract Path from fullPathFilename
		"""
		return(fullPathFilename[0:fullPathFilename.rfind('\\')+1])
	def findFile(self, startingPath):
		"""findFile() - This is the dialog which locates the csv files
	
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
		filter.set_name("All file types")
		filter.add_pattern("*.*")
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
	def readInFile(self, inFile):
		"""
		"""
		outList = []
		for inLine in inFile:
			#print progState
			inLine = inLine.strip('\n\r ')
			outList.append(inLine)
		return outList

	def compareLists(self, file1, file2):
		if file1 != file2:
			print 'Files did not match'
			errorDialog("Files did not match")
			return False
		else:
			print 'Files matched'
			messageDialog("Files matched")
			return True
				
	def theExecutive(self):
		"""theExecutive - Function that runs the whole thing
		"""
		global defaultPath
		#Load the default path
		defaultParmsClass = HandleDefault()
		#defaultParmsClass.setVerboseMode(False)
		defaultParmsClass.initDefaults()
		defaultPath = defaultParmsClass.getKeyVal('DEFAULT_PATH')
		if defaultParmsClass.getKeyVal('DEFAULT_PATH_FILE1') == '':
			defaultParmsClass.storeKeyValuePair('DEFAULT_PATH_FILE1',defaultPath)
			file1Path = defaultPath
		else:
			file1Path = defaultParmsClass.getKeyVal('DEFAULT_PATH_FILE1');
		
		if defaultParmsClass.getKeyVal('DEFAULT_PATH_FILE2') == '':
			defaultParmsClass.storeKeyValuePair('DEFAULT_PATH_FILE2',defaultPath)
			file2Path = defaultPath
		else:
			file2Path = defaultParmsClass.getKeyVal('DEFAULT_PATH_FILE2');
		
		myCSV = FileAFile()
		fileToRead = myCSV.findFile(file1Path)
		defaultParmsClass.storeKeyValuePair('DEFAULT_PATH_FILE1',defaultPath)
		
		try:
			inFile = open(fileToRead, 'r')
		except IOError:
			errorDialog('ERROR - Cannot open input file')
			exit()
		print 'First file:',fileToRead
		file1 = self.readInFile(inFile)

		fileToRead = myCSV.findFile(file2Path)
		defaultParmsClass.storeKeyValuePair('DEFAULT_PATH_FILE2',defaultPath)

		try:
			inFile = open(fileToRead, 'rb')
		except IOError:
			errorDialog('ERROR - Cannot open input file')
			exit()
		print 'Second file:',fileToRead
		file2 = self.readInFile(inFile)

		print 'Length of File 1:',len(file1)
		print 'Length of File 2:',len(file2)
		
		self.compareLists(file1, file2)

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
		window.set_title('pyCompFiles - Compare two files')

		# Create an ActionGroup
		actiongroup =	gtk.ActionGroup("pyCompFiles")
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
		message.set_markup("About pyCompFiles\nAuthor: Doug Gilliland\n(c) 2017 - Douglas Gilliland - All rights reserved\nkiCompNL Compare two KiCad files")
		message.run()
		message.destroy()
		return

	def quit_application(self, widget):
		gtk.main_quit()

if __name__ == '__main__':
	ba = UIManager()
	gtk.main()
