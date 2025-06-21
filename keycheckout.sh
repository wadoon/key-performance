#!/usr/bin/bash

PWD=$(pwd)
TARGET=$PWD/keyrepos
mkdir -p $TARGET

for dt in $@; do
	rev=$(git rev-list -1 --before $dt main)
	git worktree add $TARGET/$dt $rev
done
