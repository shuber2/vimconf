syn spell notoplevel
syn match Constant "^\(\d\+-\d\+-\d\+\s\+\)\?\d\d:\d\d\(:\d\d\)\?"
syn match Type "\t\S\+\t"
syn region Comment start="\t--\t" end="$"
syn region Comment start="\tℹ\t" end="$"
syn region DiffAdded start="	▬▬▶	" end="$"
syn region DiffRemoved start="	◀▬▬	" end="$"
