isrunning(){
   ps -eaf |grep $1 | grep -v grep
}

