#! /usr/bin/env bash

export TMP_DIR=$HOME/.tmp
export TOOLS_DIR=$HOME/.tools
export LOCAL_DIR=$HOME/.local
export LOCAL_BIN_DIR=$LOCAL_DIR/bin
export CONFIG_DIR=$HOME/.config

create_directories() {
  echo "Create Directories"
  mkdir $TMP_DIR
  mkdir $TOOLS_DIR
  mkdir $LOCAL_DIR
  mkdir $LOCAL_BIN_DIR
  mkdir $CONFIG_DIR
}

install_base_packages() {
  echo "Install base packages"
  sudo apt-get install -y \
    build-essential \
    bzip2 \
    curl \
    git \
    stow \
    unzip \
    xz-utils
}

install_neovim_plugins() {
  echo "Install neovim plugins"
  curl -fLo $LOCAL_DIR/share/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  $LOCAL_BIN_DIR/nvim --headless '+PlugInstall --sync' '+qall'
  $LOCAL_BIN_DIR/nvim --headless '+TSInstallSync all' '+qall'
  $LOCAL_BIN_DIR/nvim --headless '+CocInstall coc-angular coc-css coc-eslint coc-fzf-preview coc-html coc-json coc-prettier coc-tsserver -sync' '+qall'
}

install_neovim() {
  echo "Install neovim"
  sudo apt-get install -y \
    ninja-build gettext libtool libtool-bin autoconf automake cmake pkg-config doxygen
  git clone https://github.com/neovim/neovim.git
  cd neovim
  git checkout stable
  make CMAKE_BUILD_TYPE=Release
  make CMAKE_INSTALL_PREFIX=$LOCAL_DIR/nvim install
  ln -s $LOCAL_DIR/nvim/bin/nvim $LOCAL_BIN_DIR
  install_neovim_plugins
  cd -
}

install_forgit() {
  echo "Install forgit"
  git clone https://github.com/wfxr/forgit.git
}

install_fzf() {
  echo "Install fzf"
  git clone --depth 1 https://github.com/junegunn/fzf.git
  cd fzf
  ./install --xdg --no-update-rc --key-bindings --completion
  cd -
}

install_nvm() {
  echo "Install nvm"
  git clone https://github.com/nvm-sh/nvm.git
  cd nvm
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
  source "$TOOLS_DIR/nvm/nvm.sh"
  cd -
}

install_nodejs_tools() {
  echo "Install nodejs tools"
  npm i -g npm
  npm i -g tree-sitter-cli @bazel/bazelisk neovim
}

install_nodejs() {
  nvm install stable
  nvm use stable
}

install_quickjs() {
  echo "Install quickjs"
  git clone https://github.com/bellard/quickjs.git
  cd quickjs
  make DESTDIR=$LOCAL_DIR/ prefix=quickjs install
  ln -s $LOCAL_DIR/quickjs/bin/qjs $LOCAL_BIN_DIR
  ln -s $LOCAL_DIR/quickjs/bin/qjsc $LOCAL_BIN_DIR
  cd -
}

install_kitty(){
  echo "Install kitty"
  curl -sL https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin \
    launch=n
  ln -s $LOCAL_DIR/kitty.app/bin/kitty $LOCAL_BIN_DIR
}

install_pyenv() {
  echo "Install pyenv"
  export PYENV_ROOT=$TOOLS_DIR/pyenv
  sudo apt-get install -y libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev llvm \
    libncursesw5-dev tk-dev libxml2-dev libxmlsec1-dev libffi-dev \
    liblzma-dev
  curl -s https://pyenv.run | bash
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
}

install_python() {
  echo "Install python"
  pyenv install 3.9.0
  pyenv global 3.9.0
}

install_python_tools() {
  pip install pip --upgrade
  pip install pythonx
  pip install pynvim --upgrade
}

install_dots() {
  echo "Install dots"
  git clone https://github.com/mgred/dots.git
  cd dots
  ./build.sh +install
  cd -
}

install_nnn() {
  echo "Install nnn"
  local nnn_file=nnn.tar.gz
  local nnn_link=$(curl -s https://api.github.com/repos/jarun/nnn/releases/latest | grep "browser_download_url.*nnn-static-.*\.x86_64\.tar\.gz" | cut -d : -f 2,3 | tr -d \")
  curl -sL -o $nnn_file $nnn_link
  tar xvf $nnn_file
  mv nnn-static $LOCAL_BIN_DIR/nnn
}

install_bat() {
  echo "Install bat"
  local bat_file=bat.tar.gz
  local bat_link=$(curl -s https://api.github.com/repos/sharkdp/bat/releases/latest | grep "browser_download_url.*bat-.*x86_64-unknown-linux-gnu\.tar\.gz" | cut -d : -f 2,3 | tr -d \")
  curl -sL -o $bat_file $bat_link
  tar xvf $bat_file
  mv `find . -name bat` $LOCAL_BIN_DIR
}

install_delta() {
  echo "Install delta"
  local delta_file=delta.tar.gz
  local delta_link=$(curl -s https://api.github.com/repos/dandavison/delta/releases/latest | grep "browser_download_url.*delta-.*x86_64-unknown-linux-gnu\.tar\.gz" | cut -d : -f 2,3 | tr -d \")
  curl -sL -o $delta_file $delta_link
  tar xvf $delta_file
  mv `find . -name delta` $LOCAL_BIN_DIR
}

install_tools() {
  echo "Install tools"
  rm -rf ~/.bashrc

  cd $TOOLS_DIR

  install_pyenv
  install_python
  install_python_tools
  install_nvm
  install_nodejs
  install_nodejs_tools
  install_dots

  install_forgit
  install_fzf
  install_quickjs
  install_kitty
  install_neovim

  cd $TMP_DIR

  install_bat
  install_delta
  install_nnn
}

main() {
  install_base_packages
  create_directories
  install_tools
}

main
