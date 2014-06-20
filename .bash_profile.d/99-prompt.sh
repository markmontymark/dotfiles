## fix for broken scrolling in os x
## from: https://discussions.apple.com/thread/3804269, wrap  \e[\d+m\  within \[ and \]
## for example, \e[32\m  becomes \[\e[32\m\]
PS1='\[\e[32m\]`date +%H:%M`\[\e[0m\] \[\e[37m\]\u\[\e[0m\] \[\e[36m\]`ellipsisize \W`\[\e[0m\] '
