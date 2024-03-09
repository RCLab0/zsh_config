# beep
setopt no_beep
setopt nolistbeep

# unix command 
alias l="ls -CF"
alias ll="ls -la"
alias resh="exec $SHELL -l"

# asdf
. /usr/local/opt/asdf/libexec/asdf.sh

# git current branch 表示
function check-color {
  for c in {000..255}; do
    echo -n "\e[38;5;${c}m$c "; [ $(($c%16)) -eq 15 ] && echo
  done
}

# load seperated config files
for conf in "$HOME/.zsh/"*.zsh; do
  source "${conf}"
done
unset conf

# 保管を有効にする
# -U: do not override by user defined alias.
# -z: read by zsh rules.
autoload -Uz compinit && compinit