import pygtk
pygtk.require('2.0')

import gtk

class BoardClass:
	"""Find file with the file chooser dialog
	"""
	def findBrdFile(self):
		"""findBrdFile() - This is the dialog which locates the sch files
		
		:returns: path/name of the file that was selected
		"""
		csvFileString = "Select file"
		dialog = gtk.FileChooserDialog(csvFileString,
	                               None,
	                               gtk.FILE_CHOOSER_ACTION_OPEN,
	                               (gtk.STOCK_CANCEL, gtk.RESPONSE_CANCEL,
	                               gtk.STOCK_OPEN, gtk.RESPONSE_OK))
		dialog.set_default_response(gtk.RESPONSE_OK)

		dialog.set_current_folder('.')
		filter = gtk.FileFilter()
		filter.set_name("BRD files")
		filter.add_pattern("*.brd")
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
boardName = boardClass.findBrdFile()
print boardName
boardFilePtr = open(boardName, 'r')

backAnnFileName = boardName[0:boardName.rfind('\\')+1] + 'board.baf'
print backAnnFileName
bafFilePtr = open(backAnnFileName, 'r')

newBrdFileName = boardName[0:-4] + '_newboard.brd'
print newBrdFileName
newBrdFilePtr = open(newBrdFileName, 'w')

refDesList = []
for line in bafFilePtr:
	refDesPair = []
	wasRefDes = line[0:line.find(',')]
	isRefDes = line[line.find(',')+1:-1]
	refDesPair.append(wasRefDes)
	refDesPair.append(isRefDes)
	refDesList.append(refDesPair)
	print wasRefDes,
	print isRefDes

print refDesList

for line in boardFilePtr:
	if line[0:2] == 'T0':
#		print line
		refDesOld = line[line.find('"')+1:-2]
		newLine = line[0:line.find('"')+1]
		for refDes in refDesList:
			if refDes[0] == refDesOld:
				newLine += refDes[1]
				newLine += '\n'
				break
		print newLine
		newBrdFilePtr.write(newLine)
	else:
		print line,
		newBrdFilePtr.write(line)
