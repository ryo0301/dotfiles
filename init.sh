#!/bin/sh

root=$(cd $(dirname $0) && pwd)

for src in $(find $root -name '*.symlink'); do
  dest=$HOME/.${src#$root/}
  dest=${dest%.*}
  [ -e $dest ] || ln -s $src $dest
done


#bundle_root=$HOME/.vim/bundle
#neobundle_dir=$bundle_root/neobundle.vim
#mkdir -p $bundle_root
#
#[ ! -d $neobundle_dir ] && git clone https://github.com/Shougo/neobundle.vim $neobundle_dir
#
#vim +NeoBundleInstall +qall!
