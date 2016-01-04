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

refDesList = []

for line in boardFilePtr:
	if line[0:2] == 'T0':
		refDesList.append(line[line.find('"')+1:-2])

sortedRefDesList = sorted(refDesList)

backAnnFileName = boardName[0:boardName.rfind('\\')+1] + 'board.baf'
print backAnnFileName

bafFilePtr = open(backAnnFileName, 'w')

for refDes in sortedRefDesList:
	outStr = refDes + ',' + refDes[0] + '\n'
	bafFilePtr.write(outStr)

