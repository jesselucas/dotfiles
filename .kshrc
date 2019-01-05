echo "Everything will be ok."


PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games

if [ -d ~/.cargo ]; then
	export PATH=$PATH:$HOME/.cargo/bin
fi


GOPATH=~
if [ -d ~/go ]; then
	export GOPATH=$HOME/go
	export PATH=$PATH:$GOPATH/bin
fi

alias ls='ls -glah'
alias gocode='cd $GOPATH/src/github.com/jesselucas'
alias gowork='cd $GOPATH/src/git.forestgiant.com/'
alias gocover='go test -coverprofile coverage.out && go tool cover -html=coverage.out'
alias lynx='lynx -vikeys'
alias w3m='w3m https://duckduckgo.com/'

# Custom prompt: (green)username (pink)path
PS1="\e[38;5;35m\u@\h\e[m \e[38;5;204m\W\$ \e[m"

export NUDGEPATH=$HOME/.nudge/nudge.toml
export LC_CTYPE='en_US.UTF-8'
export GPG_TTY=$(tty)
export PATH HOME TERM 
