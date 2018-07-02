# A modular vim configuration

This is my personal vim configuration that is partly inspired by SpaceVim. It
is compatible to neovim and (g)vim (version 8 or higher). The configuration is
split up into multiple files such that personal customization is separated from
boilerplate code.


## Installation

Simply clone this repository into ~/.vim and invoke install.sh therein. The
install script just creates symlinks to vim/gvim/neovim configuration files and
directories.

````
git clone https://git.sthu.org/repos/vimconf.git ~/.vim
~/.vim/install.sh
````

The install file also checks requirements for the configuration and the plugins
added:

  - python3 support for vim/gvim
  - neovim python3 module
  - aspell


## Specialization for local machines

I personally would like to have the same vim configuration on all my accounts.
Still, on certain machines I would like to personalize and specialize the
configuration. The following files are read if existent:

  - plugins-local.vim
  - macros-local.vim
  - keymaps-local.vim
  - init-local.vim

For all four example files are shipped with the repository.
