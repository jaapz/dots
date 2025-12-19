local filetypes = {
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
  pattern = filetypes,
  callback = function()
    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo[0][0].foldmethod = 'expr'

    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

    vim.treesitter.start() 
  end,
})

require'treesitter-context'.setup{
  enable=true,
}

require('nvim-treesitter').install(filetypes):wait(300000) -- wait max. 5 minutes
