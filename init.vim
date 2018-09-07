" My personal vim, nvim, gvim configuration
" Author: Stefan Huber <shuber@sthu.org>

set nocompatible
set termguicolors
set number
set cursorline
set scrolloff=5


set encoding=utf-8

set listchars=tab:»­,trail:·,eol:$
set virtualedit=block

set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

set incsearch
set hlsearch

set colorcolumn=+1
set mouse=a
set wildmode=longest,list:full

if has('nvim')
    set guicursor=
end

syntax on
filetype plugin indent on
runtime plugsetup.vim

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#branch#enabled=1

let g:gruvbox_contrast_light='hard'
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic = 1
set bg=dark
colorscheme gruvbox

" let NERDTreeWinPos="right"
let NERDTreeHijackNetrw=0
let NERDTreeWinSize=22
let NERDTreeQuitOnOpen=1
"au VimEnter * if !argc() | Startify | NERDTree | wincmd w

let g:neomake_c_enabled_makers = ['clangtidy', 'clangcheck']
let g:neomake_cpp_enabled_makers = ['clangtidy', 'clangcheck']

call neomake#configure#automake('w')
"let g:neomake_logfile = '/tmp/neomake.log'

let g:clang_compilation_database = '.'

let g:deoplete#enable_at_startup=1

"augroup pencil
  "au!
  "au FileType markdown,mkd call pencil#init()
  "au FileType text         call pencil#init()
  "au FileType mail         call pencil#init()
  "au FileType tex          call pencil#init()
"augroup END

let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_math=1

let g:guesslang_langs=[ 'en_US', 'de_AT']
au FileType text,markdown,mail,tex,gitcommit setlocal spell
au BufReadPost * :DetectIndent

au BufEnter *.c* let b:fswitchlocs='reg:/lib/include/,rel:.'
au BufEnter *.h* let b:fswitchlocs='reg:/include/lib/,rel:.'

au BufEnter *.cpp,*.cc,*.cxx let b:fswitchdst='h,hxx,hpp,hh'
au BufEnter *.h,*.hh,*.hxx let b:fswitchdst='cc,c,cxx,cpp'


"git scissor line
au Filetype mail syn match Statement /^\s*-*\s*>8\s*-*\s*$/
au Filetype mail syn match Statement /^\s*-*\s*8<\s*-*\s*$/

"mutt and neomutt
au BufRead,BufNewFile ~/.mutt/tmp/*mutt-* set filetype=mail
au BufRead,BufNewFile *.muttrc set filetype=muttrc

" Some settings for tex files
au BufRead,BufNewFile *.cls set filetype=tex
au Filetype tex set shiftwidth=2

au BufRead,BufNewFile *.plt set filetype=gnuplot

:let g:org_todo_keywords = [['TODO(t)', 'WAITING(w)', '|', 'DONE(d)'],
      \ ['|', 'OBSOLETE(o)', 'WONT(n)'],
      \ ['CANCELED(c)']]

" Trailing whitespace
highlight default link TrailingWhitespace SpellCap
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile * syn match TrailingWhitespace /\s\+$/ containedin=ALL

runtime macros.vim
runtime keymaps.vim

if filereadable($HOME . '/.vim/init-local.vim')
  source ~/.vim/init-local.vim
endif
