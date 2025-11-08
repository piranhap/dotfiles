#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Daily commands
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias h='history'
alias ll='ls -lh --color=auto'
alias la='ls -lah --color=auto'

# Color on MAN
alias man='TERMINFO=~/.terminfo TERM=mostlike LESS=C PAGER=less MAN'

# LS in color
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	# MORE COLOR
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'
	alias grep='grep --color=auto'
	alias egrep='egrep --color=auto'
fi

# mistakes 
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'



PS1='[\u@\h \W]\$ '

# History options
HISTCONTROL=ignoreboth
# Append to hist file
shopt -s histappend
# His Length
HISTSIZE=100000
HISTFILESIZE=2000000

#Save and reload history after each command finishes 
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# UI 
force_color_prompt=yes
shopt -s checkwinsize

if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

# Exports
export HISTCONTROL=ignoreboth
export HISTIGNORE='&:clear:ls:cd:[bf]g:exit:[ t\]*'

# Prompt
#
PROMPT_COMMAND='PS1_CMD1=$(ip route get 1.1.1.1 | awk -F"src " '"'"'NR == 1{ split($2, a," ");print a[1]}'"'"'); PS1_CMD2=$(git branch --show-current 2>/dev/null)'; PS1='[\[\e[91m\]\u\[\e[92m\]@${PS1_CMD1}\[\e[0m\]_\[\e[95m\]@\h\[\e[0m\]]++++++++++++++++++++++++++(\[\e[91;1m\]\w\[\e[0m\])~\[\e[92;3m\]\d\[\e[0m\]~~\[\e[95;3m\]\@\[\e[0m\]*\n[\[\e[96m\]${PS1_CMD2}\[\e[0m\]]---\[\e[92;1m\]\$\[\e[0m\] '
