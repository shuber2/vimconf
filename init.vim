" My personal vim, nvim, gvim configuration
" Author: Stefan Huber <shuber@sthu.org>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some global settings

set nocompatible
set number
set cursorline
set scrolloff=5

set encoding=utf-8

set fillchars=vert:│,fold:\ 
set listchars=tab:»­,trail:·,eol:$
set virtualedit=block

" use filetype.lua and do not use filetype.vim for >=neovim-0.7.2
let g:do_filetype_lua = 1
let g:did_load_filetypes = 0
filetype plugin indent on

set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

set autoindent
set smartindent

set incsearch
set hlsearch

set foldcolumn=4
set foldlevelstart=20

set colorcolumn=+1
set mouse=a
set wildmenu
set wildmode=longest,list:full
set showcmd

set tabpagemax=100

syntax on

if filereadable($HOME . '/.vim/lowendbox')
    let g:lowendbox = 1
else
    let g:lowendbox = 0
endif

runtime macros.vim
runtime keymaps.vim
runtime plugsetup.vim


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some filetype-specific settings

au FileType text,markdown,asciidoc,mail,gitcommit,mediawiki,vimwiki,tex setlocal spell
au FileType text,markdown,asciidoc,mail,gitcommit,mediawiki,vimwiki setlocal formatoptions+=n
au Filetype mail setlocal formatoptions+=o
" Add | for block quotation, such that gq respects it
au Filetype mail setlocal comments+=n:\|,

au Filetype go setlocal shiftwidth=8 tabstop=8 noexpandtab
au Filetype tex setlocal shiftwidth=2 tabstop=2

au FileType mediawiki setlocal wrap linebreak textwidth=0

"git scissor line
au Filetype mail syn match Statement /^\s*-*\s*>8\s*-*\s*$/
au Filetype mail syn match Statement /^\s*-*\s*8<\s*-*\s*$/

" Line wrap crippled with numbers shown
au Filetype man setlocal nonumber

au BufNewFile *.{h,hpp,hxx} call AddIncludeGuards()

au FileType cpp,c packadd termdebug

augroup autofoldcolumn
  au!
  au CursorHold,BufWinEnter * AutoOrigamiFoldColumn
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings


" Attention: Must be run after plugsetup.vim
" Trailing whitespace
highlight default link BadWhitespace SpellCap

" Setup BadWhitespace syntax match expressions.
function SetBadWhitespaceSyntax()
  " Do not expose bad whitespace in help buffers or for man pages. Or, more
  " generally, if we open the file readonly.
  "if &ft != "help" && &ft != "man"
  if !&readonly
    " Make trailing whitespace be flagged as bad.
    syn match BadWhitespace /\s\+$/ containedin=ALL
    " Make space before tab be flagged as bad and vice versa
    syn match BadWhitespace / \+\t/ containedin=ALL
    syn match BadWhitespace /\t \+/ containedin=ALL
  endif
endfunction

" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile * call SetBadWhitespaceSyntax()

" termdebug split windows
let g:termdebug_wide = 1
let termdebugger = $HOME . '/.vim/gdb.sh'


if filereadable($HOME . '/.vim/init-local.vim')
  source ~/.vim/init-local.vim
endif
