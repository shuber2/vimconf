nnoremap <C-p> :Denite file/rec<cr>
nnoremap <space>/ :Denite grep:.<cr>
nnoremap <space>s :Denite buffer<cr>

nnoremap <C-space> pumvisible() ? "\<c-n>" : "\<tab>"

nnoremap <F2> :NERDTreeToggle<cr>
nnoremap <F3> :TagbarToggle<cr>
au Filetype gnuplot map <buffer> <F5> :call OpenIn("gnuplot -persist") <CR>

nmap <s-PageDown> :bn<CR>
nmap <s-PageUp>   :bp<CR>

map <a-c> <plug>NERDCommenterToggle

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

au Filetype c,cpp,objc map <buffer> <F11> :vsplit<CR>:FSRight<CR>
au Filetype c,cpp,objc map <buffer> <S-F11> :FSHere<CR>
au BufNewFile *.{h,hpp,hxx} call AddIncludeGuards()

au Filetype html,xml imap <buffer> <C-_> <C-X>/

" Start interactive EasyAlign in visual mode (e.g. vipga)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

if filereadable($HOME . '/.vim/keymaps-local.vim')
  source ~/.vim/keymaps-local.vim
endif
