"Automatic installation of vim-plug.
"https://github.com/junegunn/vim-plug/wiki/tips
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vim/init.vim
endif


call plug#begin('~/.vim/plugged')

source ~/.vim/plugins-mini.vim

" Load various conditinoal plugin sets

if filereadable($HOME . '/.vim/plugins-midi.vim')
    source ~/.vim/plugins-midi.vim
endif

if filereadable($HOME . '/.vim/plugins-full.vim')
    source ~/.vim/plugins-full.vim
endif

if filereadable($HOME . '/.vim/plugins-local.vim')
    source ~/.vim/plugins-local.vim
endif

call plug#end()


" Call config functions of plugin sets

call PluginsConfigMini()

if filereadable($HOME . '/.vim/plugins-midi.vim')
    call PluginsConfigMidi()
endif

if filereadable($HOME . '/.vim/plugins-full.vim')
    call PluginsConfigFull()
endif

if filereadable($HOME . '/.vim/plugins-local.vim')
    call PluginsConfigLocal()
endif


function s:PostConfig()
    "Automatically install missing plugins
    "https://github.com/junegunn/vim-plug/wiki/extra
    if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
        PlugInstall --sync | q
    endif
endfunction

autocmd VimEnter * call s:PostConfig()
