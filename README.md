.dotfiles
=========

## Setup

Install a few dependencies, as appropriate:

    sudo apt install git stow vim zsh

Clone this repository in the following way:

    cd $HOME
    git clone --recurse-submodules -j8 git://github.com/swook/.dotfiles.git

Enter the repository root and create the appropriate symbolic links:

    cd $HOME/.dotfiles
    stow vim  # to symlink VIM settings
    stow zsh  # to symlink ZSH settings
