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
