# A modular vim configuration

This is my personal vim configuration that is partly inspired by SpaceVim. It
is compatible to vim, gvim (8.0+) and neovim (0.2+). The configuration is split
up into multiple files such that personal customization is separated from
boilerplate code.


## Installation

### Requirements

The install script that is shipped with this configuration also checks
for the following requirements:

  - python3 support for vim/gvim
  - neovim python3 module
  - aspell

Under a Debian-like Linux system you can install these by the following commands

````
sudo apt-get install aspell aspell-de python3-pip
pip3 install neovim
````

### Clone & install

If you already have a vim configuration in place then you may first move your
~/.vim directory first

````
mv ~/.vim ~/.vim-old
````

Assumung that there is ~/.vim anymore, simply clone this repository into ~/.vim
and invoke install.sh therein.

````
git clone https://git.sthu.org/repos/vimconf.git ~/.vim
~/.vim/install.sh
````

This install script creates backups of existing configuration files (e.g.,
~/.vimrc) and then creates symlinks to configuration files in ~/.vim.


## Specialization for local machines

I personally would like to have the same vim configuration on all my accounts.
Still, on certain machines I would like to personalize and specialize the
configuration. The following files are read if existent:

  - plugins-local.vim
  - macros-local.vim
  - keymaps-local.vim
  - init-local.vim

Example files are shipped with the repository.


## Terminal color settings

For consistent background colors you may change the background colors of your
terminal program to the gruvbox black #1c1c1c. Otherwise regions of your
terminal may appear in a saturated black (#000) rather than the gruvbox black.
