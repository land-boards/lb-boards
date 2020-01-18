"""
pyCompFiles.py
Compare two ASCII text files
"""

from __future__ import print_function

from tkinter import filedialog
from tkinter import *
from tkinter import messagebox

import csv
import string
import os
import sys

sys.path.append('C:\\HWTeam\\Utilities\\dgCommonModules\\TKDGCommon')
sys.path.append('C:\\Users\\HPz420\\Documents\\GitHub\\land-boards\\lb-Python-Code\\dgCommonModules\\TKDGCommon')

defaultPath = '.'

from dgProgDefaultsTK import *

from sys import argv

def errorDialog(errorString):
	messagebox.showerror("Error", errorString)

def messageDialog(msgString):
	messagebox.showinfo("pyCSVtoMWTable",msgString)

			
class ControlClass:

	def	extractPathFromPathfilename(self,fullPathFilename):
		"""Extract Path from fullPathFilename
		"""
		return(fullPathFilename[0:fullPathFilename.rfind('\\')+1])
		
	def findFile(self, startingPath):
		"""findFile() - This is the dialog which locates the files
	
		:returns: path/name of the file that was selected
		"""
		global defaultPath
		filename =  filedialog.askopenfilename(initialdir = defaultPath,title = "Select file",filetypes = (("csv files","*.csv"),("all files","*.*")))
		defaultPath = self.extractPathFromPathfilename(filename)
		return (filename)

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
			print('Files did not match')
			errorDialog("Files did not match")
			return False
		else:
			print('Files matched')
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
		
		fileToRead = self.findFile(file1Path)
		defaultParmsClass.storeKeyValuePair('DEFAULT_PATH_FILE1',defaultPath)
		
		try:
			inFile = open(fileToRead, 'r')
		except IOError:
			errorDialog('ERROR - Cannot open input file')
			exit()
		print('First file:',fileToRead)
		file1 = self.readInFile(inFile)

		fileToRead = self.findFile(file2Path)
		defaultParmsClass.storeKeyValuePair('DEFAULT_PATH_FILE2',defaultPath)

		try:
			inFile = open(fileToRead, 'r')
		except IOError:
			errorDialog('ERROR - Cannot open input file')
			exit()
		print('Second file:',fileToRead)
		file2 = self.readInFile(inFile)

		print('Length of File 1:',len(file1))
		print('Length of File 2:',len(file2))
		
		self.compareLists(file1, file2)

class Dashboard:
	def __init__(self):
		self.win = Tk()
		self.win.geometry("320x240")
		self.win.title("pyCompFiles - Compare two files")

	def add_menu(self):
		self.mainmenu = Menu(self.win)
		self.win.config(menu=self.mainmenu)

		self.filemenu = Menu(self.mainmenu)
		self.mainmenu.add_cascade(label="File",menu=self.filemenu)

		self.filemenu.add_command(label="Open file",command=control.theExecutive)
		self.filemenu.add_separator()
		self.filemenu.add_command(label="Exit",command=self.win.quit)

		# self.editmenu = Menu(self.mainmenu)
		# self.mainmenu.add_cascade(label="Edit",menu=self.editmenu)

		# self.editmenu.add_command(label="Find")
		# self.editmenu.add_command(label="Replace")

		self.win.mainloop()

if __name__ == "__main__":
	control = ControlClass()
	x = Dashboard()
	x.add_menu()
	
# class UIManager:
	# """The UI manager
	# """
	# interface = """
	# <ui>
		# <menubar name="MenuBar">
			# <menu action="File">
				# <menuitem action="Open"/>
				# <menuitem action="Quit"/>
			# </menu>
			# <menu action="Help">
				# <menuitem action="About"/>
			# </menu>
		# </menubar>
	# </ui>
	# """

	# def __init__(self):
		# """Initialize the class
		# """
		# # Create the top level window
		# window = gtk.Window()
		# window.connect('destroy', lambda w: gtk.main_quit())
		# window.set_default_size(200, 200)
		
		# vbox = gtk.VBox()
		
		# # Create a UIManager instance
		# uimanager = gtk.UIManager()

		# # Add the accelerator group to the toplevel window
		# accelgroup = uimanager.get_accel_group()
		# window.add_accel_group(accelgroup)
		# window.set_title('pyCompFiles - Compare two files')

		# # Create an ActionGroup
		# actiongroup =	gtk.ActionGroup("pyCompFiles")
		# self.actiongroup = actiongroup

		# # Create actions
		# self.actiongroup.add_actions([
									# ("Open", gtk.STOCK_OPEN, "_Open", None, "Open an Existing Document", self.openIF),
									# ("Quit", gtk.STOCK_QUIT, "_Quit", None, "Quit the Application", self.quit_application),
									# ("File", None, "_File"),
									# ("Help", None, "_Help"),
									# ("About", None, "_About", None, "About kiCompNL", self.about_kiCompNL),
									# ])
		# uimanager.insert_action_group(self.actiongroup, 0)
		# uimanager.add_ui_from_string(self.interface)
		
		# menubar = uimanager.get_widget("/MenuBar")
		# vbox.pack_start(menubar, False)
		
		# window.connect("destroy", lambda w: gtk.main_quit())
		
		# window.add(vbox)
		# window.show_all()

	# def openIF(self, b):
		# """Open the interface by calling the control class
		# """
		# myControl = ControlClass()
		# myControl.theExecutive()

		# message = gtk.MessageDialog(type=gtk.MESSAGE_INFO, buttons=gtk.BUTTONS_OK)
		# message.set_markup("Comparison Complete")
		# message.run()		# Display the dialog box and hang around waiting for the "OK" button
		# message.destroy()	# Takes down the dialog box
		# return

	# def about_kiCompNL(self, b):
		# """The about dialog
		# """
		# message = gtk.MessageDialog(type=gtk.MESSAGE_INFO, buttons=gtk.BUTTONS_OK)
		# message.set_markup("About pyCompFiles\nAuthor: Doug Gilliland\n(c) 2017 - Douglas Gilliland - All rights reserved\nkiCompNL Compare two KiCad files")
		# message.run()
		# message.destroy()
		# return

	# def quit_application(self, widget):
		# gtk.main_quit()

# if __name__ == '__main__':
	# ba = UIManager()
	# gtk.main()
