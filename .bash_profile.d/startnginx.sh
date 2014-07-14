#!/usr/bin/env bash

## TODO, use isrunning.bash function, update it to pass N many thing to grep -v, ie nginx, startnginx
ISRUNNING=`ps -eaf | grep nginx | grep -v grep | grep -v startnginx`

if [ "x$ISRUNNING" == "x" ]; then
	nginx
fi

unset ISRUNNING


