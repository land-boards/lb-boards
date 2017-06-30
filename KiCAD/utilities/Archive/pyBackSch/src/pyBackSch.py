import pygtk
pygtk.require('2.0')

import gtk

class BoardClass:
	"""Find file with the file chooser dialog
	"""
	def findSchFile(self):
		"""findSchFile() - This is the dialog which locates the sch files
		
		:returns: path/name of the file that was selected
		"""
		csvFileString = "Select SCH file"
		dialog = gtk.FileChooserDialog(csvFileString,
	                               None,
	                               gtk.FILE_CHOOSER_ACTION_OPEN,
	                               (gtk.STOCK_CANCEL, gtk.RESPONSE_CANCEL,
	                               gtk.STOCK_OPEN, gtk.RESPONSE_OK))
		dialog.set_default_response(gtk.RESPONSE_OK)

		dialog.set_current_folder('.')
		filter = gtk.FileFilter()
		filter.set_name("SCH files")
		filter.add_pattern("*.sch")
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

boardClass = BoardClass()
schName = boardClass.findSchFile()
print schName
schFilePtr = open(schName, 'r')

backAnnFileName = schName[0:schName.rfind('\\')+1] + 'board.baf'
print backAnnFileName
bafFilePtr = open(backAnnFileName, 'r')

newSchFileName = schName[0:-4] + '_new.sch'
print newSchFileName
newSchFilePtr = open(newSchFileName, 'w')

refDesList = []
for line in bafFilePtr:
	refDesPair = []
	wasRefDes = line[0:line.find(',')]
	isRefDes = line[line.find(',')+1:-1]
	refDesPair.append(wasRefDes)
	refDesPair.append(isRefDes)
	refDesList.append(refDesPair)

print refDesList

for line in schFilePtr:
	if line[0:2] == 'L ':
		print line,
		refDesOld = line[line.rfind(' ')+1:-1]
#		print refDesOld
		newLine = line[0:line.rfind(' ')+1]
		for refDes in refDesList:
			if refDes[0] == refDesOld:
				newLine += refDes[1]
				newLine += '\n'
				break
		print newLine,
		newSchFilePtr.write(newLine)
	elif line[0:4] == 'F 0 ':
		print line,
		refDesOld = line[line.find('"')+1:line.rfind('"')]
#		print refDesOld,
		newLine = line[0:line.find('"')+1]
		for refDes in refDesList:
			if refDes[0] == refDesOld:
				newLine += refDes[1]
				newLine += line[line.rfind('"'):]
				break
		print newLine,
		newSchFilePtr.write(newLine)		
	else:
#		print line,
		newSchFilePtr.write(line)
