""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global settings

if has('clipboard')
    " Use + or * registers
    if has('unnamedplus')
        set clipboard+=unnamedplus
    else
        set clipboard+=unnamed
    endif

    " Ordinary ctrl+{c,x,v} using system clipboard register +. We use autocmd to
    " override plugin keymaps.
    "autocmd VimEnter * vnoremap <C-c> "+y
    "autocmd VimEnter * vnoremap <C-x> "+x
    " Is performed by S+Ins
    "autocmd VimEnter * nnoremap <C-v> "+p
    "autocmd VimEnter * inoremap <C-v> <c-r>+
endif

" ctrl+d as EOF exits shells and the like. Add a keymap for the same here.
nnoremap <C-d> :q<cr>

nnoremap <C-space> pumvisible() ? "\<c-n>" : "\<tab>"

nnoremap <F2> :lua MiniFiles.open()<cr>
nnoremap <F3> :TagbarToggle<cr>
nnoremap <F4> :lua MiniMap.toggle()<cr>

nmap <s-PageDown> :bn<CR>
nmap <s-PageUp>   :bp<CR>

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some filetype-specific settings

au Filetype gnuplot map <buffer> <F5> :call OpenIn("gnuplot -persist") <CR>

" Performs a vertial split and a FSHere. For a header file the split is
" performed to the left, for an implementation file to the right.
function FSvsplit()
    " We split to the right on header files
    if match(expand('%:e'), 'h.*') >= 0
        execute ':leftabove vsplit'
    else
        execute ':rightbelow vsplit'
    endif

    execute ':FSHere'
endfunction

au Filetype c,cpp,objc map <buffer> <F12> :call FSvsplit()<CR>
" Terminal-based vi report S-F12 as F24
au Filetype c,cpp,objc map <buffer> <S-F12> :FSHere<CR>
au Filetype c,cpp,objc map <buffer> <F24> :FSHere<CR>

au Filetype markdown map <buffer> <F5> :call RunMarkdown()<CR>
au Filetype asciidoc,asciidoctor map <buffer> <F5> :call RunAsciidoc()<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some plugin-specific settings


if filereadable($HOME . '/.vim/keymaps-local.vim')
  source ~/.vim/keymaps-local.vim
endif
