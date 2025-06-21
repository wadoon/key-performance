#!/usr/bin/bash


export GIT_DIR=$(readlink -f $1)
PWD=$(pwd)
TARGET=$PWD/keyrepos
mkdir -p $TARGET
shift

for dt in $@; do
	rev=$(git rev-list -1 --before $dt main)
	git worktree add $TARGET/$dt $rev
done
