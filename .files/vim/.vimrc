scriptencoding utf-8
set encoding=utf-8

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Bundle "scrooloose/nerdtree"

call vundle#end()
filetype plugin indent on
syntax on

set background=dark
colorscheme solarized

let mapleader=","
nnoremap ; :
set showcmd

set nobackup
set nowritebackup
set noswapfile

set ruler                       " Report the cursor position on the bottom right
set cursorline                  " Highlight the line the cursor is currently on

set textwidth=80                " Set the text width to 80 characters
set colorcolumn=+1              " Color the column after 80 characters

set number                      " Enable line numbers on the left
set numberwidth=5               " Add a buffer between the number and the edge

set tabstop=4                   " Tabs are equal to 4 columns
set expandtab                   " Expand the tab character into spaces
set shiftwidth=4                " Reindent operations should use 4 columns
set shiftround                  " 3 -> 5; !(3 -> 7)

set hlsearch                    " If there was a previous patter, highlight the matches
set incsearch                   " Jump to the first match as the query is typed in
set ignorecase                  " Make the search case-insensitive
set smartcase                   " If the search includes a capital letter, make it case-sensitive

set splitbelow                  " Split new panes to the right and bottom
set splitright

set scrolloff=5                 " Start scrolling when five rows above the end
set scrolljump=0
                                    " Force myself to use the hjkl keys
nnoremap <Left> :echoe "h"<CR>
nnoremap <Right> :echoe "l"<CR>
nnoremap <Up> :echoe "k"<CR>
nnoremap <Down> :echoe "j"<CR>

set list listchars=tab:»·,trail:·,eol:¶

set laststatus=2

let g:airline_theme = 'solarized'

autocmd vimenter * if !argc() | NERDTree | endif " If there aren't any arguments automatically open NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " If NERDTree is the only buffer open, close vim
let NERDTreeShowHidden=1            " Show hidden (starts with '.') files
let NERDTreeIgnore = ['\.pyc$']     " Ignore .pyc files
