# 保管を有効にする
# -U: do not override by user defined alias.
# -z: read by zsh rules.
autoload -Uz compinit && compinit

# beep
setopt no_beep
setopt nolistbeep

# unix command 
alias l="ls -CF"
alias ll="ls -la"
alias resh="exec $SHELL -l"

# asdf
. /usr/local/opt/asdf/libexec/asdf.sh

# load seperated config files
for conf in "$HOME/.zsh/"*.zsh; do
  source "${conf}"
done
unset conf