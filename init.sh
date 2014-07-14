#!/bin/sh

root=$(cd $(dirname $0) && pwd)

for src in $(find $root -name '*.symlink'); do
  dest=$HOME/.$(basename ${src%.*})
  [ -e $dest ] || ln -s $src $dest
done


bundle_root=$HOME/.vim/bundle
vundle_dir=$bundle_root/vundle

mkdir -p $bundle_root

if [ ! -d $vundle_dir ]; then
  git clone https://github.com/gmarik/Vundle.vim.git $vundle_dir
fi

vim +BundleInstall +qall!
