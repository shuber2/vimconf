#!/bin/sh

set -e

check_vim()
{
    if /usr/bin/vim --version | grep -q "$1"; then
        echo "vim has support for $1."
    else
        echo "vim has no support for $1. Aborting."
        exit
    fi
}

check_py3()
{
    if python3 -c "import $1" 2>/dev/null; then
        echo "Python3 module '$1' exists."
    else
        echo "Python3 module '$1' missing. Aborting."
        exit
    fi
}

check_prog()
{
    if which "$1" > /dev/null; then
        echo "$1 found"
    else
        echo "$1 not found. Aborting."
        exit
    fi
}

check_requirements()
{
    check_vim +python3
    check_prog aspell
    check_py3 neovim
}

backup() {
    if [ -e $1 ]; then
        echo "  Move $1"
        mv $1 $2/
    fi
}

install() {
    BACKUPDIR=$(mktemp -d "$HOME/.vim-old-XXXXXXXX")
    echo "Move old vim files to $BACKUPDIR"
    backup $HOME/.viminfo $BACKUPDIR
    backup $HOME/.vimrc $BACKUPDIR
    backup $HOME/.gvimrc $BACKUPDIR
    backup $HOME/.config/nvim $BACKUPDIR

    echo ""
    echo "Installing files..."
    echo "# Empty" > $HOME/.viminfo
    ln -s $HOME/.vim/init.vim $HOME/.vimrc
    ln -s $HOME/.vim/gvimrc $HOME/.gvimrc
    ln -s $HOME/.vim $HOME/.config/nvim

    echo ""
    echo "vim-startify may complain about invalid viminfo file. It will"
    echo "disappear once you opened the first file."
    echo ""
    echo "Add this line to your shell configuration, e.g., ~/.profile, to"
    echo "use vim as man pager:"
    echo "  export MANPAGER=\"view -c MANPAGER -\""
}


check_requirements
install
