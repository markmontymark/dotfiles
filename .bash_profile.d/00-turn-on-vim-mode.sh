#!/usr/bin/env bash

turn_on_vi(){
	set -o vi
	## this doesn't really do anything (yet?)
	set show-mode-in-prompt on
}

turn_off_vi(){
	set -o emacs
	## this doesn't really do anything (yet?)
	set show-mode-in-prompt off
}

turn_off_vi
