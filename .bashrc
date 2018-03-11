#!/bin/bash

# Aliases
alias ls='ls -Glah' # colored ls in OSX
alias jesselucas='cd $GOPATH/src/github.com/jesselucas' #cd into my gocode directory
alias xcs='cd $GOPATH/src/gitlab.fg/xcs' #cd into the xcs
alias fgwork='cd $GOPATH/src/gitlab.fg/' #cd into forest giant gitlab folder
alias fgpublic='cd $GOPATH/src/github.com/forestgiant/' #cd into forest giant gitlab folder
alias gocode='cd $GOPATH/src' #cd into gocode src
# alias code='cd $FGCODEPATH' #cd into fg code
alias gs='git status' # quick git status
alias bp='binpath'

### Added GO paths
export FGCODEPATH=$HOME/code
export GOPATH=$HOME/gocode
export PATH=$PATH:$GOPATH/bin

# gv: Used to wrap go get to add -v flag
export GOCOMMANDLOCATION=/usr/local/bin

# r directory history
export R_DIRHISTORY=30

# r global history
export R_GLOBALHISTORY=1000

# . ~/gocode/src/github.com/forestgiant/gv/go_to_gv

# r sourced from r -install 
. /Users/jesse/.r.sh

# https://github.com/jesselucas/nudge
export NUDGEPATH=$HOME/.nudge/nudge.toml