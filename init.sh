#!/bin/bash -x

root=$(cd $(dirname $0) && pwd)

case "$1" in
  def)
    defaults write -g KeyRepeat -int 2
    defaults write -g InitialKeyRepeat -int 15
    defaults write -g com.apple.trackpad.scaling -int 3
    defaults write -g AppleShowAllExtensions -bool true
    defaults write com.apple.menuextra.clock DateFormat -string 'M\\U6708d\\U65e5(EEE)  H:mm:ss'
    defaults write com.apple.menuextra.clock ShowSeconds -bool true
    defaults write com.apple.AppleMultitouchTrackpad Dragging -bool true
    defaults write com.apple.AppleMultitouchTrackpad DragLock -bool true
    defaults write com.apple.finder AppleShowAllFiles -bool true
    defaults write com.apple.dock wvous-br-corner -int 13
    defaults write com.apple.dock wvous-br-modifier -int 0
    killall Finder
    killall Dock
    ;;

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
    sudo softwareupdate --install-rosetta
    /opt/homebrew/bin/brew bundle install --file "$root/Brewfile"
    ;;

  vim)
    /opt/homebrew/bin/brew install vim
    bundle_root=$HOME/.vim/bundle
    neobundle_dir=$bundle_root/neobundle.vim
    mkdir -p $bundle_root
    [ ! -d $neobundle_dir ] && git clone https://github.com/Shougo/neobundle.vim $neobundle_dir
    vim +NeoBundleInstall +qall!
    ;;

  fisher)
    /opt/homebrew/bin/fish -l -c "$(curl -sL https://git.io/fisher | source)"
    fisher install jorgebucaran/fisher
    fisher install oh-my-fish/plugin-peco
    fisher install 0rax/fish-bd
    fisher install jethrokuan/z
    ;;
  *)
    set +x
    clear
    echo def
    echo link
    echo brew
    echo vim
    echo fisher
    ;;
esac
