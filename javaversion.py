#!/usr/bin/python3.9

from os.path import expanduser
from pathlib import Path
from datetime import datetime
year,month,day = map(int, Path.cwd().name.split("-"))
folderdate = datetime(year,month,day)


if folderdate  < datetime(2020,2,1): 
    path = ("~/.sdkman/candidates/java/8.0.452-tem/")
elif folderdate  < datetime(2023,12,31): 
    path = ("~/.sdkman/candidates/java/11.0.27-tem/")
elif folderdate  < datetime(2023,12,31): 
    path = ("~/.sdkman/candidates/java/17.0.15-tem/")
else:
    path = ("~/.sdkman/candidates/java/21.0.7-tem/")

print(expanduser(path))

