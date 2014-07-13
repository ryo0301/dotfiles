#!/bin/sh

root=$(cd $(dirname $0) && pwd)


for src in $(find $root -name '*.symlink'); do
  dest=$HOME/.$(basename ${src%.*})
  [ -e $dest ] || ln -s $src $dest
done


mkdir -p $HOME/.vim/bundle

if [ ! -d $HOME/bundle/vundle ]; then
  git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/vundle
fi

vim +BundleInstall +qall
