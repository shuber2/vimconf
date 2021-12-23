Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}

" Conditional loading does not work, see github issue #823
Plug 'ludovicchabant/vim-gutentags'
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


function PluginsNorootConfig()
    let g:localvimrc_persistent = 1

    let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

    "augroup pencil
      "au!
      "au FileType markdown,mkd call pencil#init()
      "au FileType text         call pencil#init()
      "au FileType mail         call pencil#init()
      "au FileType tex          call pencil#init()
    "augroup END

    let g:vim_markdown_frontmatter=1
    let g:vim_markdown_math=1

    au FileType markdown call RagtagInit()

    " Generally disable gutentags, but enable for some filetypes
    let g:gutentags_enabled = 0
    au FileType c,cpp,objc,tex let g:gutentags_enabled = 1
    " Make manually created tags files also root markers
    let g:gutentags_project_root = ['tags']
    let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
    " Do not automatically generate on browsing
    let g:gutentags_generate_on_missing = 0
endfunction
