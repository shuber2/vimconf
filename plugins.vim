function! Cond(cond, ...)
    let opts = get(a:000, 0, {})
    return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

Plug 'mhinz/vim-startify'
Plug 'dstein64/vim-startuptime'

Plug 'vim-airline/vim-airline'
Plug 'gruvbox-community/gruvbox'

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

if $USER != "root"
    source ~/.vim/plugins-noroot.vim
endif

if filereadable($HOME . '/.vim/plugins-local.vim')
    source ~/.vim/plugins-local.vim
endif
