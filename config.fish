# global export
set -gx EDITOR vim
set -gx PAGER less
set -gx PATH "$HOME/bin" $PATH

# alias
function ll
  ls -lGF $argv
end
function tree
  command tree -aCF --dirsfirst --noreport $argv
end

# less
set -gx LESS "-iMR"
set -gx LESS_TERMCAP_mb \e'[01;35m'      # Begins blinking.
set -gx LESS_TERMCAP_md \e'[01;35m'      # Begins bold.
set -gx LESS_TERMCAP_me \e'[0m'          # Ends mode.
set -gx LESS_TERMCAP_se \e'[0m'          # Ends standout-mode.
set -gx LESS_TERMCAP_so \e'[00;47;30m'   # Begins standout-mode.
set -gx LESS_TERMCAP_ue \e'[0m'          # Ends underline.
set -gx LESS_TERMCAP_us \e'[01;34m'      # Begins underline.

# git
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'auto'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

#set __fish_git_prompt_char_dirtystate '*'
#set __fish_git_prompt_char_stagedstate '+'
#set __fish_git_prompt_char_invalidstate '#'
#set __fish_git_prompt_char_stashstate '$'
#set __fish_git_prompt_char_untrackedfiles '%'
#set __fish_git_prompt_char_upstream_equal '='
#set __fish_git_prompt_char_upstream_behind '<'
#set __fish_git_prompt_char_upstream_ahead '>'
#set __fish_git_prompt_char_upstream_diverged '<>'

# fish plugins
## fish-bd
set -gx BD_OPT "insensitive"

## plugin-peco
function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

# homebrew
set -gx HOMEBREW_GITHUB_API_TOKEN ""

# nodebrew
set -gx PATH "$HOME/.nodebrew/current/bin" $PATH
set -gx NODE_PATH "$HOME/.nodebrew/current/lib/node_modules"

# direnv
eval (direnv hook fish)

# rbenv
status --is-interactive; and source (rbenv init -|psub)

# pyenv
pyenv init - | source

# Go
set -gx GOPATH "$HOME/work/go"
set -gx PATH $PATH "$GOPATH/bin"

# Java
set -gx JAVA_HOME (/usr/libexec/java_home -v 11)

# Rust
source "$HOME/.cargo/env"

# AWS
complete -c aws -f -a '(begin; set -lx COMP_SHELL fish; set -lx COMP_LINE (commandline); aws_completer; end)'
