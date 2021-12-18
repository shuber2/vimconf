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

" Prevent slow foling update, e.g., for vimtex
Plug 'Konfekt/FastFold'
Plug 'lervag/vimtex', {'for': 'tex'}

Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'gko/vim-coloresque'

Plug 'vimwiki/vimwiki'
Plug 'jceb/vim-orgmode', {'for': ['org']}

Plug 'cakebaker/scss-syntax.vim', {'for': 'scss'}
Plug 'hail2u/vim-css3-syntax', {'for': ['scss', 'css']}

Plug 'https://gitlab.com/dbeniamine/vim-mail'
Plug 'Konfekt/vim-DetectSpellLang', {'do': 'spell'}

Plug 'ryanoasis/vim-devicons', Cond(g:enable_plugin_devicons)
Plug 'joom/latex-unicoder.vim', {'on': '<Plug>Unicoder'}

Plug 'sjl/splice.vim', {'on': 'SpliceInit'}

" Costs a second startup time
Plug 'dbeniamine/cheat.sh-vim', {'on': 'Cheat'}

if has('nvim-0.5')
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-refactor', {'do': ':TSUpdate'}
else
    Plug 'sheerun/vim-polyglot'
endif
