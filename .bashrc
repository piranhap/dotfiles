###############
#   .bashrc   #
###############

# Load exports
[ -f "$HOME/.exports" ] && source "$HOME/.bash_exports"

# Load aliases
[ -f "$HOME/.aliases" ] && source "$HOME/.bash_aliases"

# Load functions
[ -f "$HOME/.functions" ] && source "$HOME/.bash_functions"

# Load prompt
[ -f "$HOME/.prompt" ] && source "$HOME/.bash_prompt"

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# zoxide
eval "$(zoxide init bash)"

# bat as man pager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# exa default ls
alias ls="exa --icons"

# System metrics on each new shell
show_sys_metrics
