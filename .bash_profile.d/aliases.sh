alias lt='ls -lart'
alias ll='ls -l'
alias l='ls'

alias www='cd $WWW' # from 00-vars.sh

alias jenkins-start="cd $HOME/projects/jenkins; nohup java -Dorg.jenkinsci.plugins.gitclient.Git.useCLI=true -jar jenkins.war > jenkins.log 2>&1 &"
alias jenkins-stop='wget http://localhost:8080/exit'

