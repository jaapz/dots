local parsers = {
  'go', 'gomod', 'gosum',
  'python',
  'typescript', 'javascript',
  'css', 'scss',
  'markdown',
  'html',
  'vim', 'vimdoc',
  'yaml', 'toml', 'json',
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = vim.list_extend(vim.deepcopy(parsers), {
    'typescriptreact',
  }),
  callback = function()
    -- Enable ts folds
    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo[0][0].foldmethod = 'expr'

    -- Use ts as indent engine
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

    -- Make sure typescript language is used for tsx files
    vim.treesitter.language.register('typescript', 'typescriptreact')
    vim.treesitter.language.register('javascript', 'javascriptreact')

    vim.treesitter.start() 
  end,
})

require'treesitter-context'.setup{
  enable=true,
}

require('nvim-treesitter').install(filetypes):wait(300000) -- wait max. 5 minutes
