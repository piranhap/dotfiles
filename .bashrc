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
# History 
HISTSIZE=100000
HISTFILESIZE=2000000
HISTCONTROL=ignoredups:erasedups
shopt -s histappend
shopt -s cmdhist

export HISTTIMEFORMAT="[%F %T] "
