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
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Raimondi/delimitMate'
Plugin 'mbbill/fencview'
Plugin 'Valloric/YouCompleteMe'
Plugin 'google/vim-searchindex'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'google/vim-colorscheme-primary'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'MattesGroeger/vim-bookmarks'
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
set modeline
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
set smartcase

" Hide matched on <Leader>space
nnoremap <leader><space> :nohlsearch<CR>

" goto the middle of a line
"nnoremap <leader>m :call cursor(0, len(getline('.'))/2)<CR>

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

" Make the command line two lines high and change the statusline display to
" something that looks useful.
set cmdheight=2
set laststatus=2
set showcmd
set showmode
set number
"set relativenumber

" SuperTab
let g:SuperTabDefaultCompletionType = "context"

" Solarized Vim
syntax enable
set background=dark
"let g:solarized_termtrans=1
"let g:solarized_termcolors=256
"let g:solarized_contrast="high"
"let g:solarized_visibility="high"
"colorscheme solarized
colorscheme primary

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
"xnoremap p pgvy

" nerdTree for git
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" open nerdTree
map <leader>t :NERDTreeToggle<CR>

" gitgutter
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
let g:gitgutter_max_signs=1000

" java complete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete
let g:JavaComplete_UseFQN=1
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)

" gotags
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" ctag
nmap <leader>tt :TagbarToggle<CR>

" cscope
if filereadable("cscope.out")
  cs add cscope.out
endif

" Find functions calling this function
nmap <leader>fc :cs find c <C-R>=expand("<cword>")<CR><CR>
" Find this egrep pattern
nmap <leader>fe :cs find e <C-R>=expand("<cword>")<CR><CR>
" Find this file
nmap <leader>ff :cs find f <C-R>=expand("<cword>")<CR><CR>
" Find this definition
nmap <leader>fg :cs find g <C-R>=expand("<cword>")<CR><CR>
" Find this text string
nmap <leader>ft :cs find t <C-R>=expand("<cword>")<CR><CR>

" airline
let g:airline_theme='wombat'

" codfmt
Glaive codefmt clang_format_style='Google'

" gtag
let g:go_guru_tags='linux'

" bookmark
let g:bookmark_save_per_working_dir = 1

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <leader>ml :call AppendModeline()<CR>

" vim-go
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
