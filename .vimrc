set mouse=a                 "Enables mouse navigation in vim
colorscheme evening         "Enables evening colorscheme 

" These are nice default colorschemes for macOS and Linux
" macOS - desert, habamax, slate   
" Linux - ron, evening

syntax on                   "Color highlighting
set history=200             "Allows vim to save the last 200 commands
set splitright              "When open new buffer for edit, splits on right
set relativenumber          "Enables relative line numeration
set number                  "Enables line numeration
set nocompatible            "Starts vim in no compatible mode with vi
set nrformats=              "Allows to increment numbers in visual mode
set encoding=utf-8          "Encoding of the file is set to utf-8
set path+=**                "Allows you to search files relative to root project
set foldmethod=indent       "Sets the fold method to indent (because I use Python)
set wildmenu                "When looking for :col (for example) gives suggestions and navigation with tab
set showcmd                 "Todo
set laststatus=2            "Todo
set statusline+=%F          "Todo
set cursorcolumn            "Allow you to track the cursor with vertical line
set cursorline              "Allow you to track the cursor with horizontal line
set colorcolumn=80

highlight CursorLine cterm=bold ctermbg=black
highlight CursorColumn cterm=bold ctermbg=black

set hlsearch                "Hightlight the words that have been searched
set incsearch               "Allow incremental search
set ignorecase              "When searching, ignore lower or uppecase
set smartcase               "Todo
set showmatch               "Todo
set virtualedit=block       "Todo
set termguicolors           "Todo
set scrolloff=999           "Todo
set t_ut=                   "Todo
"set noswapfile             "Dangerous, edit with no swap file


"This is the path of the tags file
" set tags+=$HOME/work/librerias/my_tags/cbimltags,$HOME/work/librerias/my_tags/venvtags

" Useful remappings for Vim in Chrome
" This remappings are when you have 2 buffers opened
" And want to move around using the keyboard
" left, down, up and right respectively

"Navigate trought all the windows
"nmap <C-n> <C-w>w                      

"Allow <C-h> to navigate to the left window
nmap <C-h> <C-w>h           

"Allow <C-j> to navigate to the window below
nmap <C-j> <C-w>j

"Allow <C-k> to navigate to the window up
nmap <C-k> <C-w>k

"Allow <C-l> to navigate to the right window
nmap <C-l> <C-w>l

map <Nul> <c-space>
map! <Nul> <c-space>

inoremap <c-space> <c-n>

nnoremap o o<Esc>0"_D
nnoremap O O<Esc>0"_D

nnoremap <C-e> <C-]>
nnoremap <C-a> <C-t>

" This mapping helps you to use %% insstead of %:h
" To autocomplete the path of the current buffer/tab opened
" And easily open a file
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" this cleans the highlightings
" nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" This configuration is for Python
" It uses no plugins or whatsoever

let g:pymode_rope = 0

au FileType python setl ofu=python3complete#Complete

au BufNewFile,BufRead *.py set colorcolumn=79
au BufNewFile,BufRead *.py setlocal foldmethod=indent
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4 
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set textwidth=79
au BufNewFile,BufRead *.py set expandtab 
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix

highlight BadWhitespace ctermbg=red guibg=red
au BufNewFile,BufRead *.py match BadWhitespace /\s\+$/

highlight BadWhitespace2 ctermbg=red guibg=red
au BufNewFile,BufRead *.py 2match BadWhitespace2 /^\t\+/

au BufNewFile,BufRead *.py vmap <CR> :s/\(^\s*\)/\1# /<CR>:let @/ = ""<CR>
au BufNewFile,BufRead *.py vmap <S-CR> :s/\(^\s*\)# /\1/<CR>:let @/ = ""<CR>

" This configuration is for Python
" It uses the Jedi-vim Plugin

" Allows you to travel to the source code of the class or function
let g:jedi#goto_command = "gd"

" Takes you to the line where you define the function, class or variable
let g:jedi#goto_assignments_command = "gD"

" Pops-up the documentation for the class or variable
let g:jedi#documentation_command = "K"

" C-space to trigger auto-complete
let g:jedi#completions_command = "<C-Space>"

"" Disables autocompletion because it's really slow for pandas
let g:jedi#completions_enabled = 0

"" Disables autocompletion because it's really slow for pandas
let g:jedi#popup_on_dot = 0
