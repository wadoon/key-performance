#!/bin/bash

echo "user;sys;elapsed;ELAPSED;usage;exit;pwd;command"
cat */{key,}/$1 | \
	sed 's/-1-/-01-/g' - | \
	sed 's/-4-/-04-/g' - | \
	sed 's/-7-/-07-/g' - | \
	grep -v exited


