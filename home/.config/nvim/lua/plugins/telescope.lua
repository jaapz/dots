require('telescope').setup{
  defaults = {
    prompt_prefix = "> ",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "vertical",
    layout_config = {
      vertical = {
        --preview_height = 30,
        mirror = true,
      },
    },
    use_less = false,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
  }
}
