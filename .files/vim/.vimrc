set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'altercation/vim-colors-solarized'

call vundle#end() 
filetype plugin indent on
syntax on

set background=dark
colorscheme solarized

let mapleader=","
nnoremap ; :			" Remap ':' to ';'
set showcmd

set nobackup
set nowritebackup
set noswapfile

set ruler			" Report the cursor position on the bottom right
set cursorline			" Highlight the line the cursor is currently on

set textwidth=80		" Set the text width to 80 characters
set colorcolumn=+1		" Color the column after 80 characters

set number			" Enable line numbers on the left
set numberwidth=5		" Add a buffer between the number and the edge

set tabstop=4			" Tabs are equal to 4 columns
set expandtab			" Expand the tab character into spaces
set shiftwidth=4		" Reindent operations should use 4 columns
set shiftround			" 3 -> 5; !(3 -> 7)

