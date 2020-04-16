if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1

" Pretty format the XML content by passing it through xmllint.
function XML_reformat()
    exec "%!xmllint --format -"
endfunction
