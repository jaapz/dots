require('telescope').setup{
  defaults = {
    prompt_prefix = "> ",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "vertical",
    results_height = 10,
    layout_defaults = {
      vertical = {
        preview_height = 0.5,
        mirror = true,
      },
    },
    use_less = false,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
  }
}
