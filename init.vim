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

" Use filetype.lua and do not use filetype.vim for >=neovim-0.7.2
" Attention: Requires migration of ftdetect/ scripts
" let g:do_filetype_lua = 1
" let g:did_load_filetypes = 0

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
" set wildmode=longest,list:full
" set wildmode=list:full
set wildoptions=pum
set showcmd

set tabpagemax=100

if has('nvim-0.7')
  set laststatus=3
endif

syntax on

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


" termdebug split windows
let g:termdebug_wide = 1
let termdebugger = $HOME . '/.vim/gdb.sh'


if filereadable($HOME . '/.vim/init-local.vim')
  source ~/.vim/init-local.vim
endif
