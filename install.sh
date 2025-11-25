#!/bin/bash

DOT="$HOME/dotfiles"

echo "Installing dotfiles…"

ln -sf "$DOT/.bashrc" "$HOME/.bashrc"
ln -sf "$DOT/.aliases" "$HOME/.aliases"
ln -sf "$DOT/.functions" "$HOME/.functions"
ln -sf "$DOT/.exports" "$HOME/.exports"
ln -sf "$DOT/.prompt" "$HOME/.prompt"
ln -sf "$DOT/.history" "$HOME/.history"

# Install ble.sh for syntax highlighting
git clone --recursive https://github.com/akinomyoga/ble.sh.git "$HOME/ble.sh"
make -C "$HOME/ble.sh"

echo "Done!"
echo "Reload your terminal or run: source ~/.bashrc"
