" Jaapz's vim config.
filetype off

" Plug setup
call plug#begin('~/.config/nvim/plugged')

" Linting & completion
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" Project and file management
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf.vim'

" Color scheme
Plug 'morhetz/gruvbox'

" Easier commenting
Plug 'tpope/vim-commentary'

" Javascript tools
Plug 'mustache/vim-mustache-handlebars'
Plug 'ElmCast/elm-vim'
Plug 'othree/yajs.vim'

" Nicer statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'

" Typescript
Plug 'HerringtonDarkholme/yats.vim'

" Python
Plug 'tmhedberg/SimpylFold'

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
set nowrap

" When opening a new buffer while the current one has changed and not saved,
" just 'hide' it and switch to the new buffer, instead of opening the new
" buffer in a vsplit or asking to save every time this happens.
set hidden

" Search settings
set hlsearch
set incsearch
set inccommand=split

" Split the Correct(tm) way.
set splitbelow

" Fold using syntax files
set foldmethod=syntax

" Pythonic indents
set shiftwidth=4
set autoindent
set smarttab
set expandtab
set tabstop=4
set softtabstop=4

" Disable auto indent for html files
au FileType html.handlebars setlocal indentexpr=

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
set wildignore+=*/.git/*
set wildignore+=*/tmp/*
set wildignore+=*.swp

" Show max text width
set textwidth=79
set colorcolumn=79,120

" No backups
set nowritebackup 

" Why is this not default.
set backspace=indent,eol,start

" Show tabs/spaces
set list
set listchars=tab:>-

" Enable colorscheme and 256 colors
set background=dark
let g:gruvbox_contrast_dark = "medium"
let g:gruvbox_improved_string = 1
let g:gruvbox_improved_warnings = 1

colorscheme gruvbox
set t_Co=256
set termguicolors

" Let supertab figure out which completion to use based on context, and make
" the enter key "accept" the completion suggestion.
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCrMapping = 1

" Vim-airline config
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme = 'gruvbox'
let g:bufferline_fixed_index = 0
let g:bufferline_echo = 0
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#branch#sha1_len = 6
let g:airline#extensions#branch#displayed_head_limit = 5
set laststatus=2 " Always show statusline
set noshowmode

" Fzf config
set winblend=10 " See-through popover windows

let $FZF_DEFAULT_COMMAND = "rg --files"
let $FZF_PREVIEW_COMMAND = "bat --style=snip --theme='Monokai Extended' --color=always {}"
let $FZF_DEFAULT_OPTS=' --color=dark --layout=reverse --margin=1,2'

" Use nvim floating windows to show fzf results.
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = float2nr(40)
  let width = float2nr(90)
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = 1

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction

nnoremap <silent> <C-p> :call fzf#vim#files('', fzf#vim#with_preview({'options': '--prompt ""'}, 'right:70%'))<CR>
nnoremap <silent> <C-o> :Rg<CR>
nnoremap <silent> <leader>b :Buffers<CR>

" Use rg!
set grepprg=rg

map <C-b> :CtrlPBuffer<CR>

" Typescript
let g:nvim_typescript#type_info_on_hold = 1
let g:nvim_typescript#default_mappings = 1
let g:nvim_typescript#tsimport#template = 'import {%s} from ''%s'';'

" Tern for deoplete
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" Typescript
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
let g:tsuquyomi_disable_quickfix = 1

" Ale configuration
let g:ale_linters_explicit = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver'],
\   'go': ['gometalinter', 'golint', 'govet'],
\   'python': ['flake8', 'mypy'],
\}

let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'go': ['goimports'],
\   'python': ['black'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\}

let g:ale_go_gometalinter_options = '--disable-all --enable=errcheck --enable=megacheck --vendor'
let g:ale_sign_column_always = 1
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠️'
let g:ale_open_list = 0

" CoC config
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=yes
set cmdheight=2

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

hi default link CocHoverRange     Syntax

function! s:show_documentation()
  call CocAction('doHover')
endfunction

" Show documentation when the cursor is above something interesting
autocmd CursorHold * silent call s:show_documentation()

" SimpylFold
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_import = 0

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
