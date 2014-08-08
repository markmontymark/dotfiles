function sshcopyid(){
	cat $1 | ssh $2 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
}

