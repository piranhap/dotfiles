#!/bin/bash

# backup old files
mkdir -p ~/backup/config_files
cp ~/.bashrc ~/backup/config_files/bashrc.bak
cp ~/.profile ~/backup/config_files/profile.bak
rm -rf ~/.vimrc ~/.gitconfig ~/.inputrc ~/.nanorc
rm -rf ~/.config/starship
rm -rf ~/.bashrc ~/.profile



# install packages needed for the script 
PACKAGES = "vim nano"

if [ -f /etc/debian_version ]; then
    sudo apt-get update
    sudo apt-get install $PACKAGES -y
elif [ -f /etc/arch-release ]; then
    sudo pacman -Syu    
    sudo pacman -S $PACKAGES --noconfirm
else 
    echo "Your distro: $(cat /etc/*-release) is not supported"
fi

# starship
if ! command -v starship &> /dev/null; then
    echo "Starship not found, installing..."
    curl -sS https://starship.rs/install.sh | sh -s -- -y
else
    echo "Starship already installed"
fi

# symlinks
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.nanorc ~/.nanorc
ln -s ~/dotfiles/.inputrc ~/.inputrc

# starship config
rm -rf ~/.config/starship/starship.toml
mkdir -p ~/.config/starship/
ln -s ~/dotfiles/starship.toml ~/.config/starship/starship.toml

# 
source ~/.bashrc