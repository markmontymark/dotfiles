#!/bin/sh

DEFAULT_PRIVATE_KEY=~/.ssh/id_rsa

usage(){
	echo "Usage:
	$0 [~/.ssh/path/to/key/file]"
}

die() { 
	echo "$@" 1>&2 ; 
	exit 1; 
}

reconnect_ssh_agent(){
	private_key=${1:-$DEFAULT_PRIVATE_KEY}
	if [ ! -e $private_key ] 
	then
		usage
		die "Error: private key, $private_key, doesn't exist"
	fi

	ssh_add_ls_output=`ssh-add -l`
	if [ "$ssh_add_ls_output" == "Could not open a connection to your authentication agent." ]
	then
		echo "need to start ssh-agent"
		pkill ssh-agent
		eval `ssh-agent -s`
	fi

	ssh_add_ls_output=`ssh-add -l`
	if [ "$ssh_add_ls_output" == "The agent has no identities." ]
	then
		echo "need to add private key"
		ssh-add $private_key
	fi
}

#reconnect_ssh_agent $1
