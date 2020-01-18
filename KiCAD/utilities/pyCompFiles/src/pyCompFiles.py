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
		outList = [inLine.strip('\n\r ') for inLine in inFile]
		# outList = []
		# for inLine in inFile:
			# inLine = inLine.strip('\n\r ')
			# outList.append(inLine)
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

		self.win.mainloop()

if __name__ == "__main__":
	control = ControlClass()
	x = Dashboard()
	x.add_menu()
