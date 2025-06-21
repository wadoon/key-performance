#!/usr/bin/bash -x

set -e 
function run_old() {
	cd key; run_new
	pwd
}

function run_new() {
	/usr/bin/time -a -o keyutiltest.time.txt -f "%U;%S;%e;%E;%P;%x;$(pwd);%C"  \
		./gradlew --no-daemon  $CLEAN key.util:test \
	| tee keycoretest.$dt.log
}

function run() {
	export JAVA_HOME=$(javaversion.py)
	if [ -d key ]; then # key is in sub-folder
		run_old
	else 
		run_new
	fi
}

BASE=$(pwd)

for dt in $@; do
	LOG=$(pwd)
	cd $BASE/$dt
	run 
done
