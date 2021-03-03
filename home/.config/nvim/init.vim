" Jaapz's vim config.
filetype off

" Plug setup
call plug#begin('~/.config/nvim/plugged')

" Linting & completion
Plug 'psf/black', { 'branch': '20.8b1' }
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" Highlighting & syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " highlighting
Plug 'mustache/vim-mustache-handlebars'
Plug 'embark-theme/vim', {'as': 'embark'}

" Project and file management
Plug 'tpope/vim-fugitive'

" Easier commenting
Plug 'tpope/vim-commentary'

" Keep cursor state across nvim edit sessions
Plug 'zhimsel/vim-stay'

" Nicer statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Telescope (better Ctrl-P)
Plug 'nvim-lua/popup.nvim'          " popup impl for telescope
Plug 'nvim-lua/plenary.nvim'        " helper functions for telescope
Plug 'kyazdani42/nvim-web-devicons' " nice icons in telescope
Plug 'nvim-telescope/telescope.nvim'

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
set formatoptions-=t

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

" Fold using indent, default fold opens.
set foldmethod=indent
"set foldmethod=expr
"set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable

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

" Why is this not default.
set backspace=indent,eol,start

" Show tabs/spaces
set list
set listchars=tab:>-

" Enable colorscheme and 256 colors
set background=dark
colorscheme embark
set t_Co=256
set termguicolors

" Treesitter config
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
  indent = {
    enable = false,
  }
}
EOF

" Vim-airline config
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#branch#sha1_len = 6
let g:airline#extensions#branch#displayed_head_limit = 5
let g:airline#extensions#coc#enabled = 0
set laststatus=2 " Always show statusline
set noshowmode

" Telescope
nnoremap <silent> <C-p> <cmd>Telescope find_files<CR>
nnoremap <silent> <C-o> <cmd>Telescope live_grep<CR>
nnoremap <silent> <C-s> <cmd>Telescope current_buffer_fuzzy_find<CR>
nnoremap <silent> <C-b> <cmd>Telescope buffer<CR>
nnoremap <silent> <leader>b <cmd>Telescope buffers<CR>

lua <<EOF
require('telescope').setup{
  defaults = {
    prompt_prefix = "> ",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "vertical",
    layout_defaults = {
      vertical = {
        mirror = true,
      },
    },
    winblend = 10,
    use_less = false,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,

    -- vim_buffer_cat is still buffy with python, so for now we use old cat
    file_previewer = require'telescope.previewers'.cat.new,
  }
}
EOF

" Remove 'set hidden'
set nohidden

augroup netrw_buf_hidden_fix
    autocmd!

    " Set all non-netrw buffers to bufhidden=hide
    autocmd BufWinEnter *
                \  if &ft != 'netrw'
                \|     set bufhidden=hide
                \| endif

augroup end

" Use rg!
set grepprg=rg

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
nmap <leader>a <Plug>(coc-codeaction)

hi default link CocHoverRange     Syntax

function! s:show_documentation()
  call CocAction('doHover')
endfunction

" Show documentation when the cursor is above something interesting
autocmd CursorHold * silent call s:show_documentation()

hi default link CocHoverRange     Syntax
autocmd BufWritePre *.py execute ':Black'

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
