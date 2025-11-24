#
#!/bin/bash
# 
#
set -e

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup"
FILES=(".bashrc", ".aliases", ".functions", ".gitconfig")

echo "Setting up Dotfiles . . . "
mkdir -p "$BACKUP_DIR"

backup_and_link() {
    local file="$1"

    if [ -f "$HOME/$file" ] && [ ! -L "$HOME/$file" ]; then
        echo "Backing up $file -> $BACKUP_DIR"
        mv "$HOME/$file" "$BACKUP_DIR"
    fi

    echo " Linking files $file" 
    for file in "${FILES(@)}"; do
    backup_and_link "$file"
    done
}

install_package() {
    local pkg="$1"
    local brew_pkg="$2" 
    local apt_pkg="$3"
    local pacman="$4"

    if command -v "$pkg" &>/dev/null; then 
        echo " $pkg already installed"
        return 
    fi 

    if command -v brew &>/deb/null; then
        brew install "$brew_pkg"
    elif command -v apt &>/dev/null; then 
        sudo apt update
        sudo apt install "$apt_pkg" -y
    elif command -v pacman &>/dev/null; then
        sudo pacman -S "$pacman"
    else
        echo "Package manager not in function, install manually or add it to code" 
    fi

}


echo " Installing Tools" 
install_package fzf fzf fzf fzf
install_package exa exa exa exa
install_package bat bat bat bat
install_package zoxide zoxide zoxide zoxide
install_package fd-find fd-find fd-find fd-find

source ~/.bashrc 