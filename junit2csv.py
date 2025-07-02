#!/usr/bin/python3

import xml.etree.ElementTree as ET
import sys
from pathlib import Path

FMT = '"%s", %s","%s",%s'

RUNID = sys.argv[1]

print(FMT % ("run", "classname", "name", "time"))
for fil in sys.argv[2]:
    root = ET.parse(fil, ET.XMLParser(encoding="utf8")).getroot()
    for testcase in root.findall("testsuite"):
        values = (
            RUNID,
            testcase.attrib['classname'],
            testcase.attrib['name'],
            testcase.attrib['time'],
        )
        print(FMT % values)
