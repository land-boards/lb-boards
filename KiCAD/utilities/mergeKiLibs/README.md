Land Boards, LLC - Kicad Utilities
==================================

mergeKiLibs
-----------

- Program merges two KiCad schematic libraries into a single library file.
- Program compares the two files and looks for duplicate parts.
- If there are matching part names, the program compares the matching parts line-by-line.
- If the matching part names have identical contents, the merged result is written out.
- ALIAS and FPLIST (footprint lists) are automatically merged in most cases into the output.
- Parts that are unique to each of the single files are also written out.
- The result is _not_ alphabetically sorted.
- The parts that have matching part names are not written out.
- The parts that have matching part names result in an warning message.
- #End Library is automatically written to the end of the file.
- File names are passed on the command line.
