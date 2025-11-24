#!/bin/bash

DOT="$HOME/dotfiles"

echo "Installing dotfiles…"

ln -sf "$DOT/.bashrc" "$HOME/.bashrc"
ln -sf "$DOT/.aliases" "$HOME/.bash_aliases"
ln -sf "$DOT/.functions" "$HOME/.bash_functions"
ln -sf "$DOT/.exports" "$HOME/.bash_exports"
ln -sf "$DOT/.prompt" "$HOME/.bash_prompt"

echo "Done!"
echo "Reload your terminal or run: source ~/.bashrc"
