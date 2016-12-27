" TODO: check if currently in spec file already
function! spec#Open()
    let l:specName = spec#common#SpecName()
    let l:specFile = spec#open#SpecFile(l:specName)
    if l:specFile !=? ""
        exe ":e " . l:specFile
    else
        echom "Spec file \"" . l:specName . "\" does not exist!"
    endif
endfunction

function! spec#Create()
    echoerr "undefined"
endfunction
