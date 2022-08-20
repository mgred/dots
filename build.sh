#!/usr/bin/env bash

packages="bash bat forgit git kitty nvim"

mkdir dist

for p in $packages
do
  package=dist/$p/.config/
  mkdir -p $package
  cp -r $p $package
done

mkdir dist/rc
cp .bashrc dist/rc
mkdir -p dist/nvm/.tools/nvm
cp -r nvm dist/nvm/.tools

if [ "$@" == "+install" ]; then
  stow -t $HOME -d dist -S $packages rc nvm
fi
