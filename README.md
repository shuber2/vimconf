# A modular vim configuration


<div class="hideonwebsite">
This repository is a replication of the repository <a
href="https://git.sthu.org/?p=vimconf.git;a=summary">here</a>. The <a
href="https://www.sthu.org/code/codesnippets/vimconf.html">website</a> gives
further details and more screenshots.
</div>


This is my personal vim configuration. The [git
repo](https://git.sthu.org/?p=vimconf.git;a=summary) of this configuration is
under constant flux, however, it should be compatible with (g)vim (8.0+) and
neovim (0.2+), yet some features are only available with newer versions.

![A demo screenshot](https://www.sthu.org/code/codesnippets/img/vimconf-startify.png)


## Flavors on different machines

I would like to use this configuration on a large variety of machines with
different needs. To accommodate for this, the configuration is split up into
multiple files and a different set of plugins is used:

- In any case, the plugin set in `plugins-mini.vim` is loaded.
- Furthermore, `plugins-midi.vim`, `plugins-full.vim` and `plugins-local.vim`
  are loaded if present. They are provided as `plugins-xxx.vim.example` and you
  can create a symlink `plugins-xxx.vim` to have them loaded. (In case of
  `plugins-local.vim` you will probably provide a machine-dedicated version
  rather than symlinking the example file.)

Similar to `plugins-local.vim`, also the following files are sourced if
existent:

  - `macros-local.vim`
  - `keymaps-local.vim`
  - `init-local.vim`

Example files are shipped with the repository.

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


## Terminal color settings

For consistent background colors you may change the background colors of your
terminal program to the gruvbox black #1c1c1c. Otherwise regions of your
terminal may appear in a saturated black (#000) rather than the gruvbox black.
