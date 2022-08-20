# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

source ~/.config/bash/vars.bash
source ~/.config/bash/aliases.bash
source ~/.config/bash/tools.bash
source ~/.config/bash/functions.bash

shopt -s histappend
shopt -s checkwinsize
shopt -s globstar
