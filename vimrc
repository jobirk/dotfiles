" -----------------------------------------------------------------------------
" Plugin Manager
" -----------------------------------------------------------------------------
"  Useful commands:
"  :PlugUpdate
"  :PlugInstall
"  :PlugClean

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
" Create undodir if it doesn't exist
if empty(glob('~/.vim/undodir'))
  silent !mkdir -pv ~/.vim/undodir
endif

" List the plugins to be installed
" For more information just check github.com/<plugin_name>
call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdtree'                      " File browser (better set a shortcut for that, see below)
    Plug 'ctrlpvim/ctrlp.vim'                       " Fuzzy file search
    Plug 'tpope/vim-repeat'                         " Make surround dot-repeatable
    Plug 'tpope/vim-surround'                       " Change and add such surroundings in pairs
    Plug 'tpope/vim-commentary'                     " Comment stuff out using gc<motion>
    Plug 'tpope/vim-fugitive'                       " git plugin. Use any git command with ':G <command>', like ':G status'
    Plug 'airblade/vim-gitgutter'                   " Show git changes (+/-/~) next to line numbers
    Plug 'itchyny/lightline.vim'                    " Minimal status line
    Plug 'mhartington/oceanic-next'                 " Dark colorscheme 
    Plug 'vim-python/python-syntax'                 " Python syntax highlight
    Plug 'Vimjas/vim-python-pep8-indent'            " Fixes python indenting (pep8 conventions)
    Plug 'psf/black', { 'branch': 'stable' }        " Python code formatter https://black.readthedocs.io/en/stable/integrations/editors.html#vim
    " Plug 'neoclide/coc.nvim', {'branch': 'release'} " Vim plugin for VSCode style autocomplete and more
    " Plug 'jiangmiao/auto-pairs'                     " Insert brackets in pairs
call plug#end()

" -----------------------------------------------------------------------------
" General stuff
" -----------------------------------------------------------------------------

" Line numbers and syntax
set number
set relativenumber      " To confuse colleagues
set colorcolumn=88
filetype indent on      " Adjust indenting corresponding to filetype

"Shorter updatetime for git gutter
set updatetime=100

" Tab settings (use spaces instead)
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Settings for undo-behaviour
set history=1000            " Remember more commands and search history
set nobackup                " No backup or swap file, live dangerously
set noswapfile              " Because swap files give annoying warning
set undodir=~/.vim/undodir  " Set directory for undofile
set undofile                " Save undos (then still accessible after closing a file)
set undolevels=10000        " Maximum number of changes that can be undone
set undoreload=100000       " Maximum number lines to save for undo on a buffer reload

" Split view settings
set splitright          " Vsplit: new window on the right (instead of left)
set splitbelow          " Horizontal split opens new window below

" Search settings
set hlsearch            " Highlight search and search while typing
set incsearch           " Cursor jumps to first matching while typing
set ignorecase          " Non-case sensitive search
set cpoptions+=x        " Stay at search item when <esc>

" Backspace through anything in insert mode
set backspace=indent,eol,start

" -----------------------------------------------------------------------------
" Keybindings
" -----------------------------------------------------------------------------

" Shortcut to enter paste mode
set pastetoggle=<C-p>
" Keybinding for opening a terminal
nnoremap <C-t> :ter++rows=20<CR>

" -----------------------------------------------------------------------------
" Plugin related
" Shortcut for NerdTree toggle (toggle on ctrl+n)
nmap <C-n> :NERDTreeToggle<CR>
" Shortcut for black
nnoremap <C-b> :Black<CR>
" ctrlp (fuzzy file search) keybindings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" -----------------------------------------------------------------------------
" Colorscheme and status bar
" -----------------------------------------------------------------------------
colorscheme OceanicNext
" Use 'filename' instead of 'absolutepath' to just show the filename
let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'absolutepath', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
set laststatus=2

" -----------------------------------------------------------------------------
" NERDTree settings
" -----------------------------------------------------------------------------
" Enable line numbers
let NERDTreeShowLineNumbers=1
" Make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

" -----------------------------------------------------------------------------
" Filetype specific settings
" -----------------------------------------------------------------------------
" --- Python settings
let g:python_highlight_all = 1
" --- Yaml settings
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab