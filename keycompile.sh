#!/usr/bin/bash


function compile_old() {
	(cd key; compile_new)
}

function compile_new() {
	/usr/bin/time -f "$(pwd) %E" -a -o compile.time.txt  ./gradlew --no-daemon --parallel $CLEAN testClasses
}

function select_java() {
	case $(pwd) in 
	*2020*|*2021-1-01*|*2021-4-01*) 
		export JAVA_HOME=~/.sdkman/candidates/java/8.0.452-tem/;;
	*2021-7-01*|*2021-10-01*|*2022*|*2023*) 
		export JAVA_HOME=~/.sdkman/candidates/java/17.0.15-tem/;;
	*) 
		export JAVA_HOME=~/.sdkman/candidates/java/21.0.7-tem/;;
	esac
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

PWD=$(pwd)

for dt in $@; do
	LOG=$(pwd)
	cd $dt
	compile	| tee $LOG/compile.$dt.log
	cd $PWD
done
