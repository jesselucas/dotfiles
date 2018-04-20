#!/bin/bash
# Check to see if we are in the dotfiles git directory
GITORIGIN=$( git config --get remote.origin.url )
if [ "$GITORIGIN" != "git@github.com:jesselucas/dotfiles.git" ]; then
  echo "Script must be ran from within jesselucas/dotfiles git repo"
  exit 1
fi

# Set dotfiles directory to pwd
DOTFILES=$( pwd )

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
files0=( .bashrc .tmux.conf .vimrc .git-prompt-colors.sh )
files1=( config.yml )
files2=( Tomorrow-Night-Eighties.tmTheme )
files3=( Shell-Unix-Generic.sublime-syntax )
files4=( alacritty.yml )

# Loop over each destination and use i as a key
# and the value is files$i array
for i in "${!dest[@]}"; do
  d=${dest[$i]}
  s=${src[$i]}
  vArray=files$i[@]

  # Loop through all files in each values array
  for f in "${!vArray}"; do
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
done
