#!/bin/bash -x

root=$(cd $(dirname $0) && pwd)

for src in $(find $root -name '*.symlink'); do
  dest=$HOME/.${src#$root/}
  dest=${dest%.*}
  if [ ! -e $dest ];then
    mkdir -p $(dirname $dest)
    ln -s $src $dest
  fi
done

if [ "$1" = "vim" ];then
  bundle_root=$HOME/.vim/bundle
  neobundle_dir=$bundle_root/neobundle.vim
  mkdir -p $bundle_root
  [ ! -d $neobundle_dir ] && git clone https://github.com/Shougo/neobundle.vim $neobundle_dir
  vim +NeoBundleInstall +qall!
fi

if [ "$1" = "brew" ];then
  brew install \
    bash-completion \
    bat \
    direnv \
    exa \
    fish \
    gh \
    ghq \
    gibo \
    git \
    git-delta \
    git-secrets \
    glow \
    jq \
    nodenv \
    peco \
    pyenv \
    rbenv \
    tree \
  brew install --HEAD goenv
  brew tap cask-fonts
  brew install --cask \
    font-hackgen \
    font-ricty-diminished \
fi
