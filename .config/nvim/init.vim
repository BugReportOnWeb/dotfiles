" Fundamentals "{{{
" ------------------------------------------------------

" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

set nocompatible                " disable compatiblity to old-time vi
set number                      " add line numbers
syntax enable                   " syntax highlghting
set encoding=utf-8
set title
set autoindent                  " indent a new line the same amount as the line just typed
set background=dark
" set nobackup
set hlsearch                    " highlight search
set scrolloff=10
set expandtab                   " converts tabs to white space
set shell=fish

set showmatch                   " show matching
set ignorecase                  " case insensitive
set mouse=v                     " middle-click paste with
set incsearch                   " incremental search
set tabstop=4                   " number of colums occupied by a tab
set softtabstop=4               " see multiple spaces as tabstops so <BS> does the right thing
set shiftwidth=4                " width for autoindents
set wildmode=longest,list       " set bask-like tab completions
" set cc=80                     " set an 80 column border for good coding style
filetype plugin indent on       " allow auto-indenting depending on file type
" set mouse=a                     " enable mouse click
set clipboard=unnamedplus       " using system clipboard
filetype plugin on
set cursorline                  " highlight current cursorline
set ttyfast                     " speed up scrolling in Vim
set nowrap                      " Do not wrap lines
" set spell                     " enable spell check (may need to download language package)
" set noswapfile                " disable creating swap file
" set backupdir=~/.cache/vim    " Directory to store backup file

"}}}

" Plugins ======= {{{
call plug#begin("~/.vim/plugged")
    Plug 'dracula/vim'                                              " Dark (Dracula) theme for nvim
    Plug 'ryanoasis/vim-devicons'                                   " Adds icond to Vim Plugins
    Plug 'honza/vim-snippets'                                       " Vim-snipmate defalut snippets
    Plug 'SirVer/ultisnips'                                         " Snippet for Vim 
    Plug 'scrooloose/nerdtree'                                      " A tree explorer plugin for vim
    " Plug 'preservim/nerdcommenter'                                  " Vim plugin for intensely nerdy commenting powers
    Plug 'junegunn/goyo.vim'                                        " Distration-free writing in Vim
    Plug 'vim-airline/vim-airline'                                  " Lean and mean status
    Plug 'ap/vim-css-color'                                         " Preview colours in cource code while editing
    Plug 'mhinz/vim-startify'                                       " The fancy start screen for Vim
    Plug 'neoclide/coc.nvim', {'branch': 'release'}                 " Nodejs extension and host language servers
    Plug 'tpope/vim-fugitive'                                       " Git wrapper 
    Plug 'tpope/vim-rhubarb'                                        " GitHub extension for fugitive.vim
    Plug 'tpope/vim-surround'                                       " Surrounding with appilied character
    Plug 'tpope/vim-commentary'                                     " Comment stuff out
    Plug 'cohama/lexima.vim'                                        " Auto close parentheses and repeat by dot dot dot...
    "Plug 'neovim/nvim-lspconfig'                                   " Quickstart configuration for the Nvim LSP client
    "Plug 'glepnir/lspsaga.nvim'                                    " Neovim lsp plugin
    Plug 'vimwiki/vimwiki' 
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-lua/completion-nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
call plug#end()
" }}}

" color schemes
if (has("termguicolors"))
set termguicolors
"set background=dark
"let g:neosolarized_terntrans=1
"runtime ./colors/NeoSolarized.vim
"colorscheme dracula                    " Uncomment to use dracule theme
"colorscheme NeoSolarized               " Uncomment to use dracula theme
endif
syntax enable
    " colorscheme evening

" open new split panes to right and below set splitright
set splitbelow
set splitbelow

" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" move split panes to left/bottom/top/right
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L

" move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Press i to enter insert mode, and jj to exit insert mode.
:inoremap jj <Esc>
":inoremap jk <Esc>
":inoremap kj <Esc>
":vnoremap jk <Esc>
":vnoremap kj <Esc>

" Using <space> for entering command mode
nnoremap <space> :

" open file in a text by placing text and gf
nnoremap gf :vert winc f<cr>

" copies filepath to clipboard by pressing yf
:nnoremap <silent> yf :let @+=expand('%:p')<CR>
" copies pwd to clipboard: command yd
:nnoremap <silent> yd :let @+=expand('%:p:h')<CR>

" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
nnoremap <F3> :NERDTreeToggle<cr>

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" Prefer Markdown for vimwiki instead of VimWiki
" let g:vimwiki_list = [{'path': '~/vimwiki/',
"                       \ 'syntax': 'markdown', 'ext': '.md'}]

" let g:vimwiki_list = [{'path': '~/vimwiki', 'template_path': '~/vimwiki/templates/',
"           \ 'template_default': 'default', 'syntax': 'markdown', 'ext': '.md',
"           \ 'path_html': '~/vimwiki/site_html/', 'custom_wiki2html': 'vimwiki_markdown',
"           \ 'html_filename_parameterization': 1,
"           \ 'template_ext': '.tpl'}]

