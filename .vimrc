set nocompatible

filetype on
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'christoomey/vim-tmux-navigator'
Bundle 'kien/ctrlp.vim.git'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'
Bundle 'plasticboy/vim-markdown'
Bundle "ekalinin/Dockerfile.vim"
Bundle "scrooloose/nerdtree"
Bundle "jnwhiteh/vim-golang"
Bundle 'mustache/vim-mustache-handlebars'

let mapleader=','

let NERDTreeIgnore = ['\.pyc$']
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

imap <Space-Tab> <C-P>

set noshowmode
set showcmd
set smartindent
set hidden
set wrap
set textwidth=79
set tabstop=4
set softtabstop=4
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set shiftwidth=4
set shiftround
set showmatch
set ignorecase
set smartcase
set foldenable
set smarttab
set expandtab
set hlsearch
set incsearch
set history=1000000
set undolevels=100000
set wildignore="*.swp,*.bak,*.pyc,*.class"
set title
set visualbell
set noerrorbells
set nobackup
set noswapfile
set ruler 
"set list
"set listchars=tab:▸\ ,eol:¬,trail:⋅,nbsp:␣,extends:❯,precedes:❮
"set rnu
set laststatus=2
set ffs=unix,mac,dos
set autowrite
set autoread

set termencoding=utf-8
set encoding=utf-8



set formatoptions=
set formatoptions-=t
set formatoptions+=c
set formatoptions+=r
set formatoptions+=o
set formatoptions+=q
set formatoptions+=n
set formatoptions+=l

if &t_Co >= 256 || has("gui_running")
   "colorscheme Tomorrow-Night-Eighties
endif

if &t_Co > 2 || has("gui_running")
   " switch syntax highlighting on, when the terminal has colors
   syntax on
endif

set pastetoggle=<F2>
set mouse=a

if has("autocmd")

    filetype on

    autocmd BufNewFile,BufRead *.rss,*.atom setfiletype xml

    autocmd BufRead COMMIT_EDITMSG setlocal spell spelllang=en_us

    autocmd BufNewFile,BufRead COMMIT_EDITMSG call feedkeys('ggi', 't')

    autocmd BufNewFile,BufRead *.md,*.mkd,*.markdown setfiletype markdown
    autocmd BufNewFile,BufRead *.md,*.mkd,*.markdown set spell spelllang=en_us
    autocmd FileType markdown setlocal tw=100

    autocmd BufNewFile,BufRead *.py set ts=2 sts=2 sw=2 expandtab

endif
    
let g:airline_theme             = 'tomorrow'
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#whitespace#trailing_format = 'trailing[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = 'mixed-indent[%s]'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''

"set statusline=%<%f\                     " Filename
"set statusline+=%w%h%m%r                 " Options\
"set statusline+=\ [%{&ff}/%Y]            " Filetype
"set statusline+=\ [%{getcwd()}]          " Current dir
"set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

"set statusline=
"set statusline+=%7*\[%n]                                  "buffernr
"set statusline+=%1*\ %<%F\                                "File+path
"set statusline+=%2*\ %y\                                  "FileType
"set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
"set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
"set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
"set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
"set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
"set statusline+=%9*\ col:%03c\                            "Colnr
"set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.

:set guicursor+=n:hor20-Cursor/lCursor

filetype plugin indent on
