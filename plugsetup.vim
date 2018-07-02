"Automatic installation of vim-plug.
"https://github.com/junegunn/vim-plug/wiki/tips
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vim/init.vim
endif

call plug#begin('~/.vim/plugged')
source ~/.vim/plugins.vim
call plug#end()

"Automatically install missing plugins
"https://github.com/junegunn/vim-plug/wiki/extra
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
