Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}

" Disable conditional loading to have gutentags also for tex files
Plug 'ludovicchabant/vim-gutentags' ", {'for': ['c', 'cpp', 'objc', 'tex']}
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

Plug 'vim-scripts/loremipsum', {'on': 'Loremipsum'}

if g:lowendbox == 0
    source ~/.vim/plugins-noroot-nolowendbox.vim
endif
