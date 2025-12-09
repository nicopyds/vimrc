"Configuration for plain Vim
set mouse=a
colorscheme slate 

" macos - desert, habamax, slate   
" linux - ron

syntax on
set splitright
set relativenumber
set number
set nocompatible
set encoding=utf-8
set path+=**
set foldmethod=indent
set wildmenu
set showcmd
set laststatus=2
set statusline+=%F
set cursorcolumn
set cursorline
:highlight CursorLine cterm=bold ctermbg=black
set hlsearch
set ignorecase
set smartcase
set showmatch
set virtualedit="block"
" set termguicolors
set scrolloff=999
set t_ut=""
set noswapfile

" Useful remappings for Vim in Chrome
" This remappings are when you have 2 buffers opened
" And want to move around using the keyboard
" left, down, up and right respectively

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

map <Nul> <c-space>
map! <Nul> <c-space>

inoremap <c-space> <c-n>

nnoremap o o<Esc>0"_D
nnoremap O O<Esc>0"_D

" this configuration is for python
" it uses no plugins or whatsoever

let g:pymode_rope = 0

au FileType python setl shiftwidth=4 tabstop=4
au FileType python setl ofu=python3complete#Complete

au BufNewFile, BufRead *.py set colorcolumn=79
au BufNewFile, BufRead *.py set setLocal foldmethod=indent
au BufNewFile, BufRead *.py set tabstop=4
au BufNewFile, BufRead *.py set shiftwidth=4 
au BufNewFile, BufRead *.py set softtabstop=4
au BufNewFile, BufRead *.py set textwidth=79
au BufNewFile, BufRead *.py set expandtab 
au BufNewFile, BufRead *.py set autoindent
au BufNewFile, BufRead *.py set fileformat=unix

au BufNewFile, BufRead *.py match BadWhitespace /\s\+$/
au BufNewFile, BufRead *.py match BadWhitespace /^\t\+/
au BufNewFile, BufRead *.py vmap <CR> :s/\(^\s*\)/\1# /<CR>:let @/ = ""<CR>
au BufNewFile, BufRead *.py vmap <S-CR> :s/\(^\s*\)# /\1/<CR>:let @/ = ""<CR>
