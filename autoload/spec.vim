" TODO: check if currently in spec file already
function! spec#Open()
    let l:specName = spec#common#SpecName()
    let l:specFile = spec#open#SpecFile(l:specName)
    if spec#open#SpecFileExist()
        exe ":edit " . l:specFile
    else
        echom "Spec file \"" . l:specName . "\" does not exist!"
    endif
endfunction

function! spec#Create()
    let l:specName = spec#common#SpecName()

    if spec#open#SpecFileExist()
        echom "Spec file \"" . l:specName . "\" already exist!"
        return
    endif

    call spec#create#TouchSpec(l:specName)

    let l:specFile = spec#open#SpecFile(l:specName)
    exe ":edit " . l:specFile
endfunction
