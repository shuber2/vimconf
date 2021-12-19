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
call deoplete#custom#var('omni', 'input_patterns', {
            \ 'tex': g:vimtex#re#deoplete
            \})

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
        indent = { enable = true },
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
