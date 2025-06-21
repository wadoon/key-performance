#!/usr/bin/bash

function compile_old() {
	cd key
	./gradlew --parallel clean testClasses
	cd ..
}

function compile_new() {
	./gradlew --parallel clean testClasses
}

function compile() {
	cd $BASE
	if [ -d key ]; then # key is in sub-folder
		compile_old
	else 
		compile_new
	fi
}

function checkout_date() {
	git checkout $(git rev-list -1 --before $1 origin/main)
	git clean -f 	
}

BASE=$(readlink -f $1) 
shift

for dt in $@; do
	cd $BASE 
	checkout_date $dt
	compile	
done
