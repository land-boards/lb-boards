"""
============
pyKicadNL.py
============

Extract a netlist from a Kicad netlist.

=====
Usage
=====

This program prompts for a path and file to select for input.
The output file is created in the same path with a .MW output file name.

Uses Python 3 and Tkinter.

===
API
===

"""
from __future__ import print_function

from tkinter import filedialog
from tkinter import *
from tkinter import messagebox

import csv
#import string
import os
import sys

sys.path.append('C:\\HWTeam\\Utilities\\dgCommonModules\\TKDGCommon')
sys.path.append('C:\\Users\\HPz420\\Documents\\GitHub\\land-boards\\lb-Python-Code\\dgCommonModules\\TKDGCommon')

from dgProgDefaultsTk import *
from dgReadCSVtoListTk import *
defaultPath = '.'

from sys import argv

def errorDialog(errorString):
	messagebox.showerror("Error", errorString)

def infoBox(msgString):
	messagebox.showinfo("pyKicadNL",msgString)

class ControlClass(object):
	def theExecutive(self):
		"""
		:global lastPathFileName: The path and file name that was found by the browser.

		The code that calls the other code.
		This code uses the defaults library to handle the default path.
		This code uses the read CSV library to read in the CSV file.
		"""
		global defaultPath
		defaultFilePath = os.path.realpath(__file__)
		defaultPath = defaultFilePath[0:defaultFilePath.rfind("\\")]
		# print("theExecutive: defaultFilePath",defaultFilePath)
		# print("theExecutive: defaultPath",defaultPath)
		defaultParmsClass = HandleDefault()
		defaultParmsClass.setPathToProgramSource(defaultPath)
		defaultParmsClass.initDefaults()
		defaultPath = defaultParmsClass.getKeyVal('DEFAULT_PATH')
		header='Netlist'
		#print 'defaultPath',defaultPath
		inFileNameString = os.path.normpath(filedialog.askopenfilename(initialdir = defaultPath,title = header,filetypes = (("net files","*.net"),("all files","*.*"))))
		theInList = []
		gotNets=False
		  # (nets
			# (net (code "1") (name "+5V")
			  # (node (ref "C10") (pin "1") (pintype "passive"))
			  # (node (ref "C18") (pin "1") (pintype "passive"))
			  # (node (ref "J28") (pin "1") (pinfunction "VCC") (pintype "power_in"))
			  # (node (ref "U1") (pin "1") (pinfunction "VCC") (pintype "power_in"))
			  # (node (ref "U2") (pin "1") (pinfunction "VO") (pintype "power_out")))
			# (net (code "2") (name "+12V")
		nodeList = []
		allNodes = []
		with open(inFileNameString, 'r') as filehandle:
			for line in filehandle:
				if gotNets:
					inLine = line.strip()
					line = line.strip('\n')
					if '(net' in line:
						if nodeList != []:
							allNodes.append(nodeList)
							nodeList = []
						netName = line[line.find('(name "')+7:-2]
						# print('\nnet:',netName,end=' ')
						nodeList.append(netName)
					elif '(node' in line:
						nodeStr = ''
						startRefDes = line.find('(node (ref "')+12
						endRefDes = line.find('")')
						nodeRefDes = line[startRefDes:endRefDes]
						nodeStr += nodeRefDes + '-'
						pinNumStart = line.find('(pin "')+6
						pinNumEnd=line[pinNumStart:].find('") ')
						nodePinNum=line[pinNumStart:pinNumStart+pinNumEnd]
						nodeStr += nodePinNum
						# print(nodeStr,end=', ')
						nodeList.append(nodeStr)
#					theInList.append(inLine)
				if '(nets' in line:
					gotNets = True
		if nodeList != []:
			allNodes.append(nodeList)
		print(allNodes)
#		assert False

		fileToWrite = inFileNameString[0:-4] + '.NL'
		#print 'fileToWrite',fileToWrite
		try:
			outFile = open(fileToWrite, 'w')
		except IOError:
			errorDialog('ERROR - Cannot open the output file.\nIs the file already open?\nClose the file and return.')
			try:
				outFile = open(fileToWrite, 'w')
			except IOError:
				errorDialog('ERROR - Tried again,  - Is the file already open?')
				exit()
		
		self.writeOutMWTable(outFile, allNodes)
		infoBox("Finished")
		
	def writeOutMWTable(self, outFilePtr, theList):
		"""
		:param outFilePtr: Points to the output file.
		:param theList: The list to write out.

		"""
		for row in theList:
			for cell in row:
				outFilePtr.write(cell+',')
			outFilePtr.write('\n')
		outFilePtr.write('\n')

class Dashboard:
	def __init__(self):
		self.win = Tk()
		self.win.geometry("320x240")
		self.win.title("pyKicadNL")

	def add_menu(self):
		self.mainmenu = Menu(self.win)
		self.win.config(menu=self.mainmenu)

		self.filemenu = Menu(self.mainmenu, tearoff=0)
		self.mainmenu.add_cascade(label="File",menu=self.filemenu)

		self.filemenu.add_command(label="Open CSV PL file",command=control.theExecutive)
		self.filemenu.add_separator()
		self.filemenu.add_command(label="Exit",command=self.win.quit)

		self.win.mainloop()

if __name__ == "__main__":
	control = ControlClass()
	x = Dashboard()
	x.add_menu()
