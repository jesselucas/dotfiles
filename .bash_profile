#!/bin/bash

# Path ------------------------------------------------------------
if [ -d ~/bin ]; then
	export PATH=:~/bin:$PATH  # add your bin folder to the path, if you have it.  It's a good place to add all your scripts
fi

# Load in .bashrc -------------------------------------------------
source ~/.bashrc

# Hello Messsage --------------------------------------------------
echo -e "Everything will be ok."
export PATH="/usr/local/sbin:$PATH"
