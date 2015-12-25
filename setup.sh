#!/bin/bash

# Install the core of my toolset.
sudo apt-get install --force-yes -y  git-core mercurial python-virtualenv \
                                     python-pip zsh tmux conky vim-nox i3 feh \
                                     silversearcher-ag

# Install homeshick
git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
source $HOME/.homesick/repos/homeshick/homeshick.sh

homeshick clone jaapz/dots
homeshick clone jaapz/virtualen-tools
homeshick clone jaapz/zsh-scripts
homeshick clone robbyrussell/oh-my-zsh
homeshick symlink

vim +VundleInstall +qall

echo ">> Provide your password to change shell to zsh."
chsh -s /usr/bin/zsh
echo ">> Done!"
