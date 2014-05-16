set nocompatible

set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch

set number
set title
set showcmd
set laststatus=2

set autoindent
set smartindent

set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set smarttab

syntax on

noremap : ;
noremap ; :

"------------------
" Vundle
"------------------
filetype off

if has('vim_starting')
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
endif

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree.git'

filetype plugin indent on

"------------------
" NERDTree
"------------------
noremap <C-e> <ESC>:NERDTreeToggle<CR>
