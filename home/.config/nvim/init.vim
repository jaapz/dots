" Jaapz's vim config.
filetype off

" Plug setup
call plug#begin('~/.config/nvim/plugged')

Plug 'Raimondi/delimitMate'
Plug 'ervandew/supertab'
Plug 'benekastah/neomake'
Plug 'klen/python-mode'
Plug 'othree/yajs.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'zeis/vim-kolor'

" Nicer statusline
Plug 'bling/vim-airline', { 'tag': 'v0.7' }
Plug 'bling/vim-bufferline'

" Plug cleaunup
call plug#end()
syntax on
filetype plugin indent on

" Random basic settings
let mapleader = ","
set number " Always show line numbers
set nocompatible " No vi compatibility
set cursorline " Highlight current line
set so=5

" When opening a new buffer while the current one has changed and not saved,
" just 'hide' it and switch to the new buffer, instead of opening the new
" buffer in a vsplit or asking to save every time this happens.
set hidden

" Search settings
set hlsearch
set incsearch

" Split the Correct(tm) way.
set splitright

" Fold using syntax files
set foldmethod=indent
set nofoldenable

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
set colorcolumn=79,119

" No backups
set nowritebackup 

" Why is this not default.
set backspace=indent,eol,start

" Enable colorscheme and 256 colors
colorscheme kolor
set t_Co=256

" Let supertab figure out which completion to use based on context, and make
" the enter key "accept" the completion suggestion.
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCrMapping = 1

" Automatically change the CWD with the file we are currently editing
set autochdir

" Vim-airline config
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme = 'kolor'
let g:bufferline_fixed_index = 0
let g:bufferline_echo = 0
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
let g:pymode_lint = 0  " Neomake handles linting
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_autoimport = 0
let g:pymode_lint_ignore = "F0401"
let g:pymode_rope_goto_definition_bind = '<C-]>'
let g:pymode_rope_goto_definition_cmd = 'e'
let g:pymode_breakpoint_cmd = 'import pytest;pytest.set_trace()'

" Don't show documentation in preview when autocompleting
set completeopt-=preview

" Neomake
let g:neomake_javascript_enabled_makers = ["eslint"]
let g:neomake_python_enabled_makers = ["flake8"]
autocmd BufWritePost * silent Neomake

" Delimitmate
let g:delimitMate_jump_expansion = 1
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

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
