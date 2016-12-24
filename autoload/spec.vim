function! spec#Open()
    let l:specFile = spec#open#SpecName()
    if spec#open#SpecFileExists(l:specFile)
        exe ":e " . l:specFile
    else
        echom "Spec file \"" . l:specFile . "\" does not exist!"
    endif
endfunction
