set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/LargeFile'
Plugin 'scrooloose/nerdcommenter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Raimondi/delimitMate'
Plugin 'mbbill/fencview'
Plugin 'vim-scripts/Visual-Mark'
Plugin 'Valloric/YouCompleteMe'
Plugin 'google/vim-searchindex'
Plugin 'fatih/vim-go'
call vundle#end()
filetype plugin indent on
call glaive#Install()
call maktaba#plugin#Detect()

" map leader key
let mapleader = ","

" Large file
let g:LargeFile=10

" File encoding dectection
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set encoding=utf-8

" Tab Settings
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Fix backspace indentation
set backspace=indent,eol,start

" Convince Vim it can use 256 colors
set t_Co=256

let no_buffers_menu=1

" Code Folding, everything foleded by default
set foldmethod=indent
set foldlevel=99
set foldenable

" Turn off annoying swapfiles
set noswapfile

" Enable hidden buffers
set hidden

" Enable automatic title setting for terminals
set title
set titleold="Terminal"
set titlestring=%F\ -\ Vim

" Activate a permanent ruler
set ruler

" Disable the stupid pydoc preview window for the omni completion
set completeopt-=preview

" Global by default
set gdefault

" Better Search
set hlsearch

" Hide matched on <Leader>space
nnoremap <leader><space> :nohlsearch<CR>

" goto the middle of a line
nnoremap <leader>m :call cursor(0, len(getline('.'))/2)<CR>

" Quit windows on <leader>q
nnoremap <leader>q :q<CR>

" substitute
nnoremap <leader>ss :%s/

" next split and prev split
nnoremap <leader>wl <c-w>l
nnoremap <leader>wh <c-w>h
nnoremap <leader>wj <c-w>j
nnoremap <leader>wk <c-w>k

" vsplit map
nnoremap <leader>vp :vsplit<CR>

" fencview
"let g:fencview_autodetect=1

" Make the commadn line two lines high and change the statusline display to
" something that looks useful.
set cmdheight=2
set laststatus=2
set showcmd
set showmode
set number

" SuperTab
let g:SuperTabDefaultCompletionType = "context"

" Solarized Vim
syntax enable
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized

" set paste
noremap <leader>sp :set paste<CR>
noremap <leader>cp :set nopaste<CR>

" delimitMate
let g:delimitMate_autoclose=1
let g:delimitMate_matchpairs="(:),[:],{:}"
let g:delimitMate_balance_matchpairs=1
let g:delimitMate_expand_cr=1

" ycm
let g:ycm_confirm_extra_conf=0
nnoremap <f4> :YcmDiag<CR>

" not change clipboard
xnoremap p pgvy
