function! spec#Open()
    if spec#common#AlreadySpec()
        echom "This is already a spec file"
        return
    endif

    let l:specName = spec#common#SpecName()
    let l:specFile = spec#open#SpecFile(l:specName)
    if spec#open#SpecFileExists()
        exe ":edit " . l:specFile
    else
        echom "Spec file \"" . l:specName . "\" does not exists!"
    endif
endfunction

function! spec#Create()
    if spec#common#AlreadySpec()
        echom "This is already a spec file"
        return
    endif

    let l:srcName = expand('%:t:r')
    let l:specName = spec#common#SpecName()
    if spec#open#SpecFileExists()
        echom "Spec file \"" . l:specName . "\" already exists!"
        return
    endif

    call spec#create#TouchSpec(l:specName)
    exe ":edit " . spec#open#SpecFile(l:specName)
    if !exists("g:spec_boilerplate_disable") || g:spec_boilerplate_disable == 0
        call spec#boilerplate#Read()
        call spec#boilerplate#Placeholders(srcName, fnamemodify(specName, ':r'))
    endif
endfunction
