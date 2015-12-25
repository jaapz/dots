Jaapz's Dotfiles
================

I used to manually manage my dotfiles in a git repo with several branches. This
became a big ugly mess of merges everywhere, so I decided to switch to a
dotfile manager. I now use homeshick to manage the dotfiles in this repo, and I
hope this won't end up as a huge mess.

How to install
--------------

Run the setup.sh file like this:

    $ curl -s https://raw.githubusercontent.com/jaapz/dots/master/setup.sh | bash

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
 * zsh

Unison setup
------------

To set up unison for syncing files across your computers, run
`backup/setup.sh`.
