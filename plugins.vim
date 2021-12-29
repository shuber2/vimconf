function! Cond(cond, ...)
    let opts = get(a:000, 0, {})
    return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

Plug 'mhinz/vim-startify'
Plug 'dstein64/vim-startuptime'

Plug 'vim-airline/vim-airline'
Plug 'gruvbox-community/gruvbox'
Plug 'liuchengxu/vim-which-key'

Plug 'benknoble/vim-auto-origami'

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

Plug 'roryokane/detectindent'

" This plugin cannot be conditionally loaded, see github issue #18
Plug 'derekwyatt/vim-fswitch' ", {'for': ['c', 'cpp', 'objc']}

Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'

Plug 'thinca/vim-fontzoom'

Plug 'lambdalisue/vim-manpager', {'on': 'MANPAGER'}

" Make . more useful after a plugin map
Plug 'tpope/vim-repeat'
Plug 'flwyd/vim-conjoin'


function PluginsConfig()

    " Some preferences for indent detection
    let g:detectindent_min_indent = 2
    let g:detectindent_max_indent = 4
    let g:detectindent_preferred_indent = 4

    " Minimum indenting for source code
    au FileType c,cpp,objc,java,cs let g:detectindent_min_indent = 4
    " Consider using localvimrc config file or editorconfig instead
    "au BufReadPost *.java :DetectIndent

    let g:airline_powerline_fonts=1
    let g:airline#extensions#tabline#enabled=1
    let g:airline#extensions#branch#enabled=1

    let g:gruvbox_contrast_light='hard'
    let g:gruvbox_contrast_dark='hard'
    set bg=dark

    if &term =~ 'linux'
        let g:gruvbox_termcolors=16
    else
        " Setting termguicolors has two implications:
        " - Breaks colors for some versions of mosh, but not if tmux is used on top of
        "   mosh. See https://github.com/mobile-shell/mosh/issues/928
        set termguicolors
        let g:gruvbox_italic = 1
    endif
    colorscheme gruvbox

    " let NERDTreeWinPos="right"
    let NERDTreeHijackNetrw=0
    let NERDTreeWinSize=22
    let NERDTreeQuitOnOpen=1
    "au VimEnter * if !argc() | Startify | NERDTree | wincmd w

    let g:startify_files_number = 5
    let g:startify_session_persistence = 1
    let g:startify_lists = [
                \ { 'type': 'dir',       'header': ['   Recent files'] },
                \ { 'type': 'sessions',  'header': ['   Saved sessions'] },
                \ ]

    if has('nvim')
        let verstr = matchstr(execute('version'), 'NVIM v\zs[^\n]*')
        let g:startify_custom_header = [
                    \ '',
                    \ '        ╻ ╻   ╻   ┏┳┓',
                    \ '   NEO  ┃┏┛   ┃   ┃┃┃',
                    \ '        ┗┛    ╹   ╹ ╹  ' . verstr,
                    \ '',
                    \ ]
    else
        let verstr = matchstr(execute('version'), 'IMproved \zs[^\n ]*')
        let g:startify_custom_header = [
                    \ '',
                    \ '   ╻ ╻   ╻   ┏┳┓',
                    \ '   ┃┏┛   ┃   ┃┃┃',
                    \ '   ┗┛    ╹   ╹ ╹  ' . verstr,
                    \ '',
                    \ ]
    endif

    au BufEnter *.c* let b:fswitchlocs='reg:/lib/include/,rel:.'
    au BufEnter *.h* let b:fswitchlocs='reg:/include/lib/,rel:.'
    au BufEnter *.cpp,*.cc,*.cxx let b:fswitchdst='h,hxx,hpp,hh'
    au BufEnter *.h,*.hh,*.hxx let b:fswitchdst='cc,c,cxx,cpp'

    let g:mapleader = "\<Space>"
    let g:maplocalleader = ','
    nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
    nnoremap <silent> <localleader> :<c-u>WhichKey ','<CR>
    vnoremap <silent> <leader>      :<c-u>WhichKeyVisual '<Space>'<CR>
    vnoremap <silent> <localleader> :<c-u>WhichKeyVisual ','<CR>

    let g:which_key_map =  {}
    au VimEnter * call which_key#register('<Space>', 'g:which_key_map')
    let g:which_key_map.b = {
      \ 'name': '+buffer',
      \ '1':    ['b1',        'buffer 1'],
      \ '2':    ['b2',        'buffer 2'],
      \ 'd':    ['bd',        'delete-buffer'],
      \ 'f':    ['bfirst',    'first-buffer'],
      \ 'h':    ['Startify',  'home-buffer'],
      \ 'l':    ['blast',     'last-buffer'],
      \ 'n':    ['bnext',     'next-buffer'],
      \ 'p':    ['bprevious', 'previous-buffer'],
      \ }

endfunction

