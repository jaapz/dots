" Jaapz's vim config.
filetype off

" Disable deprecation warnings
lua <<EOF
vim.deprecate = function() end
EOF

" Plug setup
call plug#begin('~/.config/nvim/plugged')

" LSP (+ linting)
Plug 'neovim/nvim-lspconfig'
Plug 'nvimtools/none-ls.nvim'
Plug 'nvimtools/none-ls-extras.nvim'

" Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Highlighting & syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " highlighting
Plug 'mustache/vim-mustache-handlebars'
Plug 'sainnhe/sonokai'

" Project and file management
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'

" Code editing
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'windwp/nvim-ts-autotag'
Plug 'windwp/nvim-autopairs'
Plug 'kylechui/nvim-surround'

" Nicer statusline
Plug 'NTBBloodbath/galaxyline.nvim'

" Sticky header
Plug 'nvim-treesitter/nvim-treesitter-context'

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
require 'plugins.gitsigns'
require 'plugins.cmp'

require('nvim-ts-autotag').setup({})
require('nvim-autopairs').setup({})
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
set mouse= " Disable mouse integration

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
set textwidth=88
set colorcolumn=88,120

" Allow more sane backspace behaviour
set backspace=indent,eol,start

" Enable colorscheme and 256 colors
set background=dark
colorscheme sonokai
set t_Co=256
set termguicolors

" Statusline config
set noshowmode

" Use rg!
set grepprg=rg

" Telescope
nnoremap <silent> <C-p> <cmd>Telescope find_files theme=ivy<CR>
nnoremap <silent> <C-o> <cmd>Telescope live_grep theme=ivy<CR>
nnoremap <silent> <C-/> <cmd>Telescope current_buffer_fuzzy_find theme=ivy<CR>
nnoremap <silent> <C-b> <cmd>Telescope buffers theme=ivy<CR>

" nvim-lsp & nvim-cmp
set signcolumn=number
set completeopt=menu,menuone,noselect
set shortmess+=c
set updatetime=300

nnoremap <silent> gd <cmd>Telescope lsp_definitions theme=ivy<CR>
nnoremap <silent> gy <cmd>Telescope lsp_type_definitions theme=ivy<CR>
nnoremap <silent> gi <cmd>Telescope lsp_implementations<CR>
nnoremap <silent> gr <cmd>Telescope lsp_references theme=ivy<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>k <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <c-d> <cmd>lua vim.diagnostic.open_float()<CR>
nnoremap <silent> <c-f> <cmd>lua vim.diagnostic.setqflist()<CR>
nnoremap <silent> <leader>a <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>

" Automatically organize imports in go files using gopls.
lua <<EOF
    function org_imports(wait_ms)
      local params = vim.lsp.util.make_range_params()
      params.context = {only = {"source.organizeImports"}}
      local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
      for _, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
          if r.edit then
            vim.lsp.util.apply_workspace_edit(r.edit)
          else
            vim.lsp.buf.execute_command(r.command)
          end
        end
      end
  end
EOF

" Format and lint on save
augroup FormatAugroup
	autocmd!
    autocmd BufWritePre * lua vim.lsp.buf.format()
    autocmd BufWritePre *.go :silent! lua org_imports(3000)
augroup END

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
