let g:localvimrc_persistent = 1

let g:fastfold_minlines = 0

au FileType markdown call RagtagInit()

let g:detectspelllang_langs = {}
let g:detectspelllang_langs.aspell =[ 'en_US', 'de_AT']
au FileType mail let g:VimMailSpellLangs=['de', 'en']

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

let g:VimMailContactsProvider=['khard']
let g:VimMailContactsCommands={
    \'khard':
    \{ 'query' : "khard email --parsable --search-in-source-files",
        \'sync': "/bin/true"}
  \}

let g:vimtex_fold_enabled = 1
let g:vimtex_fold_levelmarker = '➜'

" termdebug split windows
let g:termdebug_wide = 1
let termdebugger = $HOME . '/.vim/gdb.sh'

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


if $USER != "root"
    source ~/.vim/init-plugins-noroot.vim
endif
