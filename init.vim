" My personal vim, nvim, gvim configuration
" Author: Stefan Huber <shuber@sthu.org>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some global settings

set nocompatible
set termguicolors
set number
set cursorline
set scrolloff=5

set encoding=utf-8

set listchars=tab:»­,trail:·,eol:$
set virtualedit=block

filetype plugin indent on

set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

set autoindent
set smartindent

set incsearch
set hlsearch

set colorcolumn=+1
set mouse=a
set wildmode=longest,list:full

set tabpagemax=100

if has('nvim')
    set guicursor=
end

syntax on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some global plugin settings

" Disable devicons on linux terminal
if !has("terminfo") || &term == 'linux'
    let g:enable_plugin_devicons=0
" Enable loading of devicons on all others
else
    let g:enable_plugin_devicons=1
endif

runtime plugsetup.vim

" Some preferences for indent detection
let g:detectindent_min_indent = 2
let g:detectindent_preferred_indent = 4

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

" Speedup deoplete startup time, see deoplete FAQ
let g:python3_host_prog = '/usr/bin/python3'
" deoplete requires huge startuptime. Delay loading upon first InsertEnter.
let g:deoplete#enable_at_startup = 0
let g:deoplete#enable_smart_case = 1
autocmd InsertEnter * call deoplete#enable()

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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some filetype settings

" mutt and neomutt
au BufRead,BufNewFile ~/.mutt/tmp/*mutt-* set filetype=mail
au BufRead,BufNewFile *.muttrc set filetype=muttrc

au BufRead,BufNewFile *.cls set filetype=tex


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some filetype-specific settings

au FileType text,markdown,mail,tex,gitcommit,mediawiki,vimwiki setlocal spell
au FileType text,markdown,mail,gitcommit,mediawiki,vimwiki set fo+=n

au Filetype go set shiftwidth=8 tabstop=8 noexpandtab
au Filetype tex set shiftwidth=2 tabstop=2

au FileType mediawiki setlocal wrap linebreak tw=0

"git scissor line
au Filetype mail syn match Statement /^\s*-*\s*>8\s*-*\s*$/
au Filetype mail syn match Statement /^\s*-*\s*8<\s*-*\s*$/

" Line wrap crippled with numbers shown
au Filetype man set nonumber

" Java completion
au FileType java setlocal omnifunc=javacomplete#Complete
au FileType java JCEnable
" See https://github.com/artur-shaik/vim-Javacomplete2
" <C-j>ji <leader>ji
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
" <C-j>ii <leader>jii
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)
" <C-j>I <leader>jI
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
" <C-j>R <leader>jR
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)

" Minimum indenting for source code
au FileType java,cpp,c,cs let g:detectindent_min_indent = 4

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some plugin-specific settings

au FileType markdown call RagtagInit()

let g:detectspelllang_langs = {}
let g:detectspelllang_langs.aspell =[ 'en_US', 'de_AT']
"au BufReadPost * :DetectIndent

au BufEnter *.c* let b:fswitchlocs='reg:/lib/include/,rel:.'
au BufEnter *.h* let b:fswitchlocs='reg:/include/lib/,rel:.'

au BufEnter *.cpp,*.cc,*.cxx let b:fswitchdst='h,hxx,hpp,hh'
au BufEnter *.h,*.hh,*.hxx let b:fswitchdst='cc,c,cxx,cpp'

:let g:org_todo_keywords = [['TODO(t)', 'WAITING(w)', '|', 'DONE(d)'],
      \ ['|', 'OBSOLETE(o)', 'WONT(n)'],
      \ ['CANCELED(c)']]

let g:vimwiki_list = [{'path': '~/.vimwiki/',
      \ 'template_path': '~/.vim/vimwiki/templates',
      \ 'template_default': 'default',
      \ 'template_ext': '.html'}]


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

runtime macros.vim
runtime keymaps.vim

if filereadable($HOME . '/.vim/init-local.vim')
  source ~/.vim/init-local.vim
endif
