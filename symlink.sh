#!/bin/sh -
#
#

# Turn off Strict Bourne shell mode.
set +o sh

OS=`uname -s`

# Check to see if we are in the dotfiles git directory
GITORIGIN=`git config --get remote.origin.url`
if [ "$GITORIGIN" != "git@github.com:jesselucas/dotfiles.git" ]; then
	echo "Script must be ran from within jesselucas/dotfiles git repo"
	exit 1
fi

# Set dotfiles directory to pwd
DOTFILES=`pwd`

# Create src directories
src[0]=$DOTFILES
src[1]=$DOTFILES/amp
src[2]=$DOTFILES/amp/themes
src[3]=$DOTFILES/amp/syntaxes
src[4]=$DOTFILES/alacritty

# Create a map like structure of destinations and files
# index is used as key to associate both dest and files
dest[0]=$HOME
dest[1]="$HOME/Library/Application Support/amp"
dest[2]="$HOME/Library/Application Support/amp/themes"
dest[3]="$HOME/Library/Application Support/amp/syntaxes"
dest[4]="$HOME/.config/alacritty"

# Set files as values
files0[0]=".tmux.conf" 
files0[1]=".vimrc" 
files0[2]=".git-prompt-colors.sh"

# OpenBSD specific $HOME files
if [ $OS == "OpenBSD" ]; then
	echo "OpenBSD"
	files0[3]=".Xdefaults"	
	files0[4]=".xinitrc"	
	files0[5]=".cwmrc"
	files0[6]=".profile"
	files0[7]=".kshrc"
	files0[9]="wifiLocation.sh"
else
	files0[3]=".bashrc" 
fi

files1[0]="config.yml"
files2[0]="Tomorrow-Night-Eighties.tmTheme"
files3[0]="Shell-Unix-Generic.sublime-syntax"
files4[0]="alacritty.yml"

# Loop over each destination and use i as a key
# and the value is files$i array
i=0
for _ in "${dest[*]}"; do
	d=${dest[$i]}
	s=${src[$i]}
	vArray=files$i
  	
	# Loop through all files in each values array
	vArray=$(eval echo \${files$i[*]})
	for f in $vArray; do
		srcPath=$s/$f
		destPath=$d/$f

		# Test if destPath doesn't exist and srchPath exist
		if [ ! -e "${destPath}" ] && [ -e "${srcPath}" ]; then
			ln -s "${srcPath}" "${destPath}"
			echo "Symlinking: $srcPath to $destPath"
		else
			echo "Skipping: $destPath"
		fi
	done
	# Increment i.
	i=i+1	
done
