#!/usr/bin/env bash

## adding `go install` binaries to path
export GOPATH=$HOME/Desktop/go

#adding bins from home dir, ~/bin
export PATH=$HOME/bin:$GOPATH/bin:$PATH

#adding bins from MacPorts
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

export PATH=~/.cabal/bin:$PATH
