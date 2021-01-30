#!/bin/sh

set -eu

GDBBIN="gdb"
GDBARGS=""
WITH_DASHBOARD=0

# If gdb-dashboard is installed, use it
if command -v gdb-dashboard &> /dev/null; then
    GDBBIN="gdb-dashboard"
    WITH_DASHBOARD=1
fi

# Check if gdbinit ships gdb-dashboard
if [ -e ~/.gdbinit ] && grep -q dashboard ~/.gdbinit; then
    WITH_DASHBOARD=1
fi

# If we use dashboard then pass corresponding gdbinit file
if [ "${WITH_DASHBOARD}" = "1" ]; then
    GDBARGS="${GDBARGS} -x ~/.vim/gdbinit-dashboard"
fi

exec ${GDBBIN} ${GDBARGS} "$@"
