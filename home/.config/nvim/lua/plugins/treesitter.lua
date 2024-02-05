require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
  },
  indent = {
    enable = false,
  }
}

require'treesitter-context'.setup{
  enable=true,
}
