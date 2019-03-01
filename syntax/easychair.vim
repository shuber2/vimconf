" Vim syntax file
" Language:         Easychair conference system review form
" Maintainer:       Stefan Huber
"
"
" Changelog:
"   2010-12-12: Initial version



" Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif



syn region ascComment start="---" end="$"
syn region ascSystem start="\*\*\*" end="$"


hi def link ascComment Comment
hi def link ascSystem Identifier


