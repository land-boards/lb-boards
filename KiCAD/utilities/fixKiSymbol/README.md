DougsPCBDesigns
===============

Doug's fixKiSymbol
------------------

- Fixes schematic symbols which have a particular class of error.
- The symbols have comments inserted between DRAW and ENDDRAW commands.
- These comments cause the schematic to print an error message when the library is loaded.
- Removing the comments removes the error.
- The program works with drag and drop.
- Program renames the input file to filename_old.lib.
- Program saves the output file with the name of the original library.

See [Doug's PCB Designs Wiki][myWiki].
[myWiki]: http://dougspcbdesigns.pbworks.com/ "Doug's PCB Wiki"
