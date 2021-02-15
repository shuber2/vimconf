syn spell notoplevel
syn match Constant "^\(\d\+-\d\+-\d\+\s\+\)\?\d\d:\d\d\(:\d\d\)\?"
syn match Type "  \* [-a-zA-Z0-9_|]*"
syn match Label "<[ @~&+][-a-zA-Z0-9_|]*>"
syn region Title start="^---" end="$"
syn region Identifier start="-!-" end="$"
syn region Comment start=":::" end="$"
