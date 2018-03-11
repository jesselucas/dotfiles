#!/bin/bash

# Set local bin
export PATH=$PATH:/usr/local/bin

# https://github.com/magicmonty/bash-git-prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

# Aliases
# alias ls='ls -Glah' # colored ls in OSX
alias ls='exa -la'
alias jesselucas='cd $GOPATH/src/github.com/jesselucas' #cd into my gocode directory
alias fgwork='cd $GOPATH/src/gitlab.fg/' #cd into forest giant gitlab folder
alias fgpublic='cd $GOPATH/src/github.com/forestgiant/' #cd into forest giant gitlab folder
alias gocode='cd $GOPATH/src' #cd into gocode src
alias gs='git status' # quick git status

# GO paths
export GOPATH=$HOME/gocode
export PATH=$PATH:$GOPATH/bin

# Rust
source $HOME/.cargo/env

# r directory history
export R_DIRHISTORY=100

# r global history
export R_GLOBALHISTORY=1000

# . ~/gocode/src/github.com/forestgiant/gv/go_to_gv

# r sourced from r -install 
. /Users/jesse/.r.sh

# gpg
GPG_TTY=$(tty)
export GPG_TTY

# alacritty
source /Users/jesse/code/github.com/jwilm/alacritty/alacritty-completions.bash
