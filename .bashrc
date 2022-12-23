#!/bin/bash
set -o vi

# Set local bin
export PATH=$PATH:/usr/local/bin

# Aliases
# alias ls='ls -Glah' # colored ls in OSX
alias ls='exa -la --color=always'
alias gs='git status' # quick git status
alias gocover='go test -coverprofile cover.out && go tool cover -html=cover.out'

# GO paths
export GOPATH=$HOME/gocode
export PATH=$PATH:$GOPATH/bin

# Rust
source $HOME/.cargo/env
export RUST_SRC_PATH=$HOME/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src

# gpg
GPG_TTY=$(tty)
export GPG_TTY

#PlayDate
export PLAYDATE_SDK_PATH=$HOME/code/playdate_sdk/1.12.0
export PATH=$PATH:$PLAYDATE_SDK_PATH/bin
