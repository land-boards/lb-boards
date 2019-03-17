"""
Back-annotate footprints on a Kicad schematic from the PCB.

========
Workflow
========

* Run this program
* Select the .sch file
* The netlist file and pcb file are automatically loaded
* Only works for single file schematics

=====
Usage
=====

Program is run by either typing python pyKiBackannSchem.py or double clicking pyKiBackannSchem.py.

=======
Formats
=======

NetList format
==============

* (comp (ref D99)
* (net (code 26) (name "Net-(D99-Pad1)")
* (node (ref RP4) (pin 8))
* (node (ref D99) (pin 1)))

PCB format
==========

* (L130) (net 47 "Net-(D99-Pad1)")
* (L131) (net 48 "Net-(D99-Pad2)")
* (L170) (add_net "Net-(D99-Pad1)")
* (L171) (add_net "Net-(D99-Pad2)")
* (L580) (fp_text reference D99 (at 1.905 5.08 180) (layer F.SilkS)
* (L851) (pad 1 thru_hole circle (at -1.27 0 90) (size 1.6764 1.6764) (drill 0.8128) (layers *.Cu *.Mask F.SilkS)
* (L596) (net 47 "Net-(D99-Pad1)"))
* (L597) (pad 2 thru_hole circle (at 1.27 0 90) (size 1.6764 1.6764) (drill 0.8128) (layers *.Cu *.Mask F.SilkS)
* (L598) (net 48 "Net-(D99-Pad2)"))
* (L792) (pad 1 thru_hole rect (at -1.27 0 180) (size 1.524 1.524) (drill 1.016) (layers *.Cu *.Mask F.SilkS)
* (L793) (net 48 "Net-(D99-Pad2)"))
* (L1298) (pad 8 thru_hole circle (at 8.89 0 90) (size 1.397 1.397) (drill 0.8128) (layers *.Cu *.Mask F.SilkS)
* (L1299) (net 47 "Net-(D99-Pad1)"))

Schematic format
================

* $Comp
* L LED-RESCUE-LED-TEST-2 D99
* U 1 1 544A66CA
* P 6850 4650
* F 0 "D99" H 6850 4750 50  0000 C CNN
* F 1 "LED" H 6850 4550 50  0000 C CNN
* F 2 "LEDs:LED-5MM" H 6850 4650 60  0000 C CNN
* F 3 "" H 6850 4650 60  0001 C CNN
* 	1    6850 4650
* 	-1   0    0    -1  
* $EndComp


===============
Output Messages
===============

* Error message are sent to the stdout.
* When the program is done it has a dialog box which gives time to look at the error log.

=======
Options
=======

* Check only
* Back annotate (default choice)

===
API
===

"""

import csv
import os
import sys
import string
sys.path.append('C:\\Users\\Doug\\Documents\\GitHub\\lb-Python-Code\\dgCommonModules')
sys.path.append('C:\\HWTeam\\Utilities\\dgCommonModules')

defaultPath = '.'

from dgProgDefaults import *

backAnnotate = True

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

class ProcessKicadSchematic:
	"""Methods related to reading KiCad schematic, netlist and pcb files
	"""
	def	extractPathFromPathfilename(self,fullPathFilename):
		"""
		:param fullPathFilename: The path with file name
		:returns: the path without the file name
		
		Extract Path from fullPathFilename
		"""
		return(fullPathFilename[0:fullPathFilename.rfind('\\')+1])
	
	def selectKicadSchematic(self):
		"""
		:returns: path/name of the file that was selected
		
		This is the dialog which locates the Kicad Schematic files
		"""
		global defaultPath
		dialog = gtk.FileChooserDialog("Select sch file",None,gtk.FILE_CHOOSER_ACTION_OPEN,(gtk.STOCK_CANCEL, gtk.RESPONSE_CANCEL,gtk.STOCK_OPEN, gtk.RESPONSE_OK))
		dialog.set_default_response(gtk.RESPONSE_OK)

		filter = gtk.FileFilter()
		filter.set_name("Kicad Schematic files")
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

	def backupSchematic(self, schFileName):
		"""
		:param schFileName: The name of the schematic file
		:returns: True if passed, exits if fails
		
		Back up the schematic file by renaming the file as _sch.bak.
		"""
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
	
	def replaceRefDesInSch(self,row,refDesSchVsPc):
		"""
		:param row: The schematic ref des
		:param refDesSchVsPc: Cross-reference list of ref des
		:returns: The new row
		
		L LED-RESCUE-LED-TEST-2 D99
		"""
		rowPrefix = row[0:row.rfind(' ')]
		oldRefDes = row[row.rfind(' ') + 1:-1]
		# print 'replaceRefDesInSch: old ref des',oldRefDes
		newRefDes = ''
		for refDesPair in refDesSchVsPc:
			if refDesPair[0] == oldRefDes:
				newRefDes = refDesPair[1]
		if newRefDes == '':
			# print 'replaceRefDesInSch: could not match ref des', oldRefDes
			newRow = row
		elif newRefDes == oldRefDes:
			newRow = row
		else:
			# print 'substituting ref des',newRefDes,'for ref des',oldRefDes
			newRow = rowPrefix + ' ' + newRefDes + '\n'
		return newRow
	
	def replaceRefDesInSchSilkscreen(self,row,refDesSchVsPc):
		"""
		:param row: The schematic ref des silkscreen row
		:param refDesSchVsPc: Cross-reference list of ref des
		:returns: The new row
		
		F 0 "D99" H 6850 4750 50  0000 C CNN
		"""
		vect = []
		rowPrefix = row[0:row.find('"')+1]
		rowSuffix = row[row.rfind('"'):-1]
		oldRefDes = row[row.find('"')+1:row.rfind('"')]
		vect.append(rowPrefix)
		vect.append(rowSuffix)
		vect.append(oldRefDes)
		# print 'vect',vect
		# print 'replaceRefDesInSchSilkscreen: old ref des',oldRefDes
		newRefDes = ''
		for refDesPair in refDesSchVsPc:
			if refDesPair[0] == oldRefDes:
				newRefDes = refDesPair[1]
		if newRefDes == '':
			# print 'replaceRefDesInSchSilkscreen: could not match ref des', oldRefDes
			newRow = row
		elif newRefDes == oldRefDes:
			newRow = row
		else:
			# print 'substituting ref des',newRefDes,'for ref des',oldRefDes
			newRow = rowPrefix + newRefDes + rowSuffix + '\n'
		return newRow
	
	def backAnnotateSch(self,schList,refDesSchVsPc):
		"""
		:param schList: The schematic as a list
		:param refDesSchVsPc: Cross-reference list of ref des
		:returns: The new row
		
		$Comp
		L LED-RESCUE-LED-TEST-2 D16
		U 1 1 544A66CA
		P 6850 4650
		F 0 "D99" H 6850 4750 50  0000 C CNN
		F 1 "LED" H 6850 4550 50  0000 C CNN
		F 2 "LEDs:LED-5MM" H 6850 4650 60  0000 C CNN
		F 3 "" H 6850 4650 60  0001 C CNN
		1    6850 4650
		1   0    0    -1  
		$EndComp
		"""
		# print 'backAnnotateSch'
		newSchList = []
		state = 'waitForComp'
		for row in schList:
			if '$Comp' in row and state == 'waitForComp':
				newSchList.append(row)
				state = 'gotComp'
			elif state == 'gotComp':
				# print 'ref des was', row,
				newRefDesRow = self.replaceRefDesInSch(row,refDesSchVsPc)
				# print 'ref des new',newRefDesRow
				newSchList.append(newRefDesRow)
				state = 'waitingForF0'
			elif state == 'waitingForF0' and 'F 0 "' in row:
				# print 'waitingForF0 ref des was', row,
				newRefDesRow = self.replaceRefDesInSchSilkscreen(row,refDesSchVsPc)
				# print 'waitingForF0 ref des new',newRefDesRow
				newSchList.append(newRefDesRow)
				state = 'waitingForEndComp'
			elif '$EndComp' in row and state == 'waitingForEndComp':
				newSchList.append(row)
				state = 'waitForComp'
			else:
				newSchList.append(row)
			# if state != 'waitForComp':
				# print 'state',state
		return newSchList
		
	def writeOutSchematic(self, outList, outFileName):
		"""
		:param outList: The new schematic as a list
		:param outFileName: The path file name to store the list into
		:returns: True
		
		"""
#		outFileName = outFileName[0:-4] + '_test.sch'
		outSchFilePtr = open(outFileName,'wb')
		for line in outList:
			outSchFilePtr.write(line)
#			print line.strip('\n\r')
		return True

	def checkSchematicvsNetlist(self, schList, netList):
		"""
		:param schList: The schematic as a list
		:param netList: The netlist
		:returns: True if OK, False if error
		
		Check the schematic against the netlist
		"""
		errorsFound = False
		schTimestampList = []
		for rdtsPair in schList:
			schTimestampList.append(rdtsPair[1])
		for rdtsPair in netList:
			if rdtsPair[1] not in schTimestampList:
				print 'checkSchematicvsNetlist: could not find ref des in schematic',rdtsPair[0]
				errorsFound = True
		netTimestampList = []
		for rdtsPair in netList:
			netTimestampList.append(rdtsPair[1])
		for rdtsPair in schList:
			if rdtsPair[1] not in netTimestampList:
				print 'checkSchematicvsNetlist: could not find ref des in netlist',rdtsPair[0]
				errorsFound = True
		return not errorsFound
	
	def makeSchVsPcbRefDesList(self, schList, pcbList):
		"""
		:param schList: The schematic as a list
		:param pcbList: The pcb as a list
		:returns: True if OK, False if error
		
		Make the schematic vs netlist ref des list
		"""
		newRefDes = []
		for rtdsPairSch in schList:
			for rtdsPairPcb in pcbList:
				if rtdsPairSch[1] == rtdsPairPcb[1]:
					refDesLine = []
					refDesLine.append(rtdsPairSch[0])
					refDesLine.append(rtdsPairPcb[0])
					newRefDes.append(refDesLine)
		for row in newRefDes:
			if row[0] != row[1]:
				print 'makeSchVsPcbRefDesList: Difference (sch,pcb):',row[0], row[1]
		# print 'makeSchVsPcbRefDesList',newRefDes
		return(newRefDes)
	
	def checkSchematicvsPcb(self, schList, pcbList):
		"""
		:param schList: The schematic as a list
		:param pcbList: The pcb as a list
		:returns: True if OK, False if error
		
		Check the schematic against the pcb
		"""
		errorsFound = False
		schTimestampList = []
		for rdtsPair in schList:
			schTimestampList.append(rdtsPair[1])
		for rdtsPair in pcbList:
			if rdtsPair[1] not in schTimestampList:
				print 'checkSchematicvsPcb: could not find ref des in schematic',rdtsPair[0]
				errorsFound = True
		netTimestampList = []
		for rdtsPair in pcbList:
			netTimestampList.append(rdtsPair[1])
		for rdtsPair in schList:
			if rdtsPair[1] not in netTimestampList:
				print 'checkSchematicvsPcb: could not find ref des in pcb',rdtsPair[0]
				errorsFound = True

		return not errorsFound

	def getSchematicRefDesTimestamp(self, schList):
		"""
		:param schList: The schematic as a list
		:returns: list of ref des vs time stamps for the schematic
		
		Make a list of ref des vs timestamp for schematics
		$Comp
		L CONN_2 P6
		U 1 1 544A664D
		P 3200 3750
		F 0 "P6" V 3150 3750 40  0000 C CNN
		F 1 "CONN_2" V 3250 3750 40  0000 C CNN
		F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 3200 3750 60  0000 C CNN
		F 3 "" H 3200 3750 60  0000 C CNN
			1    3200 3750
			-1   0    0    1   
		$EndComp
		"""
		schRefDesList = []
		state = 'waiting'
		newLine = []
		for line in schList:
			if '$Comp' in line and state == 'waiting':
				state = 'gotComp'
			elif line[0] == 'L' and state == 'gotComp':
				state = 'gotRefDes'
				newLine.append(line[line.rfind(' ')+1:-1])
			elif line[0] == 'U' and state == 'gotRefDes':
				state = 'gotTimeStamp'
				newLine.append(line[line.rfind(' ')+1:-1])
				schRefDesList.append(newLine)
				newLine = []
			elif '$EndComp' in line and state == 'gotTimeStamp':
				state = 'waiting'
		#print 'sch - ref des vs time stamps',schRefDesList
		return schRefDesList
	
	def getNetListRefDesTimestamp(self, netList):
		"""
		:param netList: The netList as a list
		:returns: list of ref des vs time stamps for the netList
		
		Make a list of ref des vs timestamp for netlists
		(comp (ref RP4)
		(value RP4X2)
		(footprint Resistors_ThroughHole:Resistor_Array_SIP8)
		(libsource (lib DougsSch) (part RP4X2))
		(sheetpath (names /) (tstamps /))
		(tstamp 546FA54B)))
		"""
		netRefDesList = []
		state = 'waiting'
		newLine = []
		for line in netList:
			if '(comp (ref ' in line and state == 'waiting':
				newLine.append(line[line.rfind(' ')+1:line.find(')')])
				state = 'gotComp'
			elif '(tstamp ' in line and state == 'gotComp':
				newLine.append(line[line.rfind(' ')+1:line.find(')')])
				state = 'waiting'
				netRefDesList.append(newLine)
				newLine = []
		#print 'net - ref des vs time stamps',netRefDesList
		return netRefDesList
	
	def getPcbRefDesTimestamp(self, pcbList):
		"""
		(path /544A6677)
		(fp_text reference D12 (at 1.27 5.08 180) (layer F.SilkS)
		"""
		pcbRefDesList = []
		#print 'getPcbRefDesTimestamp',pcbList
		state = 'waiting'
		newLine = []
		# print 'state',state
		timeStamp = ''
		for line in pcbList:
			if '(path /' in line and state == 'waiting':
				timeStamp = line[line.rfind('/')+1:-2]
				# print 'timeStamp:',timeStamp
				state = 'gotTimeStamp'
			elif '(fp_text reference ' in line and state == 'gotTimeStamp':
				refDes = line[23:line.find('(',24)-1]
				# print 'refDes',refDes
				newLine.append(refDes)
				newLine.append(timeStamp)
				pcbRefDesList.append(newLine)
				newLine = []
				state = 'waiting'
			# if state != 'waiting':
				# print 'state',state
		# print 'pcb - ref des vs time stamps',pcbRefDesList
		# sys.exit()
		return pcbRefDesList
	
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
		
		schFileName = self.selectKicadSchematic()
		if schFileName == '':
			errorDialog("Failed to open schematic file")
			return False
		if self.backupSchematic(schFileName) != True:
			errorDialog("Failed to back up the schematic file")
			return False
		schematicAsList = self.readInFile(schFileName)
		if schematicAsList == []:
			errorDialog("Failed to read in the schematic file")
			return False
		pcbFileName = schFileName[0:-4] + '.kicad_pcb'
		pcbFileAsList = self.readInFile(pcbFileName)
		if pcbFileAsList == []:
			failString = "Failed to read in the pcb file\n" + pcbFileName + "\nFile not found."
			errorDialog(failString)
			return False
		netFileName = schFileName[0:-4] + '.net'
		netFileAsList = self.readInFile(netFileName)
		if netFileAsList == []:
			failString = "Failed to read in the net file\n" + netFileName + "\nFile not found."
			errorDialog(failString)
			return False
		print 'schematic file has lines:', len(schematicAsList)
		print 'net file has lines:', len(netFileAsList)
		print 'pcb file has lines:', len(pcbFileAsList)
		schGetRefDesTimestamp = self.getSchematicRefDesTimestamp(schematicAsList)
		netGetRefDesTimestamp = self.getNetListRefDesTimestamp(netFileAsList)
		pcbGetRefDesTimestamp = self.getPcbRefDesTimestamp(pcbFileAsList)
		
		if self.checkSchematicvsNetlist(schGetRefDesTimestamp, netGetRefDesTimestamp):
			print 'checkSchematicvsNetlist: OK'
		else:
			errorDialog('Schematic vs netlist - error')
		refDesSchVsPc = self.makeSchVsPcbRefDesList(schGetRefDesTimestamp, pcbGetRefDesTimestamp)

		if self.checkSchematicvsPcb(schGetRefDesTimestamp, pcbGetRefDesTimestamp):
			print 'checkSchematicvsPcb: OK'
		else:
			errorDialog('Schematic vs pcb - error')
		
		# print 'refDesSchVsPc list:',refDesSchVsPc
		outList = self.backAnnotateSch(schematicAsList,refDesSchVsPc)
		outFileName = schFileName
		self.writeOutSchematic(outList,outFileName)
		return True
	
	def doKiSchChk(self):
		"""Check option.
		The executive which calls all of the other functions.
		"""
		print 'called doKiSchChk'
		schFileName = self.selectKicadSchematic()
		if schFileName == '':
			errorDialog("Failed to open schematic file")
			return False
		if self.backupSchematic(schFileName) != True:
			errorDialog("Failed to back up the schematic file")
			return False
		schematicAsList = self.readInFile(schFileName)
		if schematicAsList == []:
			errorDialog("Failed to read in the schematic file")
			return False
		pcbFileName = schFileName[0:-4] + '.kicad_pcb'
		pcbFileAsList = self.readInFile(pcbFileName)
		if pcbFileAsList == []:
			failString = "Failed to read in the pcb file\n" + pcbFileName + "\nFile not found."
			errorDialog(failString)
			return False
		netFileName = schFileName[0:-4] + '.net'
		netFileAsList = self.readInFile(netFileName)
		if netFileAsList == []:
			failString = "Failed to read in the net file\n" + netFileName + "\nFile not found."
			errorDialog(failString)
			return False
		print 'schematic file has lines:', len(schematicAsList)
		print 'net file has lines:', len(netFileAsList)
		print 'pcb file has lines:', len(pcbFileAsList)
		schGetRefDesTimestamp = self.getSchematicRefDesTimestamp(schematicAsList)
		netGetRefDesTimestamp = self.getNetListRefDesTimestamp(netFileAsList)
		pcbGetRefDesTimestamp = self.getPcbRefDesTimestamp(pcbFileAsList)
		
		if self.checkSchematicvsNetlist(schGetRefDesTimestamp, netGetRefDesTimestamp):
			print 'OK'
		else:
			errorDialog('Schematic vs netlist - error')
		self.makeSchVsPcbRefDesList(schGetRefDesTimestamp, pcbGetRefDesTimestamp)

		if self.checkSchematicvsPcb(schGetRefDesTimestamp, pcbGetRefDesTimestamp):
			print 'OK'
		else:
			errorDialog('Schematic vs pcb - error')
			
		
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
		"""
		"""
		SchClass = ProcessKicadSchematic()
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
