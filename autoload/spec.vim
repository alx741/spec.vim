function! spec#Open(split)
    let l:config = spec#common#GetConfig()
    let l:thisFileName = FileName()
    call spec#open#Open(l:config, a:split, l:thisFileName)
endfunction

function! spec#Create(split)
    if spec#common#AlreadySpec()
        echom "This is already a spec file"
        return
    endif

    let l:srcName = FileName()
    let l:srcFilePath = fnamemodify(spec#open#GetSrcFilePath(), ':h') . '/'
    let l:specName = spec#common#SpecName()
    if spec#open#SpecFileExists()
        echom "Spec file \"" . l:specName . "\" already exists!"
        return
    endif

    call spec#create#TouchSpec(l:specName)
    call spec#common#Edit(a:split, spec#open#GetSpecFilePath())
    if !exists("g:spec_boilerplate_disable") || g:spec_boilerplate_disable == 0
        call spec#boilerplate#Read()
        call spec#boilerplate#Placeholders(srcName, fnamemodify(specName, ':r'), srcFilePath)
    endif
endfunction

function! spec#RunThis()
    " if spec#common#AlreadySpec()
    "     echom spec#open#GetSpecFilePath()
    "     " call spec#run#RunThis(spec#open#GetSpecFilePath())
    " else
    "     echom spec#open#GetSpecFilePath()
    "     " echom "This is not a spec file!"
    " endif
endfunction
