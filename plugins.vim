function! Cond(cond, ...)
    let opts = get(a:000, 0, {})
    return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

Plug 'mhinz/vim-startify'

Plug 'vim-airline/vim-airline'
Plug 'gruvbox-community/gruvbox'

Plug 'benknoble/vim-auto-origami'
" Prevent slow foling update, e.g., for vimtex
Plug 'Konfekt/FastFold'

Plug 'scrooloose/nerdcommenter'

Plug 'joom/latex-unicoder.vim', {'on': '<Plug>Unicoder'}

Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'ryanoasis/vim-devicons', Cond(g:enable_plugin_devicons)

Plug 'Konfekt/vim-DetectSpellLang', {'do': 'spell'}
Plug 'roryokane/detectindent'

" This plugin cannot be conditionally loaded, see github issue #18
Plug 'derekwyatt/vim-fswitch' ", {'for': ['c', 'cpp', 'objc']}

Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'

Plug 'thinca/vim-fontzoom'

Plug 'vim-scripts/loremipsum', {'on': 'Loremipsum'}

Plug 'lambdalisue/vim-manpager', {'on': 'MANPAGER'}

Plug 'https://gitlab.com/dbeniamine/vim-mail'

Plug 'dstein64/vim-startuptime'

" Make . more useful after a plugin map
Plug 'tpope/vim-repeat'

Plug 'flwyd/vim-conjoin'

if $USER != "root"
    source ~/.vim/plugins-noroot.vim
endif

if filereadable($HOME . '/.vim/plugins-local.vim')
    source ~/.vim/plugins-local.vim
endif
