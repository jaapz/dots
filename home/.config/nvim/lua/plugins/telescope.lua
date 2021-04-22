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
