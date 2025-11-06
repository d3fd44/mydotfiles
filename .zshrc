# Created by newuser for 5.9

[[ $- != *i* ]] && return

alias ff="fzf -m --preview='bat --color always --style='numbers,grid,changes' --theme=Dracula {}' --preview-label=' preview ' --border=rounded --wrap"
alias tree="if [[ -e './mu/tree' ]];then ./mu/tree | bat; else tree -a -C --dirsfirst -I \".git\" | bat; fi"
alias bat="bat --color always --style='numbers,grid,changes' --theme=Dracula"
alias ls="ls --color=auto -v --group-directories-first -1"
alias getrand256="cat /dev/urandom | head -c 256 | xxd -p | awk '{printf \"%s\", \$0} END {print \"\"}'"
alias v="if [[ -e './mu/v' ]];then ./mu/v; else nvim; fi"
alias pacman="sudo pacman --color always"
alias pq="sudo pacman -Q --color never"
alias glog="git log --oneline --graph"
alias wget-here="wget -q -O -"
alias grep="grep --color=auto"
alias docker="sudo docker"
alias mkc="make clean"
alias gs="git status"
alias mkr="make run"
alias cl="clear"
alias ip="ip -c"
alias mk="make"
alias :q="exit"

export LESS_TERMCAP_so=$'\e[38;5;16;48;5;50m'
export LESS_TERMCAP_se=$'\e[30;0m'

export PATH="$HOME/.cargo/bin/:$PATH"

export LANG=en_US.UTF-8
export LC_ALL=C.UTF-8

eval "$(fzf --zsh)"

echo "" # && fastfetch
date && echo ""
