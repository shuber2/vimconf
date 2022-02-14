" Tranlate umlauts to tex-syntax umlauts
function TexTransUmlaute()
  execute ':%s/ü/\\\"u/ge'
  execute ':%s/Ü/\\\"U/&'
  execute ':%s/ö/\\\"o/&'
  execute ':%s/Ö/\\\"O/&'
  execute ':%s/ä/\\\"a/&'
  execute ':%s/Ä/\\\"A/&'
  execute ':%s/ß/\\\"s/&'
  execute ':%s/²/\^2/&'
endfunction

function! s:texTableBfEntries()
    execute 's/\( *\)\([^ &][^&]*[^ &]\)\( \+\)/\1\\textbf{\2}\3/g'
endfunction

command! -range TexTableBfEntries call s:texTableBfEntries()

"Open current file with a specific program
function OpenIn(prog)
  silent execute ":!" . a:prog . " % &"
endfunction


"Prepend the namespace to an identifier, e.g. 'std::' before 'map' excluding
"those in C/C++ comments.
function PrependCppNamespaceToIdent(ns, id)

  "     To match                   Not to match
  "
  "|id                        |// id
  "|    id                    |// /* */ id
  "|/* */ /* */ id            |/* */ // id
  "|id /* */                  |/* id
  "|*/ id                     | * id
  "                           |/* id */
  "                           |::id
  "                           |/**/ ::id
  "                           |#include <id>
  "
  " In order to not match '* id' it is assumed that multi-line comment lines
  " in the middle begin with a star.

  " If #include and // and /* and ^* and :: is not prepend:
  execute ':%s@\(\(#include\|\/\/\|\/\*\|^\s*\*[^/]\).*\|::\)\@<!\<' . a:id . '\>@' . a:ns . '::' . a:id . '@ge'
  " If #include and // and :: is not prepend, but */ is, and no further /* or // are found
  execute ':%s@\(\(#include\|\/\/\).*\)\@<!\*\/\(\/[^\/\*]\|[^\/]\)*\zs\(::\)\@<!\<' . a:id . '\>@' . a:ns . '::' . a:id . '@ge'

endfunction


"Prepend STL namespace 'std::' to several identifiers
function PrependSTLNamespace()
  " This list of identifier is not complete, but adding all of them is too
  " much. We rather like to add identifieres that are 'typical' for C++.
  " Others, like 'move' are likely to not be C++ specific. In this cases the
  " user is asked to call PrependCppNamespaceToIdent by hand.
  let id = []
  let id = id +['cin', 'cout', 'cerr', 'endl']
  let id = id +['swap', 'sort', 'max', 'min']
  let id = id +['vector', 'deque', 'list', 'map', 'multimap', 'set']
  let id = id +['queue', 'stack', 'priority_queue']
  let id = id +['ostream', 'istream', 'sstream']
  let id = id +['pair', 'string']

  for i in id
    call PrependCppNamespaceToIdent("std", i)
  endfor
endfunction


function EscapeHexToChar()
  echo 'Call "x/Nxb addr" in GDB to print N bytes at addr'
  execute '%s/^.*://'
  execute '%s/\s*0x\(\x\x\)/\\x\1/g'
  execute '%s/^\(.*\)$/"\1"/'
endfunction


function InsertIncludeGuardsWithoutEndif()
  " Build name of guard: Take filename, replace some chars by _ and
  " prepend a random sequence to make guard robust against file name
  " collisions.
  let guardname = substitute(expand("%:t"), "[\\.-]", "_", "g") . '_' . strpart(system('pwgen -c 16 1'), 0, 16)
  execute "normal! i#ifndef " . guardname
  execute "normal! o#define " . guardname
endfunction


function AddIncludeGuards()
  execute "normal! Go#endif"
  execute "normal! gg"
  call InsertIncludeGuardsWithoutEndif()
endfunction


function RunPandoc()
  " If pandoc.css exists, use it
  let cssopts = ""
  if findfile("pandoc.css", ".") == "pandoc.css"
    let cssopts = "-c pandoc.css"
  endif

  execute ":!pandoc " . cssopts . " --self-contained --toc '" . @% . "' -o '" . @% . "'.html"
endfunction


function RunMarkdownpy(prog)
  execute ":!" . a:prog . " " . @% . " > " . @% . ".html"
endfunction


function RunAsciidoctor()
  execute ":!asciidoctor " . @%
  if executable("asciidoctor-pdf")
    execute ":!asciidoctor-pdf " . @%
  elseif executable("asciidoctor")
    execute ":!asciidoctor " . @%
  endif
endfunction

function RunAsciidoctorPdf()
  execute ":!asciidoctor-pdf " . @%
endfunction


function RunMarkdown()
  if executable("pandoc")
    call RunPandoc()
  elseif executable("markdown2")
    call RunMarkdownpy("markdown2")
  elseif executable("markdown_py")
    call RunMarkdownpy("markdown_py")
  else
    echo "No markdown implementation found."
  endif
endfunction


function RunAsciidoc()
  if executable("asciidoctor-pdf")
    call RunAsciidoctorPdf()
  elseif executable("asciidoctor")
    call RunAsciidoctor()
  else
    echo "No asciidoc implementation found."
  endif
endfunction


function OnBattery()
  if has('macunix')
    return match(system('pmset -g batt'), "Now drawing from 'Battery Power'") != -1
  elseif has('unix')
    if filereadable('/sys/class/power_supply/AC/online')
      return readfile('/sys/class/power_supply/AC/online') == ['0']
    endif
  endif
  return 0
endfunction


if filereadable($HOME . '/.vim/macros-local.vim')
  source ~/.vim/macros-local.vim
endif
