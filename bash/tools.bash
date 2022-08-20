export TOOLS_DIR="$HOME/.tools"

# Forgit

if [ -f $TOOLS_DIR/forgit/forgit.plugin.sh ]; then
  source ~/.config/forgit/config
  source $TOOLS_DIR/forgit/forgit.plugin.sh
fi

# FZF

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.bash ] && \
  source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.bash

# NVM

export NVM_DIR="$TOOLS_DIR/nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# pyenv

export PYENV_ROOT=$TOOLS_DIR/pyenv
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init --path)"
eval "$(pyenv init -)"
