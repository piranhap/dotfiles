# This is my bashrc 

set -H
shopt -s autocd
shopt -s cdspell
shopt -s checkwinsize


# History configuration
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=10000
HISTFILESIZE=20000
export HISTTIMEFORMAT="%F %T "
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# Safety nets (force confirmation before deleting/overwriting)
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ls='ls --color=auto'
alias ll='ls -alF'   # Long list, hidden files, classify file types
alias la='ls -lah'     # All files except . and ..
alias l='ls -CF'     # Column view

# Color support for ls and grep
alias ls='ls --color=auto'
alias grep='grep --color=auto'

#Tmux on every shell 
if command -v tmux >/dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi   

# local bin
# if not there create it with:
# mkdir -p ~/.local/bin
export PATH="$HOME/.local/bin:$PATH"

# 2. Check if Starship is installed
if ! command -v starship &> /dev/null; then
    echo "Starship not found. Installing to ~/.local/bin..."
    # Download and install to ~/.local/bin without sudo
    curl -sS https://starship.rs/install.sh | sh -s -- -y -b "$HOME/.local/bin"
fi

# 3. Initialize Starship
eval "$(starship init bash)"

# git pull --rebase
