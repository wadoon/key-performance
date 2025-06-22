#!/usr/bin/python3


import xml.etree.ElementTree as ET
import sys 
from pathlib import Path 

newRoot = ET.Element("testrun")

for fil in sys.argv[1:]:
    root = ET.parse(fil, ET.XMLParser(encoding="utf8")).getroot()
   
    sout = root.find('system-out')
    if sout is not None:
        root.remove(sout)

    serr = root.find('system-err')
    if serr is not None:
        root.remove(serr)



    newRoot.append(root)

print(ET.tostring(newRoot, encoding='utf8').decode('utf8'))
