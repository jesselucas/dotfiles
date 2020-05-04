#!/bin/bash

# Path ------------------------------------------------------------
if [ -d ~/bin ]; then
	export PATH=:~/bin:$PATH  # add your bin folder to the path, if you have it.  It's a good place to add all your scripts
fi

# bash-git-prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi


# Load in .bashrc -------------------------------------------------
source ~/.bashrc

# Hello Messsage --------------------------------------------------
echo -e "Everything will be ok."
export PATH="/usr/local/sbin:$PATH"
