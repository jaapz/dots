" Jaapz's vim config.
filetype off

" Plug setup
call plug#begin('~/.config/nvim/plugged')

" Linting & completion
Plug 'psf/black', { 'branch': '20.8b1' }
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'folke/lsp-trouble.nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'fatih/vim-go'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/0.x'
  \ }
Plug 'mattn/emmet-vim'

" Highlighting & syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " highlighting
Plug 'mustache/vim-mustache-handlebars'
Plug 'embark-theme/vim', {'as': 'embark'}

" Project and file management
Plug 'airblade/vim-gitgutter'

" Easier commenting
Plug 'tpope/vim-commentary'

" Nicer statusline
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

" Telescope (better Ctrl-P)
Plug 'nvim-lua/popup.nvim'          " popup impl for telescope
Plug 'nvim-lua/plenary.nvim'        " helper functions for telescope
Plug 'kyazdani42/nvim-web-devicons' " nice icons in telescope
Plug 'nvim-telescope/telescope.nvim'

" Plug cleaunup
call plug#end()
syntax on
filetype plugin indent on

" Lua plugin configs
lua <<EOF
require 'plugins.treesitter'
require 'plugins.telescope'
require 'plugins.lspconfig'
require 'plugins.statusline'
require 'plugins.compe'
require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
}
EOF

" Random basic settings
let mapleader = ","
set number " Always show line numbers
set nocompatible " No vi compatibility
set cursorline " Highlight current line
set so=5
set nowrap
set formatoptions-=t
set splitbelow
set cursorline

" When opening a new buffer while the current one has changed and not saved,
" just 'hide' it and switch to the new buffer, instead of opening the new
" buffer in a vsplit or asking to save every time this happens.
set hidden

" Search settings
set hlsearch
set incsearch
set inccommand=split

" Fold using indent, default fold opens.
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

" Allow more sane backspace behaviour
set backspace=indent,eol,start

" Enable colorscheme and 256 colors
set background=dark
colorscheme embark
set t_Co=256
set termguicolors

" Statusline config
set noshowmode

" Use rg!
set grepprg=rg

" Telescope
nnoremap <silent> <C-p> <cmd>Telescope find_files<CR>
nnoremap <silent> <C-o> <cmd>Telescope live_grep<CR>
nnoremap <silent> <C-s> <cmd>Telescope current_buffer_fuzzy_find<CR>
nnoremap <silent> <C-b> <cmd>Telescope buffer<CR>
nnoremap <silent> <leader>b <cmd>Telescope buffers<CR>

" nvim-lsp & nvim-compe
set signcolumn=no
set completeopt=menuone,noselect
set shortmess+=c
set updatetime=300

inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')

lua <<EOF
vim.lsp.util.apply_text_document_edit = function(text_document_edit, index)
  local text_document = text_document_edit.textDocument
  local bufnr = vim.uri_to_bufnr(text_document.uri)

  vim.lsp.util.apply_text_edits(text_document_edit.edits, bufnr)
end
EOF

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gy <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.hover()<CR>
"nnoremap <silent> <c-d> <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <silent> <c-d> <cmd>LspTroubleToggle<CR>
nnoremap <silent> <leader>a <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>

" Fixers (black, prettier, goimports)
augroup FormatAutogroup
    autocmd!
    autocmd BufWritePre *.py execute ':Black'
    autocmd BufWritePre *.ts,*.js,*.scss,*.css execute ':Prettier'
augroup END

let g:prettier#quickfix_enabled = 0
let g:go_fmt_command = "goimports"

" Buffer navigation
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
