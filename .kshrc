echo "Everything will be ok."


PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games

#set -A paths ~/bin 	\
#	/bin		\
#	~/sbin		\
#	/usr/bin	\
#	/usr/sbin	\
#	/usr/X11R6/bin	\
#	/usr/local/bin	\
#	/usr/local/sbin	\
#	/usr/games	\
#	~/.cargo/bin

#for d in "${paths[@]}"; do
#	[[ -d "$d" ]] && PATH="${PATH}:$d"
#done

GOPATH=~
if [ -d ~/go ]; then
	export GOPATH=$HOME/go
	export PATH=$PATH:$GOPATH/bin
fi

alias ls='ls -glah'
alias gocode='cd $GOPATH/src/github.com/jesselucas'
alias gocover='go test -coverprofile coverage.out && go tool cover -html=coverage.out'

export NUDGEPATH=$HOME/.nudge/nudge.toml
export LC_CTYPE='en_US.UTF-8'
export GPG_TTY=$(tty)
export PATH HOME TERM 

