# Jaapz's Dotfiles

These are my dotfiles.

I'm currently using fish with starship as my shell and neovim as my editor. On my laptop
I run wayland with sway, and on my work and home computers I am currently still running
X and i3.

## nvim

For neovim to work correctly with all plugins, on first install run `:PlugInstall`.

For the LSP's and other integrations to work, make sure the following tools are installed:

- `ty` - add it to your virtualenv using uv, or use `uv tool` (`uv tool install ty@latest`)
- `ruff` - add it to your virtualenv via uv, or use `uv tool` (`uv tool install ruff@latest`)
- `flake8` - add it to your virtualenv via uv, or use `uv tool` (`uv tool install flake8@latest`)
- `gopls` - should be installed with package manager
- `golangci_lint` - should be installed in the `.tools` dir of your project
- `ts_ls` - install globally using npm: `npm install -g typescript typescript-language-server`
- `eslint_d` - install globally using npm: `npm install -g eslint_d`
- `stylelint` - install globally using npm: `npm install -g stylelint`
- `prettier` - install globally using npm: `npm install -g prettier`

Highlighting is (mainly) done by tree-sitter, install it using via package manager:

`sudo pacman -S tree-sitter tree-sitter-cli`
