#!/usr/bin/bash


function compile_old() {
	(cd key; compile_new)
}

function compile_new() {
	/usr/bin/time -a -o $PWD/compile.time.txt -f "%U;%S;%e;%E;%P;%x;$(pwd);%C"  \
		./gradlew --no-daemon --parallel $CLEAN testClasses 
}

function select_java() {
	export JAVA_HOME=$(javaversion.py)
	echo $JAVA_HOME
}


function compile() {
	select_java 
	if [ -d key ]; then # key is in sub-folder
		compile_old
	else 
		compile_new
	fi
}

BASE=$(pwd)

for dt in $@; do
	LOG=$(pwd)
	cd $dt
	compile	| tee $LOG/compile.$dt.log
	cd $BASE
done
