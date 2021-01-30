#!/bin/sh

GDBARGS=""

if [ -e ~/.gdbinit ] && grep -q dashboard ~/.gdbinit; then
    GDBARGS="${GDBARGS} -x ~/.vim/gdbinit-dashboard"
fi

exec gdb ${GDBARGS} "$@"
