syn region jsonComment start="/\*" end="\*/"
syn region jsonComment start="//" end="$"
hi link jsonCommentError Comment
hi link jsonComment Comment
