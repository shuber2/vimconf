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
Plug 'puremourning/vimspector'

Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-clang-format'
Plug 'justmao945/vim-clang', {'for': ['c', 'cpp', 'objc']}

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

" Disable devicons on linux terminal
if $TERM == 'linux'
    let g:enable_plugin_devicons=0
    " Enable loading of devicons on all others
else
    let g:enable_plugin_devicons=1
endif

Plug 'ryanoasis/vim-devicons', Cond(g:enable_plugin_devicons)
Plug 'joom/latex-unicoder.vim'
Plug 'chrisbra/unicode.vim'

Plug 'sjl/splice.vim', {'on': 'SpliceInit'}

" Costs a second startup time
Plug 'dbeniamine/cheat.sh-vim', {'on': 'Cheat'}

Plug 'sheerun/vim-polyglot'

if has('nvim-0.5')
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-refactor', {'do': ':TSUpdate'}
endif

function PluginsNorootNolowendboxConfig()
    let g:neomake_c_enabled_makers = ['clangtidy', 'clangcheck']
    let g:neomake_cpp_enabled_makers = ['clangtidy', 'clangcheck']
    let g:clang_compilation_database = '.'

    " Taken from neomake
    if OnBattery()
        call neomake#configure#automake('w')
    else
        call neomake#configure#automake('nw', 1000)
    endif

    " Speedup deoplete startup time, see deoplete FAQ
    let g:python3_host_prog = '/usr/bin/python3'
    " deoplete requires huge startuptime. Delay loading upon first InsertEnter.
    let g:deoplete#enable_at_startup = 0
    call deoplete#custom#option({
                \ 'smart_case' : v:true,
                \ 'auto_refresh_delay' : 100,
                \ })
    au InsertEnter * call deoplete#enable()

    " The denite settings are largely stolen from spacevim
    let s:denite_options = {
                \ 'default' : {
                    \ 'winheight' : 15,
                    \ 'mode' : 'insert',
                    \ 'start_filter' : 1,
                    \ 'quit' : 1,
                    \ 'highlight_matched_char' : 'MoreMsg',
                    \ 'highlight_matched_range' : 'MoreMsg',
                    \ 'direction': 'rightbelow',
                    \ }}

    augroup spacevim_layer_denite
        autocmd!
        autocmd FileType denite call s:denite_my_settings()
    augroup END

    function! s:denite_my_settings() abort
        nnoremap <silent><buffer><expr> i
                    \ denite#do_map('open_filter_buffer')
        nnoremap <silent><buffer><expr> '
                    \ denite#do_map('toggle_select').'j'
        nnoremap <silent><buffer><expr> q
                    \ denite#do_map('quit')
        nnoremap <silent><buffer><expr> <C-t>
                    \ denite#do_map('do_action', 'tabopen')
        nnoremap <silent><buffer><expr> <C-v>
                    \ denite#do_map('do_action', 'vsplit')
        nnoremap <silent><buffer><expr> <C-s>
                    \ denite#do_map('do_action', 'split')
        nnoremap <silent><buffer><expr> <CR>
                    \ denite#do_map('do_action')
        nnoremap <silent><buffer><expr> p
                    \ denite#do_map('do_action', 'preview')
        nnoremap <silent><buffer><Tab> j
        nnoremap <silent><buffer><S-Tab> k
    endfunction

    " FIND and GREP COMMANDS
    if executable('rg')
        " Ripgrep command on grep source
        call denite#custom#var('grep', 'command', ['rg'])
        call denite#custom#var('grep', 'default_opts',
                    \ ['--vimgrep', '--no-heading'])
        call denite#custom#var('grep', 'recursive_opts', [])
        call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
        call denite#custom#var('grep', 'separator', ['--'])
        call denite#custom#var('grep', 'final_opts', [])
    endif

    let s:insert_mode_mappings = [
                \ ['jk', '<denite:enter_mode:normal>', 'noremap'],
                \ ['<Tab>', '<denite:move_to_next_line>', 'noremap'],
                \ ['<C-j>', '<denite:move_to_next_line>', 'noremap'],
                \ ['<S-tab>', '<denite:move_to_previous_line>', 'noremap'],
                \ ['<C-k>', '<denite:move_to_previous_line>', 'noremap'],
                \ ['<C-t>', '<denite:do_action:tabopen>', 'noremap'],
                \ ['<C-v>', '<denite:do_action:vsplit>', 'noremap'],
                \ ['<C-s>', '<denite:do_action:split>', 'noremap'],
                \ ['<Esc>', '<denite:enter_mode:normal>', 'noremap'],
                \ ['<C-N>', '<denite:assign_next_matched_text>', 'noremap'],
                \ ['<C-P>', '<denite:assign_previous_matched_text>', 'noremap'],
                \ ['<Up>', '<denite:assign_previous_text>', 'noremap'],
                \ ['<Down>', '<denite:assign_next_text>', 'noremap'],
                \ ['<C-Y>', '<denite:redraw>', 'noremap'],
                \ ]

    let s:normal_mode_mappings = [
                \ ["'", '<denite:toggle_select_down>', 'noremap'],
                \ ['<C-n>', '<denite:jump_to_next_source>', 'noremap'],
                \ ['<C-p>', '<denite:jump_to_previous_source>', 'noremap'],
                \ ['<Tab>', '<denite:move_to_next_line>', 'noremap'],
                \ ['<C-j>', '<denite:move_to_next_line>', 'noremap'],
                \ ['<S-tab>', '<denite:move_to_previous_line>', 'noremap'],
                \ ['<C-k>', '<denite:move_to_previous_line>', 'noremap'],
                \ ['gg', '<denite:move_to_first_line>', 'noremap'],
                \ ['<C-t>', '<denite:do_action:tabopen>', 'noremap'],
                \ ['<C-v>', '<denite:do_action:vsplit>', 'noremap'],
                \ ['<C-s>', '<denite:do_action:split>', 'noremap'],
                \ ['q', '<denite:quit>', 'noremap'],
                \ ['r', '<denite:redraw>', 'noremap'],
                \ ]

    " Have deoplete completion for vimtex (e.g., bibtex entries)
    au Filetype tex call deoplete#custom#var('omni', 'input_patterns', {
                \ 'tex': g:vimtex#re#deoplete })

    if has('nvim-0.5')
        set foldexpr=nvim_treesitter#foldexpr()

lua <<EOF
        require'nvim-treesitter.configs'.setup {
            -- one of "all", "maintained" (parsers with maintainers), or a list of languages
            ensure_installed = "maintained",
            -- List of parsers to ignore installing
            ignore_install = {},
            -- Modules and its options go here
            highlight = { enable = true },
            -- Indentation is still quite buggy, e.g., for multi-line C comments
            -- or for comments right after a preproc definition.
            -- indent = { enable = true },
            textobjects = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn",
                    node_incremental = "grn",
                    scope_incremental = "grc",
                    node_decremental = "grm",
                },
            },
            refactor = {
                highlight_definitions = { enable = true },
                smart_rename = {
                    enable = true,
                    keymaps = { smart_rename = "grr" },
                    },
                navigation = {
                    enable = true,
                    keymaps = {
                        goto_definition = "gnd",
                        list_definitions = "gnD",
                        list_definitions_toc = "gO",
                        goto_next_usage = "<a-*>",
                        goto_previous_usage = "<a-#>",
                    },
                },
            },
        }
EOF
    endif

    let g:fastfold_minlines = 0

    let g:detectspelllang_langs = {}
    let g:detectspelllang_langs.aspell =[ 'en_US', 'de_AT']

    au FileType mail let g:VimMailSpellLangs=['de', 'en']
    let g:VimMailContactsProvider=['khard']
    let g:VimMailContactsCommands={
                \'khard':
                \{ 'query' : "khard email --parsable --search-in-source-files",
                \'sync': "/bin/true"}
                \}

    let g:org_todo_keywords = [['TODO(t)', 'WAITING(w)', '|', 'DONE(d)'],
                \ ['|', 'OBSOLETE(o)', 'WONT(n)'],
                \ ['CANCELED(c)']]

    let g:vimwiki_list = [{'path': '~/.vimwiki/',
                \ 'template_path': '~/.vim/vimwiki/templates',
                \ 'template_default': 'default',
                \ 'template_ext': '.html'}]
    let g:vimwiki_global_ext = 0


    " Java completion
    au FileType java setlocal omnifunc=javacomplete#Complete
    au FileType java JCEnable

    let g:vimtex_fold_enabled = 1
    let g:vimtex_fold_levelmarker = '➜'

    au FileType c,cpp,obj,java,python packadd! vimspector
    let g:vimspector_base_dir = expand('~/.vim/vimspector-config')
    let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools' ]
    "let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

    function VimspectorRestartOrCreateConfig()
        if !filereadable('.vimspector.json')
            echo "Missing .vimspector.json, created one."
            execute 'tabe .vimspector.json'
        else
            call vimspector#Restart()
        endif
    endfunction

    nmap <leader>dc  <Plug>VimspectorContinue
    nmap <leader>ds  <Plug>VimspectorStop
    nmap <leader>dr  :call VimspectorRestartOrCreateConfig()<CR>
    "nmap <leader>dr  :call vimspector#Restart()<CR>
    nmap <leader>drr :call vimspector#Reset()<CR>
    nmap <leader>dp  <Plug>VimspectorPause
    nmap <leader>db  <Plug>VimspectorToggleBreakpoint
    nmap <leader>dcb <Plug>VimspectorToggleConditionalBreakpoint
    nmap <leader>dfb <Plug>VimspectorAddFunctionBreakpoint
    nmap <leader>dtc <Plug>VimspectorRunToCursor
    nmap <leader>do  <Plug>VimspectorStepOver
    nmap <leader>di  <Plug>VimspectorStepInto
    nmap <leader>dof <Plug>VimspectorStepOut
    " for normal mode, the word under the cursor
    nmap <Leader>de  <Plug>VimspectorBalloonEval
    " for visual mode, the visually selected text
    xmap <Leader>de  <Plug>VimspectorBalloonEval

    au BufNewFile .vimspector.json read ~/.vim/vimspector-config/vimspector.json

    " Do not show diagnostic window of vim-clang
    let g:clang_diagsopt = ''

endfunction
