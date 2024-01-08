" Vim syntax file
" Language:         Easychair conference system review form
" Maintainer:       Stefan Huber
"
"
" Changelog:
"   2010-12-12: Initial version
"   2024-01-08: Update to new syntax

" Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

runtime! syntax/tex.vim

unlet! b:current_syntax

syn region ec2Section start="==\*==" end="$"
syn region ec2Subsection start="==+==" end="$"
syn region ec2Comment start="==-==" end="$"

hi def link ec2Comment Comment
hi def link ec2Section Directory
hi def link ec2Subsection Directory

let b:current_syntax = "easychair2"
