#!/usr/bin/env bash

ellipsisize() {
	d=$1
	if [ ${#d} -gt 75 ] ; then
		echo "${d:0:50}...${d:${#d}-24:${#d}}"
	else
		echo $1
	fi
}
