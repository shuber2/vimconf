function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

Plug 'mhinz/vim-startify'

Plug 'editorconfig/editorconfig-vim'
Plug 'embear/vim-localvimrc'

Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'

Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-rooter'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'scrooloose/nerdcommenter'

Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}

Plug 'ryanoasis/vim-devicons', Cond(g:enable_plugin_devicons)

Plug 'neomake/neomake'
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}

Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'lvht/tagbar-markdown', {'for': 'markdown'}

Plug 'PProvost/vim-markdown-jekyll', {'for': 'markdown'}
Plug 'tpope/vim-liquid', {'for': ['liquid', 'html', 'xml', 'markdown']}

Plug 'cakebaker/scss-syntax.vim', {'for': 'scss'}
Plug 'hail2u/vim-css3-syntax', {'for': ['scss', 'css']}
Plug 'ap/vim-css-color', {'for': ['scss', 'css']}

Plug 'tpope/vim-ragtag'

Plug 'lervag/vimtex', {'for': 'tex'}

if has('nvim')
  Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

Plug 'tpope/vim-speeddating'
Plug 'jceb/vim-orgmode', {'for': ['org']}
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'

Plug 'Konfekt/vim-DetectSpellLang', {'do': 'spell'}
Plug 'roryokane/detectindent'

Plug 'derekwyatt/vim-fswitch', {'for': ['c', 'cpp', 'objc']}
Plug 'ludovicchabant/vim-gutentags', {'for': ['c', 'cpp', 'objc']}
"Plug 'vim-scripts/Conque-GDB', {'for': ['c', 'cpp', 'objc']}

Plug 'artur-shaik/vim-javacomplete2', {'for': 'java'}

Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'

Plug 'thinca/vim-fontzoom'

Plug 'vim-scripts/loremipsum', {'on': 'Loremipsum'}

Plug 'lambdalisue/vim-manpager', {'on': 'MANPAGER'}

Plug 'dbeniamine/vim-mail'

if filereadable($HOME . '/.vim/plugins-local.vim')
  source ~/.vim/plugins-local.vim
endif
