
ISRUNNING=`ps -eaf | grep nginx | grep -v grep | grep -v startnginx`

if [ "x$ISRUNNING" == "x" ]; then
	nginx
fi

unset ISRUNNING


