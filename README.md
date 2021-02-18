# A modular vim configuration

This is my personal vim configuration that is partly inspired by
[SpaceVim](https://spacevim.org/). It is compatible to vim, gvim (8.0+) and
neovim (0.2+). The configuration is split up into multiple files such that
personal customization is separated from boilerplate code.

![A demo screenshot](https://www.sthu.org/code/codesnippets/img/vimconf-start-plugin.png)


<div class="hideonwebsite">
This repository is a replication of the repository <a
href="https://git.sthu.org/?p=vimconf.git;a=summary">here</a>. The <a
href="https://www.sthu.org/code/codesnippets/vimconf.html">website</a> gives
further details and more screenshots.
</div>

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

Note that vim-tiny in Debian does not support python3, but vim-nox, vim-gtk3 or
neovim does. You also want to make sure that you have curl and git installed.

### Clone & install

If you already have a vim configuration in place then you may first move your
`~/.vim` directory first

````
mv ~/.vim ~/.vim-old
````

Assuming that there is no `~/.vim` anymore, simply clone this repository into
`~/.vim` and invoke `install.sh` therein.

````
git clone https://git.sthu.org/repos/vimconf.git ~/.vim
~/.vim/install.sh
````

This install script creates backups of existing configuration files (e.g.,
`~/.vimrc`) and then creates symlinks to configuration files in `~/.vim`.


## Specialization for local machines

I personally would like to have the same vim configuration on all my user
accounts. Still, on certain machines I would like to personalize and specialize
the configuration. The following files are sourced if existent:

  - plugins-local.vim
  - macros-local.vim
  - keymaps-local.vim
  - init-local.vim

Example files are shipped with the repository.


## Terminal color settings

For consistent background colors you may change the background colors of your
terminal program to the gruvbox black #1c1c1c. Otherwise regions of your
terminal may appear in a saturated black (#000) rather than the gruvbox black.
