#!/bin/bash
############################
# make-links.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles/bash
############################

########## Variables

dir=~/dotfiles # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc config vimrc zshrc gitignore_global tmux.conf gitconfig npmrc iterm2_shell_integration.zsh"    # list of files/folders to symlink in homedir

#karabiner
karabiner_local=karabiner.xml
karabiner_location=~/Library/Application\ Support/Karabiner/private.xml

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file $olddir
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

#do the same for karabiner
echo "Moving karabiner to $olddir"
mv "$karabiner_location" $olddir
echo "Creating symlink to $karabiner_local in $karabiner_location"
ln -s $dir/$karabiner_local "$karabiner_location"

