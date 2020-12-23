""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global settings

nnoremap <C-space> pumvisible() ? "\<c-n>" : "\<tab>"

nnoremap <F2> :NERDTreeToggle<cr>
nnoremap <F3> :TagbarToggle<cr>

nmap <s-PageDown> :bn<CR>
nmap <s-PageUp>   :bp<CR>

map <a-c> <plug>NERDCommenterToggle

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Start interactive EasyAlign in visual mode (e.g. vipga)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some filetype-specific settings

au Filetype gnuplot map <buffer> <F5> :call OpenIn("gnuplot -persist") <CR>

au Filetype c,cpp,objc map <buffer> <F11> :vsplit<CR>:FSRight<CR>
au Filetype c,cpp,objc map <buffer> <S-F11> :FSHere<CR>

au Filetype markdown map <buffer> <F5> :call RunMarkdown()<CR>
au Filetype asciidoc map <buffer> <F5> :call RunAsciidoc()<CR>

" See https://github.com/artur-shaik/vim-Javacomplete2
" <C-j>ji <leader>ji
au FileType java nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
au FileType java imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
" <C-j>ii <leader>jii
au FileType java nmap <F5> <Plug>(JavaComplete-Imports-Add)
au FileType java imap <F5> <Plug>(JavaComplete-Imports-Add)
" <C-j>I <leader>jI
au FileType java nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
au FileType java imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
" <C-j>R <leader>jR
au FileType java nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
au FileType java imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some plugin-specific settings




if filereadable($HOME . '/.vim/keymaps-local.vim')
  source ~/.vim/keymaps-local.vim
endif
