echo "Everything will be ok."

# ohmyksh needs to know where it lives, so we tell it via this env var:
OHMYKSH_DIR=${HOME}/code/github.com/qbit/ohmyksh

# Now we can load everything up!
. ${OHMYKSH_DIR}/ohmy.ksh

# All the paths we use (in order!)
set -A my_paths -- \
	~/bin \
	~/go/bin \

paths "${my_paths[@]}"
# PATH=$HOME/.local/bin:$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games

# Load our various extensions
load_extension fonts
load_extension k
# load_extension nocolor
load_extension openbsd
load_extension fzf

# Load handy completions for various things
load_completion ssh
load_completion vmd
load_completion rc
# load_completion gopass
load_completion git

# alias vi=vim

# the q prompt auto-loads the git-prompt extension
set_prompt q

PATH=$HOME/.local/bin:$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games



GOPATH=~
if [ -d ~/go ]; then
	export GOPATH=$HOME/go
	export PATH=$PATH:$GOPATH/bin
fi

if [ -d ~/.cargo ]; then
	export PATH=$PATH:$HOME/.cargo/bin
fi

alias ls='ls -glah'
alias gocode='cd $GOPATH/src/github.com/jesselucas'
alias gowork='cd $GOPATH/src/git.forestgiant.com/'
alias gocover='go test -coverprofile coverage.out && go tool cover -html=coverage.out'
alias lynx='lynx -vikeys'
alias w3m='w3m https://duckduckgo.com/'
alias gcc='egcc'

# Custom prompt: (green)username (pink)path
PS1="\e[38;5;35m\u@\h\e[m \e[38;5;204m\W\$ \e[m"

export NUDGEPATH=$HOME/.nudge/nudge.toml

export LANGUAGE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export GPG_TTY=$(tty)
export PATH HOME TERM 
export WASI_SDK_PATH="$HOME/code/github.com/WebAssembly/wasi-sdk/build/install/opt/wasi-sdk"
export RUST_SRC_PATH="$HOME/code/github.com/rust-lang/rust/library"


# pkg_add/info for snapshot
# pkg_add() { command doas pkg_add -D snap "$@"; }
# pkg_info() { command pkg_info -D snap "$@"; }

# pkg() { 
#	case "$1" in
#		add)    shift ; doas pkg_add -D snap $* ;;
#		del)    shift ; pkg_del $*              ;;
#		info)   shift ; pkg_info -D snap $*     ;;
#		search) shift ; pkg_info -D snap -Q $*  ;;
#		*) >&2 echo \? ;;
#	esac
#}
