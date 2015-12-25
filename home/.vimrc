" Jaapz's vim config.
filetype off

" Vundle setup
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle is managed through a homeshick submodule
"Plugin 'VundleVim/Vundle.vim'

" Vundle plugins
Plugin 'Raimondi/delimitMate'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'klen/python-mode'
Plugin 'othree/yajs.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'sjl/badwolf'

" Nicer statusline
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'

" Vundle cleaunup
call vundle#end()
syntax on
filetype plugin indent on

" Random basic settings
let mapleader = ","
set number " Always show line numbers
set nocompatible " No vi compatibility
set cursorline " Highlight current line
set so=5

" Search settings
set hlsearch
set incsearch

" Split the Correct(tm) way.
set splitright

" Fold using syntax files
set foldmethod=syntax

" Pythonic indents
set shiftwidth=4
set autoindent
set smarttab
set expandtab
set tabstop=4
set softtabstop=4

" Correct unicode encoding
set encoding=utf-8
set termencoding=utf-8
set laststatus=2
set cursorline

" Ignore uneccessary files
set wildignore+=__pycache__
set wildignore+=*.pyc
set wildignore+=node_modules
set wildignore+=*/app/cache/*
set wildignore+=*/vendor/*

" Show max text width
set textwidth=79
set colorcolumn=79

" No backups
set nowritebackup 

" Why is this not default.
set backspace=indent,eol,start

" Enable colorscheme and 256 colors
colorscheme badwolf
set t_Co=256

" Make supertab move down the list by default
let g:SuperTabDefaultCompletionType = "<c-n>"

" Vim-airline config
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme = 'wombat'
let g:bufferline_fixed_index = 0
set laststatus=2 " Always show statusline
set noshowmode

" CtrlP config
let g:ctrlp_max_height = 20
let g:ctrlp_max_files = 0                                                      
let g:ctrlp_clear_cache_on_exit = 0                                            
let g:ctrlp_use_caching = 0
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }                      
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" Use ag!
set grepprg=ag

map <C-b> :CtrlPBuffer<CR>

" Python mode settings
let g:pymode_lint = 0
let g:pymode_lint_cwindow = 0
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_autoimport = 0
let g:pymode_lint_ignore = "F0401"
let g:pymode_rope_goto_definition_bind = '<C-]>'
let g:pymode_rope_goto_definition_cmd = 'e'
let g:pymode_breakpoint_cmd = 'import pytest;pytest.set_trace()'

" Don't show documentation in preview when autocompleting
set completeopt-=preview

" Syntastic
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_python_checkers = ["flake8"]

" Buffers
noremap <leader>/ <Esc>:bn<CR>
noremap <leader>. <Esc>:bp<CR>
noremap <leader>o <Esc>:bd<CR>

noremap <leader>s <Esc>:w<CR>
inoremap <leader>s <Esc>:w<CR>
vnoremap <leader>s <Esc>:w<CR>

" Also save on :W
com W w

" Copy and Paste to system clipboard
vmap <leader>c "+y
vmap <leader>x "+c
map <leader>v <Esc>v"+p

" My keyboard doesn't even have arrows anymore
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>