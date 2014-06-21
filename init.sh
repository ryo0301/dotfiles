#!/bin/sh

root=$(cd $(dirname $0) && pwd)

for src in $(find $root -name '*.symlink'); do
  dest=$HOME/.$(basename ${src%.*})
  ln -s $src $dest
done
