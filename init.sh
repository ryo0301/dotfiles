#!/bin/bash -x

root=$(cd $(dirname $0) && pwd)

case "$1" in
  link)
    for src in $(find $root -name '*.symlink'); do
      dest=$HOME/.${src#$root/}
      dest=${dest%.*}
      if [ ! -e $dest ];then
        mkdir -p $(dirname $dest)
        ln -s $src $dest
      fi
    done
    ;;

  brew)
    brew install \
      awscli \
      bash-completion \
      bat \
      cfn-lint \
      direnv \
      exa \
      ffmpeg \
      fish \
      gh \
      ghq \
      gibo \
      git \
      git-delta \
      git-secrets \
      glow \
      go \
      jq \
      peco \
      pyenv \
      rbenv \
      tree \
      vim \
      volta
    brew tap homebrew/cask-fonts
    brew install \
      font-hackgen \
      font-ricty-diminished
    ;;

  vim)
    brew install vim
    bundle_root=$HOME/.vim/bundle
    neobundle_dir=$bundle_root/neobundle.vim
    mkdir -p $bundle_root
    [ ! -d $neobundle_dir ] && git clone https://github.com/Shougo/neobundle.vim $neobundle_dir
    vim +NeoBundleInstall +qall!
    ;;

  fisher)
    curl -sL https://git.io/fisher | source
    fisher install jorgebucaran/fisher
    fisher install oh-my-fish/plugin-peco
    fisher install 0rax/fish-bd
    fisher install jethrokuan/z
    ;;
esac
