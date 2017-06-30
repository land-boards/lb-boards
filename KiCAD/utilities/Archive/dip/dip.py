#!/usr/bin/python
#
# Generate a 'skeleton' DIP component from list of pin functions
# 
#
# You could have a list of these XML 'meta' components, then for an 
# individual design edit them in the GUI to say if the pins were
# input/output/open collector etc...
#
# bifferos (bifferos@yahoo.co.uk) 8 Jan 2006.
#

import xml.dom.minidom,sys, os


# Template for the library file that will be created.  Tweak the values
# here to control default component parameters.

template = """EESchema-LIBRARY Version 2.3  Date: 6/1/2006-02:22:33
#
# %(name)s
#
DEF %(name)s %(family)s 0 40 Y Y 1 F N
F0 "%(family)s" 0 0 60 H V C C
F1 "%(name)s" 0 -100 60 H V C C
DRAW
%(box)s
%(pins)s
ENDDRAW
ENDDEF
#
#End Library
"""

def PinDescriptions(comp):
  "Read in the pin descriptions as a list"
  el = comp.getElementsByTagName("component")[0]
  xbits=[i.data for i in el.childNodes if i.nodeType==el.TEXT_NODE]
  
  # Split into lines
  bits = "".join(xbits).split("\n")
  #Remove white space
  bits = [ i.strip() for i in bits ]
  #Remove empty strings
  bits = [ i for i in bits if i!="" ] 
  return bits
  
  
def MetaData(comp):
  "Extract the component description parameters (common to all pins)"
  el = comp.getElementsByTagName("component")[0]
  d = {}
  for name, value in el.attributes.items() :
    d[name] = value
  return d
    
  
def GetTemplateDict(pins, d) :
  "Get the Kicad format lib file - only works for DIP at the mo."
  if d["type"] != "DIP":
    print "Unsupported package"
  
  pl = len(pins)
  left_p = pins[:pl/2]
  right_p = pins[pl/2:]
  # Height is dependent on the number of pins.
  height = (len(left_p)+1)*100
  width = 2000     # What should be a standard width???
  left = -width/2
  top = height/2
  right = width/2
  bottom = -height/2
  d["box"] = "S %d %d %d %d 0 1 0 N"%(left,top,right,bottom)
  plen = 300

  count = 1
  txt = []
  for pin in left_p :
    ypos = top - (count*100)
    xpos = left - plen
    txt.append( "X %s %d %d %d %d R 50 50 1 1 B"%(pin,count,xpos,ypos,plen) )
    count += 1

  for pin in right_p :
    ypos = bottom + ((count-len(left_p))*100)
    xpos = right + plen
    txt.append( "X %s %d %d %d %d L 50 50 1 1 B"%(pin,count,xpos,ypos,plen) )
    count += 1

  d["pins"] = "\n".join(txt)
  return d


def Help():
  print """Usage: %s <spec file> <lib file>
  
Where <spec file> is a file containing the PIN descriptions
and <lib file> is the name of the generated component description.

<spec file> is an XML format file, containing the pin descriptions and
optional meta data.  It contains a single XML element 'component'.

example:
<component name="some name" family="some family" type="DIP">
PIN1DESCRIPTION
PIN2DESCRIPTION
...
</component>
"""%os.path.split(sys.argv[0])[1]
  sys.exit(-1)




if __name__ == "__main__" :
  if not sys.argv[2:] :
    Help()
  if not os.path.isfile(sys.argv[1]) :
    Help()
  # Read in the XML file
  comp = xml.dom.minidom.parse( sys.argv[1] )
  pins = PinDescriptions(comp)
  meta = MetaData(comp)
  d = GetTemplateDict(pins, meta)
  out = template%d
  file(sys.argv[2],"wb").write(out)
  print "File %s written"%sys.argv[2]


