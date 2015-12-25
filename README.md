Jaapz's Dotfiles
================

I used to manually manage my dotfiles in a git repo with several branches. This
became a big ugly mess of merges everywhere, so I decided to switch to a
dotfile manager. I now use homeshick to manage the dotfiles in this repo, and I
hope this won't end up as a huge mess.

How to install
--------------

Install homeshick, and add a few repo's:

    homeshick clone jaapz/dots
    homeshick clone jaapz/virtualen-tools
    homeshick clone jaapz/zsh-scripts
    homeshick clone robbyrussell/oh-my-zsh

Then symlink stuff to the home dir:

    homeshick symlink

Refer to the homeshick docs to see how new files should be added, and how files
should be changed.

Included
--------

This repository contains my configurations for these tools:

 * vimperator
 * conky
 * i3
 * tmux
 * vim
