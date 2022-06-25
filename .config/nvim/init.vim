""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     _   ____________ _    ________  ___   __________  _   __________________
"    / | / / ____/ __ \ |  / /  _/  |/  /  / ____/ __ \/ | / / ____/  _/ ____/
"   /  |/ / __/ / / / / | / // // /|_/ /  / /   / / / /  |/ / /_   / // / __  
"  / /|  / /___/ /_/ /| |/ // // /  / /  / /___/ /_/ / /|  / __/ _/ // /_/ /  
" /_/ |_/_____/\____/ |___/___/_/  /_/   \____/\____/_/ |_/_/   /___/\____/
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fundamentals -----------------
set nocompatible            " Disable compatibility to old-time vi
set showmatch               " Show matching 
set encoding=UTF-8
set ignorecase              " Case insensitive 
set mouse=v                 " Middle-click paste with 
set hlsearch                " Highlight search 
set incsearch               " Incremental search
set tabstop=4               " Number of columns occupied by a tab 
set softtabstop=4           " See multiple spaces as tabstops so <BS> does the right thing
set expandtab               " Converts tabs to white space
set shiftwidth=4            " Width for autoindents
set autoindent              " Indent a new line the same amount as the line just typed
set number                  " Add line numbers
set wildmode=longest,list   " Get bash-like tab completions
filetype plugin indent on   " Allow auto-indenting depending on file type
syntax on                   " Syntax highlighting
set clipboard=unnamedplus   " Using system clipboard
filetype plugin on
set cursorline              " Highlight current cursorline
set nowrap
set ttyfast                 " Speed up scrolling in Vim
set guicursor=              " Disable cursor change when entering nvim

" Plugin Section ---------------
call plug#begin("~/.vim/plugged")
    Plug 'tpope/vim-commentary'             " Comment stuff out
    Plug 'scrooloose/nerdtree'              " A tree explorer plugin
    Plug 'ryanoasis/vim-devicons'           " Adds icons
    Plug 'mhinz/vim-startify'               " The fancy start screen
    Plug 'vim-airline/vim-airline'          " Lean and mean status
    Plug 'norcalli/nvim-colorizer.lua'      " Preview colours
    Plug 'tpope/vim-surround'               " Surrounding with appilied character
    Plug 'cohama/lexima.vim'                " Auto close parentheses
    Plug 'shime/vim-livedown'               " Live markdown preview

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}     " Incremental parsing system
call plug#end()

" Treesitter lua setup
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}
EOF

" Color schemes ---------------
if (has("termguicolors"))
    set termguicolors
endif
syntax enable

" Setup for nvim-colorizer
lua require'colorizer'.setup()

" Open new split panes to right and below
set splitright
set splitbelow

" Move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Move split panes to left/bottom/top/right
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L

" Move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Press i to enter insert mode, and jj to exit insert mode.
:inoremap jj <Esc>

" Using <space> for entering command mode
nnoremap <space> :

" Open file in a text by placing text and gf
nnoremap gf :vert winc f<cr>

" Copies filepath to clipboard by pressing yf
:nnoremap <silent> yf :let @+=expand('%:p')<CR>
" Copies pwd to clipboard: command yd
:nnoremap <silent> yd :let @+=expand('%:p:h')<CR>

" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Mapping F3 key to toggle NERDTree open and close.
nnoremap <F3> :NERDTreeToggle<cr>

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" Mapping for live markdown
nmap gm :LivedownToggle<CR>

