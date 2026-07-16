# d3fd44

[[ $- != *i* ]] && return

alias         ff="fzf -m --preview='bat --color always --style='numbers,grid,changes' --theme=Dracula {}' --preview-label=' preview ' --border=rounded --wrap"
alias        bat="bat --color always --style='numbers,grid,changes' --theme=Dracula"
alias         ls="ls -l --color=auto -v --group-directories-first -1"
alias         pq="sudo pacman -Q --color never"
alias     pacman="sudo pacman --color always"
alias       grep="grep --color=auto"
alias        mkc="make clean"
alias         gs="git status"
alias        mkr="make run"
alias         cl="clear"
alias         ip="ip -c"
alias         mk="make"
alias         :q="exit"

export LESS_TERMCAP_so=$'\e[38;5;16;48;5;50m'
export LESS_TERMCAP_se=$'\e[30;0m'

export PATH="$HOME/.cargo/bin/:$PATH"

export LANG=en_US.UTF-8
export LC_ALL=C.UTF-8

eval "$(fzf --zsh)"

getrandhex() {
  local hex_len="${1:-64}"
  local bytes_needed hex

  case "$hex_len" in
    ''|*[!0-9]*)
      printf 'usage: %s NUM_HEX_CHARS\n' "${FUNCNAME[0]}" >&2
      return 2
      ;;
    0)
      printf '\n'
      return 0
      ;;
  esac

  bytes_needed=$(( (hex_len + 1) / 2 ))

  generate() {
    if command -v openssl >/dev/null 2>&1; then
      openssl rand -hex "$bytes_needed"
      return $?
    fi
    if [ -r /dev/urandom ] && command -v hexdump >/dev/null 2>&1; then
      dd if=/dev/urandom bs="$bytes_needed" count=1 2>/dev/null | hexdump -v -e '/1 "%02x"'
      return 0
    fi
    return 1
  }

  hex=$(generate) || { printf 'error: openssl or hexdump/dd required\n' >&2; return 1; }
  hex=$(printf '%s' "$hex" | tr -d '\n')
  printf '%s\n' "$(printf '%s' "$hex" | cut -c1-"$hex_len")"
}


echo && date && echo

# Added by Antigravity CLI installer
export PATH="/home/momen/.local/bin:$PATH"
