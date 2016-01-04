"""Back-annotate footprints on a Kicad schematic from the .cmp file.

Workflow

* Create Initial schematic
* Use CvPCB to associate any parts which do not have associated footprints.
* Back annotate the schematic to match the CvPCB footprints.
* Stop using CvPCB.
* 

=====
Usage
=====

Program is run by either typing python pyKiBackannSchem.py or double clicking pyKiBackannSchem.py.

==============
Output Message
==============

There are three classes of messages:

* Errors
* Warnings
* Notes

There are a couple of Errors:

* No match for part

============
Code follows
============

"""

import pygtk
pygtk.require('2.0')

import gtk

# Check for new pygtk: this is new class in PyGtk 2.4
if gtk.pygtk_version < (2,3,90):
   print "PyGtk 2.3.90 or later required for this example"
   raise SystemExit

import csv
import os
import sys
import string

backAnnotate = True

def errorDialog(errorString):
	"""
	Prints an error message as a dialog box
	"""
	message = gtk.MessageDialog(type=gtk.MESSAGE_ERROR, buttons=gtk.BUTTONS_OK)
	message.set_markup(errorString)
	message.run()		# Display the dialog box and hang around waiting for the "OK" button
	message.destroy()	# Takes down the dialog box
	return

class ProcessKicadSchematic:
	def selectKicadSchematic(self):
		"""selectKicadSchematic() - This is the dialog which locates the Kicad Schematic files
	
		:returns: path/name of the file that was selected
		"""
		dialog = gtk.FileChooserDialog("Select sch file",
	                               None,
	                               gtk.FILE_CHOOSER_ACTION_OPEN,
	                               (gtk.STOCK_CANCEL, gtk.RESPONSE_CANCEL,
	                               gtk.STOCK_OPEN, gtk.RESPONSE_OK))
		dialog.set_default_response(gtk.RESPONSE_OK)

		filter = gtk.FileFilter()
		filter.set_name("Kicad Schematic files")
		filter.add_pattern("*.sch")
		dialog.add_filter(filter)

		response = dialog.run()
		if response == gtk.RESPONSE_OK:
			retFileName = dialog.get_filename()
			dialog.destroy()
			return retFileName
		elif response == gtk.RESPONSE_CANCEL:
			dialog.destroy()
			return ''
	
	def readInSchematic(self, schFileName):
		'''Read the schematic text file into a list for easier processing.
		
		:returns: list of the lines in the schematic file
		'''
		schFilePtr = open(schFileName,'rb')
		schList = []
		for line in schFilePtr:
			schList.append(line)
		schFilePtr.close()
		return schList

	def backupSchematic(self, schFileName):
		'''Back up the schematic file by renaming the file as _sch.bak.
		
		:param schFileName: The name of the schematic file
		:returns: True if passed, exits if fails
		'''
		cmdString = 'copy '
		cmdString += schFileName
		cmdString += ' '
		cmdString += schFileName[0:-4]
		cmdString += '_sch.bak'
		try:
			os.system(cmdString)
		except:
			print "Couldn't backup the schematic"
			raise SystemExit
		return True
		
	def selectCmpFile(self):
		"""selectKicadSchematic() - This is the dialog which locates the Kicad Schematic files
	
		:returns: path/name of the file that was selected
		"""
		dialog = gtk.FileChooserDialog("Select comp file",
	                               None,
	                               gtk.FILE_CHOOSER_ACTION_OPEN,
	                               (gtk.STOCK_CANCEL, gtk.RESPONSE_CANCEL,
	                               gtk.STOCK_OPEN, gtk.RESPONSE_OK))
		dialog.set_default_response(gtk.RESPONSE_OK)

		filter = gtk.FileFilter()
		filter.set_name("Kicad Component files")
		filter.add_pattern("*.cmp")
		dialog.add_filter(filter)

		response = dialog.run()
		if response == gtk.RESPONSE_OK:
			retFileName = dialog.get_filename()
			dialog.destroy()
			return retFileName
		elif response == gtk.RESPONSE_CANCEL:
			print 'Closed, no files selected'
			dialog.destroy()
			exit()
		dialog.destroy()
		return
	
	def readInCmpFile(self, cmpFileName):
		try:
			cmpFilePtr = open(cmpFileName,'rb')
		except:
			return []
		cmpList = []
		for line in cmpFilePtr:
			cmpList.append(line)
		cmpFilePtr.close()
		return cmpList
	
	def createCmpFootPrintList(self, cmpList):
		'''Takes the cmp file and creates a list of ref des vs footprints
		Component Footprint list looks like:
		BeginCmp
		TimeStamp = /537A4DC8;
		Reference = R4;
		ValeurCmp = R;
		IdModule  = R4-5;
		EndCmp
	
		:param cmpList: Component file list
	
		:returns" list of ref des and footprints
		'''
		cmpFootPrintList = []
		for row in cmpList:
			row = row.strip('\n\r')
			if string.find(row,'Reference = ') != -1:
				refDes = row[12:-1]
			if string.find(row,'IdModule  = ') != -1:
				footprint = row[12:-1]
				cmpLine = []
				cmpLine.append(refDes)
				cmpLine.append(footprint)
				cmpFootPrintList.append(cmpLine)
#		print cmpFootPrintList
		return cmpFootPrintList
	
	def createSchFootPrintList(self, schList):
		outSchList = []
		state = 'lookingForComp'
		outSchLine = []
		for line in schList:
			outLine = line
#			print state
			if state == 'lookingForComp' and line[0:5] == '$Comp':	# $Comp is the flag that I am in a part
				state = 'lookingForL'
			elif state == 'lookingForL' and line[0] == 'L':			# L has the ref des
				refDesFromLine = self.getRefDes(line)
#				print 'found a ref des:', refDesFromLine
				outSchLine.append(refDesFromLine.strip('\n\r'))
				state = 'lookingForF1'
			elif state == 'lookingForF1' and line[0:3] == 'F 1':
				keepF1LineJIK = line
				state = 'lookingForF2'
			elif state == 'lookingForF2' and line[0:3] == 'F 2':
#				F 2 "DIP6" H 8001 3470 29  0000 C CNN
				footPrintLine = line[5:string.rfind(line,'\"')]
				outSchLine.append(footPrintLine.strip('\n\r'))
#				print 'found a footprint', footPrintLine
				state = 'lookingForComp'
			elif state == 'lookingForF2' and line[0] == '\t':
#				print 'found a part without a preexisting footprint', refDesFromLine.strip('\n\r')
				outSchLine.append('')
				state = 'lookingForComp'
			elif line.strip('\n\r') == '$EndComp':
				state = 'lookingForComp'
				outSchList.append(outSchLine)
				outSchLine = []
#		print outSchList
		return outSchList
	
	def searchCmpList(self, refDesFromLine, cmpList):
		'''Search the component list and return the footprint
		
		:param refDesFromLine: The reference designator of the current line
		
		:returns" the new reference designator from the cmp file
		'''
		for row in cmpList:
#			print 'comparing', refDesFromLine,
#			print ' to', row[0]
			if row[0].strip('\n\r') == refDesFromLine.strip('\n\r'):
				return row[1]
		print 'did not find footprint for ref des:', refDesFromLine
		return '~'
		
	def backAnnotateSchematic(self,cmpList,schList):
		'''
		$Comp
		L 4N26 U1
		U 1 1 537A4D39
		P 8200 3650
		F 0 "U1" H 7986 3829 40  0000 C CNN
		F 1 "4N26" H 8380 3465 40  0000 C CNN
		F 2 "DIP6" H 8001 3470 29  0000 C CNN
		F 3 "" H 8200 3650 60  0000 C CNN
			1    8200 3650
			1    0    0    -1  
		$EndComp
		
		:param cmpList: List of components in RefDes, 
		'''
		refDesVsFootprintInCmp = self.createCmpFootPrintList(cmpList)
		outSchList = []
		state = 'lookingForComp'
		for line in schList:
			outLine = line
#			print state
			if state == 'lookingForComp' and line[0:5] == '$Comp':	# $Comp is the flag that I am in a part
				state = 'lookingForL'
			elif state == 'lookingForL' and line[0] == 'L':			# L has the ref des
				refDesFromLine = self.getRefDes(line)
				newFootprint = self.searchCmpList(refDesFromLine, refDesVsFootprintInCmp)		# 
				state = 'lookingForF1'
			elif state == 'lookingForF1' and line[0:3] == 'F 1':
				keepF1LineJIK = line
				state = 'lookingForF2'
			elif state == 'lookingForF2' and line[0:3] == 'F 2' and newFootprint != '~':
				outLine = self.subRefDes(newFootprint, line)
				print 'replaced ', line
				print 'with', outLine
				state = 'lookingForComp'
			elif state == 'lookingForF2' and line[0] == '\t':
				print 'found a part without a preexisting footprint', refDesFromLine.strip('\n\r')
				newF2Line = self.createF2LineFromF1Line(keepF1LineJIK, newFootprint)
				outSchList.append(newF2Line)	# inserts the F2 line
				state = 'lookingForComp'
			elif line.strip('\n\r') == '$EndComp':
				state = 'lookingForComp'
			outSchList.append(outLine)
		return outSchList

	def createF2LineFromF1Line(self, f1Line, newFootpr):
		'''
		F 1 "4N26" H 8380 3465 40  0000 C CNN
		F 2 "DIP6" H 8001 3470 29  0000 C CNN		
		'''
		F2Line = self.subRefDes(newFootpr, f1Line)
		F2Line = F2Line[0:2] + '2' + F2Line[3:]
		print F2Line
		return F2Line
		
	def getRefDes(self, line):
		'''Extract the ref des from the line and return it
		
		:param line: The line that has the ref des, formated like 'L 4N26 U1'
		
		:returns: refDes String
		'''
		return line[string.rfind(line,' ')+1:]
		
	def subRefDes(self, subString, line):
		'''Insert the refDes string into the line in place of the old ref des.
		line format is: 'F 2 "DIP6" H 8001 3470 29  0000 C CNN'
		'''
		
		outString = line[0:5]
		outString += subString
		outString += line[string.rfind(line,'\"'):]
		return outString
		
	def writeOutSchematic(self, outList, outFileName):
#		outFileName = outFileName[0:-4] + '_test.sch'
		outSchFilePtr = open(outFileName,'wb')
		for line in outList:
			outSchFilePtr.write(line)
#			print line.strip('\n\r')
		return True

	def doKiSch2Cmp(self):
		'''The executive which calls all of the other functions.
		'''
		schFileName = self.selectKicadSchematic()
		if schFileName == '':
			errorDialog("Failed to open schematic file")
			return False
		schematicAsList = self.readInSchematic(schFileName)
		if schematicAsList == []:
			errorDialog("Failed to read in the schematic file")
			return False
		cmpFileName = schFileName[0:-4] + '.cmp'
		cmpFileAsList = self.readInCmpFile(cmpFileName)
		if cmpFileAsList == []:
			failString = "Failed to read in the cmp file\n" + cmpFileName + "\nFile not found."
			errorDialog(failString)
			return False
		print 'schematic file has lines:', len(schematicAsList)
		print 'cmp file has lines:', len(cmpFileAsList)
		newSchematicList = self.backAnnotateSchematic(cmpFileAsList, schematicAsList)
		self.writeOutSchematic(newSchematicList, schFileName)
		return True
	
	def checkSchematic(self, cmpList, schList):
		'''Check the schematic to see what the issues are
		'''
		cmpCrossRefList = self.createCmpFootPrintList(cmpList)
		schCrossRefList = self.createSchFootPrintList(schList)
		cmpCrossRefList = sorted(cmpCrossRefList, key = lambda errs: errs[0])	
		schCrossRefList = sorted(schCrossRefList, key = lambda errs: errs[0])	
#		print 'cmp file =', cmpCrossRefList
#		print 'sch file =', schCrossRefList
		if cmpCrossRefList == schCrossRefList:
			errorDialog('lists match no action required')
		else:
			errorDialog('lists are different')
			for line in cmpCrossRefList:
				if line not in schCrossRefList:
					print 'cmp file has part not in sch file. Ref Des:', line[0].strip('\n\r'),
					print 'footprint:', line[1].strip('\n\r')
			for line in schCrossRefList:
				if line not in cmpCrossRefList:
					print 'sch file has part not in cmp file. Ref des:', line[0].strip('\n\r'),
					if line[1].strip('\n\r') != '':
						print 'footprint:', line[1].strip('\n\r')
		return True
	
	def doKiSchChk(self):
		'''The executive which calls all of the other functions.
		'''
		print 'called doKiSchChk'
		schFileName = self.selectKicadSchematic()
		if schFileName == '':
			errorDialog("Failed to open schematic file")
			return False
		if self.backupSchematic(schFileName) != True:
			errorDialog("Failed to back up the schematic file")
			return False
		schematicAsList = self.readInSchematic(schFileName)
		if schematicAsList == []:
			errorDialog("Failed to read in the schematic file")
			return False
		cmpFileName = schFileName[0:-4] + '.cmp'
		cmpFileAsList = self.readInCmpFile(cmpFileName)
		if cmpFileAsList == []:
			failString = "Failed to read in the cmp file\n" + cmpFileName + "\nFile not found."
			errorDialog(failString)
			return False
		print 'schematic file has lines:', len(schematicAsList)
		print 'cmp file has lines:', len(cmpFileAsList)
		newSchematicList = self.checkSchematic(cmpFileAsList, schematicAsList)
		return True
	
class UIManager:
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
			("BackAnn", gtk.STOCK_PREFERENCES, "_Back Annotate", '<Control>B', "Back annotate schematic from cmp file", 0),
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
		SchClass = ProcessKicadSchematic()
		if backAnnotate == True:
			if SchClass.doKiSch2Cmp() != False:
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
		message = gtk.MessageDialog(type=gtk.MESSAGE_INFO, buttons=gtk.BUTTONS_OK)
		message.set_markup("About pyKiBackannSchem\nAuthor: Doug Gilliland\n(c) 2014 - All rights reserved\nProgram backannotates a Kicad sch file from a cmp file")
		message.run()
		message.destroy()
		
	def setSelProcess(self, action, current):
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
