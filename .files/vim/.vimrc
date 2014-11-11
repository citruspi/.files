set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'gmarik/vundle'

call vundle#end() 
filetype plugin indent on

let mapleader=","
nnoremap ; :			" Remap ':' to ';'

set nobackup
set nowritebackup
set noswapfile

set ruler			" Report the cursor position on the bottom right
set cursorline			" Highlight the line the cursor is currently on
