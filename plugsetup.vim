"Automatic installation of vim-plug.
"https://github.com/junegunn/vim-plug/wiki/tips
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vim/init.vim
endif


call plug#begin('~/.vim/plugged')

source ~/.vim/plugins.vim

" Load various conditinoal plugin sets
if filereadable($HOME . '/.vim/plugins-local.vim')
    source ~/.vim/plugins-local.vim
endif

if $USER != "root"
    source ~/.vim/plugins-noroot.vim

    if g:lowendbox == 0
        source ~/.vim/plugins-noroot-nolowendbox.vim
    endif
endif

call plug#end()


" Call the config functions of the plugins
call PluginsConfig()
if filereadable($HOME . '/.vim/plugins-local.vim')
    call PluginsLocalConfig()
endif
if $USER != "root"
    call PluginsNorootConfig()
    if g:lowendbox == 0
        call PluginsNorootNolowendboxConfig()
    endif
endif


function s:PostConfig()
    "Automatically install missing plugins
    "https://github.com/junegunn/vim-plug/wiki/extra
    if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
        PlugInstall --sync | q
    endif
endfunction

autocmd VimEnter * call s:PostConfig()
