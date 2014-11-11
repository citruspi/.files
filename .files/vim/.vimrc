set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'gmarik/vundle'

call vundle#end() 
filetype plugin indent on

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
