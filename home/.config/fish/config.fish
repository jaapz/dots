# Make sure to install fisher and some plugins:
#
# curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
# fisher install jorgebucaran/nvm.fish 
# fisher install usami-k/fish-homeshick
# 
# Also install starship, zoxide and fzf:
# pacman -Ss starship zoxide fzf

if status is-interactive
    set fish_greeting

    alias docker="sudo /usr/bin/docker"
    alias nvim='uv run nvim'

    starship init fish | source
    zoxide init fish | source
    fzf --fish | source
end
