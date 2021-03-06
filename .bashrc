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
alias gocode='cd $GOPATH/src' #cd into gocode src
alias gs='git status' # quick git status
alias alacritty='open -a /Applications/Alacritty.app/ -n'
alias gocover='go test -coverprofile cover.out && go tool cover -html=cover.out'

# GO paths
export GOPATH=$HOME/gocode
export PATH=$PATH:$GOPATH/bin

# Rust
source $HOME/.cargo/env
export RUST_SRC_PATH=$HOME/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src

# r directory history
export R_DIRHISTORY=100

# r global history
export R_GLOBALHISTORY=1000

# r sourced from r -install
. $HOME/.r.sh

# https://github.com/jesselucas/nudge
export NUDGEPATH=$HOME/.nudge/nudge.toml

# gpg
GPG_TTY=$(tty)
export GPG_TTY

# alacritty
source $HOME/code/github.com/jwilm/alacritty/extra/completions/alacritty.bash

# Nordic SDK
export PATH=/usr/local/nrfjprog:$PATH

# Zephyr
source $HOME/zephyr-alias.sh
export ZEPHYR_TOOLCHAIN_VARIANT=gnuarmemb
export GNUARMEMB_TOOLCHAIN_PATH=/usr/local

# Flutter
export PATH="$PATH:$HOME/code/github.com/flutter/flutter/bin"
