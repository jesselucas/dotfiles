#!/bin/sh -

OS=`uname -s`

if [ $OS = "OpenBSD" ]; then
	echo "Turn off Strict Bourne shell mode."
	set +o sh
fi

# Check to see if we are in the dotfiles git directory
GIT_ORIGIN=`git config --get remote.origin.url`
EXPECTED_ORIGIN="git@github.com:jesselucas/dotfiles.git "
if [ "$GITORIGIN" != "$EXPECTEDORIGIN" ]; then
	echo "Script must be ran from within jesselucas/dotfiles git repo"
	echo "Expected: $EXPECTED_ORIGIN" 
	echo "Received: $GIT_ORIGIN"
	exit 1
fi

# Set dotfiles directory to pwd
DOTFILES=`pwd`

# Set src directories
src[0]=$DOTFILES
src[1]=$DOTFILES/amp
src[2]=$DOTFILES/amp/themes
src[3]=$DOTFILES/amp/syntaxes
src[4]=$DOTFILES/alacritty
src[5]=$DOTFILES/X11
src[6]=$DOTFILES/X11/xenodm
src[7]=$DOTFILES/apm
src[8]=$DOTFILES/beets
src[9]=$DOTFILES/kitty

# Create a map like structure of destinations and files
# index is used as key to associate both dest and files
dest[0]=$HOME
dest[1]="$HOME/Library/Application Support/amp"
dest[2]="$HOME/Library/Application Support/amp/themes"
dest[3]="$HOME/Library/Application Support/amp/syntaxes"
dest[4]="$HOME/.config/alacritty"
dest[5]="/etc/X11"
dest[6]="/etc/X11/xenodm"
dest[7]="/etc/apm"
dest[8]="$HOME/.config/beets"
dest[9]="$HOME/.config/kitty"

# Set files as values
files0[0]=".tmux.conf" 
files0[1]=".vimrc" 
files0[2]=".git-prompt-colors.sh"
files0[3]=".abcde.conf"
files4[0]="alacritty.yml"
files8[0]="config.yaml"
files9[0]="kitty.conf"

# OpenBSD specific files
if [ $OS == "OpenBSD" ]; then
	echo "OpenBSD"
	files0[4]=".Xdefaults"	
	files0[5]=".xinitrc"	
	files0[6]=".xsession"	
	files0[7]=".cwmrc"
	files0[8]=".profile"
	files0[9]=".kshrc"
	files0[10]=".spectrwm.conf"
	files0[11]="wifiLocation.sh"

	# X11
	force5[0]="xorg.conf"

	# xenodm
	force6[0]="Xsetup_0"
	force6[1]="Xresources"

	# apm
	force7[0]="suspend"
else
	files1[0]="config.yml"
	files2[0]="Tomorrow-Night-Eighties.tmTheme"
	files3[0]="Shell-Unix-Generic.sublime-syntax"
	files0[4]=".bash_profile" 
	files0[5]=".bashrc" 
	files0[6]="zephyr-alias.sh" 
fi

# Set the number of iterations using i as the key
for i in 0 1 2 3 4 5 6 7 8 9; do
	d=${dest[$i]}
	s=${src[$i]} filesArray=files$i
	forceArray=force$i
  	
	# Loop through all files in each files array
	filesArray=$(eval echo \${files$i[*]})
	for f in $filesArray; do
		srcPath=$s/$f
		destPath=$d/$f

		# Test if destPath doesn't exist and srcPath exist
		if [ ! -e "${destPath}" ] && [ -e "${srcPath}" ]; then
			ln -s "${srcPath}" "${destPath}"
			echo "Symlinking: $srcPath to $destPath"
		else
			echo "Skipping: $destPath"
		fi
	done

	# Loop through all files in each force array
	forceArray=$(eval echo \${force$i[*]})
	for f in $forceArray; do
		srcPath=$s/$f
		destPath=$d/$f
		
		# copy srcPath to destPath
		echo "Force symlink $srcPath to $destPath"
		if [ $OS == "OpenBSD" ]; then
			doas ln -sf "${srcPath}" "${destPath}"
		else
			sudo ln -sf "${srcPath}" "${destPath}"
		fi
	done
done
