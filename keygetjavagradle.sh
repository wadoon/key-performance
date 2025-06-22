#!/bin/bash 

BASE=$(pwd)
echo "folder;java;gradle"
for folder in $@; do 
	cd $folder
	java=$(basename $(javaversion.py))
	[ -d key ] &&  cd key

	gradle=$(
	grep 'distributionUrl' gradle/wrapper/gradle-wrapper.properties |\
		sed 's/.*gradle-//' |\
		sed 's/-bin.zip//'  |\
		sed 's/-all.zip//'
	)

	folder=$(
	echo $folder | \
		sed 's/\///g' | \
		sed 's/-1-/-01-/g' | \
		sed 's/-4-/-04-/g' | \
		sed 's/-7-/-07-/g'   
	)

	echo "$folder;$java;$gradle" 
	cd $BASE
done 




