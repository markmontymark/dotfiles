#!/usr/bin/env bash

# This was written to stop amazon music player / helper / annoyer / pain-in-the-!@#$er from respawning and killing my CPU
# Usage: stop_respawning amazon
# The above unloaded Library/LaunchDaemons/com.amazon.music.plist and com.amazon.cloud-player.plist
stop_respawing(){
	substr=$1
	if [ `ps -eaf | grep -i $1` ]; then
		launchctl unload Library/LaunchDaemons/*$1*
	fi
}
