#!/bin/bash

DOT="$HOME/dotfiles"

echo "Installing dotfiles…"

ln -sf "$DOT/.bashrc" "$HOME/.bashrc"
ln -sf "$DOT/.aliases" "$HOME/.aliases"
ln -sf "$DOT/.functions" "$HOME/.functions"
ln -sf "$DOT/.exports" "$HOME/.exports"
ln -sf "$DOT/.prompt" "$HOME/.prompt"

echo "Done!"
echo "Reload your terminal or run: source ~/.bashrc"
