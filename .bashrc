#############################################
# ~/.bashrc — Hybrid Prompt + System Stats
# Features: fzf, bat, exa, zoxide, fd, syntax highlighting, etc
# Piranha
#############################################

#---------------------------------------------------------
# Exit if not interactive
#---------------------------------------------------------
case $- in
    *i*) ;;
      *) return;;
esac

#############################################
# PACKAGE INTEGRATIONS
#############################################

#---------------------------------------------------------
# fzf (fuzzy finder)
#---------------------------------------------------------
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#---------------------------------------------------------
# exa (modern ls)
#---------------------------------------------------------
if command -v exa &>/dev/null; then
    alias ls='exa --icons'
    alias ll='exa -lh --icons'
    alias la='exa -lha --icons'
    alias lt='exa --tree --icons'
fi

#---------------------------------------------------------
# bat (modern cat)
#---------------------------------------------------------
if command -v bat &>/dev/null; then
    alias cat='bat'
fi

#---------------------------------------------------------
# zoxide (smart directory jumping)
#---------------------------------------------------------
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init bash)"
fi

#---------------------------------------------------------
# fd (better find)
#---------------------------------------------------------
if command -v fd &>/dev/null; then
    alias findf='fd --type f'
    alias findd='fd --type d'
fi

#############################################
# SAFETY & QUALITY OF LIFE
#############################################

#---------------------------------------------------------
# Safety aliases
#---------------------------------------------------------
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

#---------------------------------------------------------
# grep colors
#---------------------------------------------------------
alias grep='grep --color=auto'

#---------------------------------------------------------
# Colorized man pages
#---------------------------------------------------------
export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;32m'

#############################################
# HISTORY CONFIGURATION
#############################################

HISTSIZE=100000
HISTFILESIZE=2000000
HISTCONTROL=ignoredups:erasedups
shopt -s histappend
shopt -s cmdhist
export HISTTIMEFORMAT="[%F %T] "

#############################################
# SYSTEM INFO FUNCTIONS
#############################################

# CPU usage (%)
__cpu_usage() {
    local IDLE TOTAL PREV_IDLE PREV_TOTAL DIFF_IDLE DIFF_TOTAL
    read -r cpu a b c idle rest < /proc/stat
    PREV_IDLE=$idle
    PREV_TOTAL=$((a+b+c+idle))
    sleep 0.05
    read -r cpu a b c idle rest < /proc/stat
    IDLE=$idle
    TOTAL=$((a+b+c+idle))
    DIFF_IDLE=$((IDLE - PREV_IDLE))
    DIFF_TOTAL=$((TOTAL - PREV_TOTAL))
    printf "%d" $((((1000 * (DIFF_TOTAL - DIFF_IDLE) / DIFF_TOTAL) + 5) / 10))
}

# Memory usage (%)
__mem_usage() {
    local total used
    total=$(grep MemTotal /proc/meminfo | awk '{print $2}')
    used=$(grep MemAvailable /proc/meminfo | awk '{print $2}')
    printf "%d" $((100 - (used * 100 / total)))
}

# Disk usage (%)
__disk_usage() {
    df / | awk 'NR==2 {print $5}' | tr -d '%'
}

# Network upload/download (KB/s)
__net_speed() {
    old_rx=$(cat /sys/class/net/*/statistics/rx_bytes | awk '{s+=$1} END {print s}')
    old_tx=$(cat /sys/class/net/*/statistics/tx_bytes | awk '{s+=$1} END {print s}')
    sleep 0.05
    new_rx=$(cat /sys/class/net/*/statistics/rx_bytes | awk '{s+=$1} END {print s}')
    new_tx=$(cat /sys/class/net/*/statistics/tx_bytes | awk '{s+=$1} END {print s}')
    rx=$(( (new_rx - old_rx) / 1024 ))
    tx=$(( (new_tx - old_tx) / 1024 ))
    echo "${tx}KB/s ↑  ${rx}KB/s ↓"
}

#############################################
# PROMPT UTILITY FUNCTIONS
#############################################

__prompt_ip() {
    ip route get 1.1.1.1 2>/dev/null | awk -F 'src ' 'NR==1{print $2}' | awk '{print $1}'
}

__prompt_git() {
    local branch
    branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    [[ -n $branch ]] && printf " (git:%s)" "$branch"
}

__prompt_bar() {
    printf "%*s" "$(tput cols)" "" | tr ' ' '─'
}

#############################################
# SYSTEM STATUS LINE
#############################################

__system_status() {
    local cpu mem disk net
    cpu=$( __cpu_usage )
    mem=$( __mem_usage )
    disk=$( __disk_usage )
    net=$( __net_speed )

    echo -e "CPU:${cpu}%  MEM:${mem}%  DISK:${disk}%  NET: ${net}"
}

#############################################
# HYBRID PROMPT
#############################################

__build_prompt() {
    local ip="$(__prompt_ip)"
    local git="$(__prompt_git)"
    local bar="$(__prompt_bar)"

    # Colors
    local green="\[\e[92m\]"
    local cyan="\[\e[96m\]"
    local magenta="\[\e[95m\]"
    local yellow="\[\e[93m\]"
    local reset="\[\e[0m\]"

    # Show system stats above everything
    echo -ne "${yellow}$(__system_status)${reset}\n"

    echo -ne "${green}┌(${USER}@${HOSTNAME})"
    echo -ne "${cyan}──(${ip})"
    echo -ne "${magenta}──($(date +"%a %b %d %I:%M %p"))"
    echo -ne "${yellow}${git}${reset}\n"

    echo -ne "${magenta}${bar}${reset}\n"

    echo -ne "${green}└─[${cyan}\w${green}] \$ ${reset}"
}

PROMPT_COMMAND="__build_prompt"

#############################################
# END OF FILE
#############################################
