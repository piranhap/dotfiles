###############
#   .bashrc   #
###############

# Load exports
[ -f "$HOME/.exports" ] && source "$HOME/.exports"

# Load aliases
[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"

# Load functions
[ -f "$HOME/.functions" ] && source "$HOME/.functions"

# Load prompt
[ -f "$HOME/.prompt" ] && source "$HOME/.prompt"

# Load history
[ -f "$HOME/.history" ] && source "$HOME/.history"

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# zoxide
eval "$(zoxide init bash)"

# bat as man pager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# exa default ls
alias ls="exa --icons"
