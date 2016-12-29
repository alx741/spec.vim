function! spec#Open(split)
    let l:config = spec#common#GetConfig()
    let l:thisFileName = FileName()
    call spec#open#Open(l:config, a:split, l:thisFileName)
endfunction

function! spec#Create(split)
    let l:config = spec#common#GetConfig()
    let l:thisFileName = FileName()
    call spec#create#Create(l:config, a:split, l:thisFileName)
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
