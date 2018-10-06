#!/bin/bash

set -o vi

# Set local bin
export PATH=$PATH:/usr/local/bin

# https://github.com/magicmonty/bash-git-prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

# Aliases
# alias ls='ls -Glah' # colored ls in OSX
alias ls='exa -la --color=always'
alias gojesselucas='cd $GOPATH/src/github.com/jesselucas' #cd into my gocode directory
alias jesselucas='cd $HOME/code/github.com/jesselucas'
alias fgwork='cd $GOPATH/src/gitlab.fg/' #cd into forest giant gitlab folder
alias fgpublic='cd $GOPATH/src/github.com/forestgiant/' #cd into forest giant gitlab folder
alias gocode='cd $GOPATH/src' #cd into gocode src
alias gs='git status' # quick git status
alias alacritty='open -a /Applications/Alacritty.app/ -n'


# GO paths
export GOPATH=$HOME/gocode
export PATH=$PATH:$GOPATH/bin

# Rust
source $HOME/.cargo/env
export RUST_SRC_PATH=/Users/jesse/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src

# r directory history
export R_DIRHISTORY=100

# r global history
export R_GLOBALHISTORY=1000

# . ~/gocode/src/github.com/forestgiant/gv/go_to_gv

# r sourced from r -install
. /Users/jesse/.r.sh

# https://github.com/jesselucas/nudge
export NUDGEPATH=$HOME/.nudge/nudge.toml

# gpg
GPG_TTY=$(tty)
export GPG_TTY

# alacritty
source $HOME/code/github.com/jwilm/alacritty/alacritty-completions.bash
