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
    Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}

    Plug 'ludovicchabant/vim-gutentags', {'for': ['c', 'cpp', 'objc']}
    "Plug 'vim-scripts/Conque-GDB', {'for': ['c', 'cpp', 'objc']}

    Plug 'editorconfig/editorconfig-vim'
    Plug 'embear/vim-localvimrc'

    Plug 'airblade/vim-rooter'
    Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}

    Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
    Plug 'lvht/tagbar-markdown', {'for': 'markdown'}
    Plug 'habamax/vim-asciidoctor', {'for': 'asciidoc'}

    Plug 'PProvost/vim-markdown-jekyll', {'for': 'markdown'}
    Plug 'tpope/vim-liquid', {'for': ['liquid', 'html', 'xml', 'markdown']}

    Plug 'tpope/vim-ragtag'

    Plug 'Shougo/neosnippet.vim'
    Plug 'Shougo/neosnippet-snippets'

    Plug 'tpope/vim-speeddating'
    Plug 'mattn/calendar-vim'

    " Costs a second startup time
    Plug 'dbeniamine/cheat.sh-vim', {'on': 'Cheat'}

    if g:lowendbox == 0

        if has('nvim')
            Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
            Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
        else
            Plug 'Shougo/deoplete.nvim'
            Plug 'Shougo/denite.nvim'

            Plug 'roxma/nvim-yarp'
            Plug 'roxma/vim-hug-neovim-rpc'
        endif

        " java extension to deoplete
        Plug 'artur-shaik/vim-javacomplete2', {'for': 'java'}

        Plug 'neomake/neomake'

        Plug 'lervag/vimtex', {'for': 'tex'}

        Plug 'mhinz/vim-signify'
        Plug 'tpope/vim-fugitive'
        Plug 'gko/vim-coloresque'

        Plug 'vimwiki/vimwiki'
        Plug 'jceb/vim-orgmode', {'for': ['org']}

        Plug 'cakebaker/scss-syntax.vim', {'for': 'scss'}
        Plug 'hail2u/vim-css3-syntax', {'for': ['scss', 'css']}

        Plug 'sjl/splice.vim', {'on': 'SpliceInit'}

        if has('nvim-0.5')
            Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
            Plug 'nvim-treesitter/nvim-treesitter-refactor', {'do': ':TSUpdate'}
        else
            Plug 'sheerun/vim-polyglot'
        endif
    endif
endif

if filereadable($HOME . '/.vim/plugins-local.vim')
    source ~/.vim/plugins-local.vim
endif
