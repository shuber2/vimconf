function! Cond(cond, ...)
    let opts = get(a:000, 0, {})
    return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

Plug 'mhinz/vim-startify'
Plug 'dstein64/vim-startuptime'

" The original repo from gruvbox-community would not support treestitter and
" semantic highlighting
if has('nvim')
    Plug 'ellisonleao/gruvbox.nvim'
else
    Plug 'gruvbox-community/gruvbox'
endif

Plug 'benknoble/vim-auto-origami'

" This plugin cannot be conditionally loaded, see github issue #18
Plug 'derekwyatt/vim-fswitch' ", {'for': ['c', 'cpp', 'objc']}

Plug 'thinca/vim-fontzoom'

Plug 'lambdalisue/vim-manpager'

" Make . more useful after a plugin map
Plug 'tpope/vim-repeat'
Plug 'flwyd/vim-conjoin'

Plug 'nfnty/vim-nftables'

if has('nvim')
    " Comparison at https://github.com/Darazaki/indent-o-matic/issues/12
    Plug 'nmac427/guess-indent.nvim'
endif

if has('nvim-0.7')
    Plug 'echasnovski/mini.nvim'", { 'branch': 'stable' }
else
    Plug 'vim-airline/vim-airline'
endif


function PluginsConfigMini()

    " Config of ellisonleao/gruvbox for neovim and gruvbox-community/gruvbox
    " otherwise
    if has('nvim')
        lua <<EOF
        -- Required before setting colorscheme to gruvbox
        require("gruvbox").setup({
            contrast = "hard",
        })
EOF
    else
        let g:gruvbox_contrast_light='hard'
        let g:gruvbox_contrast_dark='hard'

        if &term =~ 'linux'
            let g:gruvbox_termcolors=16
        else
            " Setting termguicolors has two implications:
            " - Breaks colors for some versions of mosh, but not if tmux is used on top of
            "   mosh. See https://github.com/mobile-shell/mosh/issues/928
            set termguicolors
            let g:gruvbox_italic = 1
        endif
    endif
    set background=dark
    colorscheme gruvbox


    augroup autofoldcolumn
        au!
        au CursorHold,BufWinEnter * AutoOrigamiFoldColumn
    augroup END


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

    if has('nvim')
        lua <<EOF
        require('guess-indent').setup {}
EOF
    endif

    if has('nvim-0.7')
        lua <<EOF

        require('mini.align').setup()
        require('mini.ai').setup()
        require('mini.bracketed').setup()
        require('mini.bufremove').setup()
        require('mini.comment').setup()
        require('mini.completion').setup()
        require('mini.cursorword').setup()
        require('mini.diff').setup()
        require('mini.files').setup()
        require('mini.fuzzy').setup()
        require('mini.git').setup()
        require('mini.icons').setup()
        require('mini.jump2d').setup()
        require('mini.map').setup()
        require('mini.move').setup()
        require('mini.notify').setup()
        require('mini.operators').setup()
        require('mini.pick').setup()
        require('mini.sessions').setup()
        require('mini.splitjoin').setup()
        require('mini.statusline').setup()
        require('mini.surround').setup()
        require('mini.tabline').setup()
        require('mini.trailspace').setup()
EOF
    else
        let g:airline_powerline_fonts=1
        let g:airline#extensions#tabline#enabled=1
        let g:airline#extensions#branch#enabled=1
    endif

    if has('nvim-0.9')
        lua <<EOF

        local miniclue = require('mini.clue')
        miniclue.setup({
        triggers = {
            -- Leader triggers
            { mode = 'n', keys = '<Leader>' },
            { mode = 'x', keys = '<Leader>' },

            -- Built-in completion
            { mode = 'i', keys = '<C-x>' },

            -- `g` key
            { mode = 'n', keys = 'g' },
            { mode = 'x', keys = 'g' },

            -- Marks
            { mode = 'n', keys = "'" },
            { mode = 'n', keys = '`' },
            { mode = 'x', keys = "'" },
            { mode = 'x', keys = '`' },

            -- Registers
            { mode = 'n', keys = '"' },
            { mode = 'x', keys = '"' },
            { mode = 'i', keys = '<C-r>' },
            { mode = 'c', keys = '<C-r>' },

            -- Window commands
            { mode = 'n', keys = '<C-w>' },

            -- `z` key
            { mode = 'n', keys = 'z' },
            { mode = 'x', keys = 'z' },
            },

        clues = {
            -- Enhance this by adding descriptions for <Leader> mapping groups
            miniclue.gen_clues.builtin_completion(),
            miniclue.gen_clues.g(),
            miniclue.gen_clues.marks(),
            miniclue.gen_clues.registers(),
            miniclue.gen_clues.windows(),
            miniclue.gen_clues.z(),
            },
        })
EOF
    endif

endfunction

