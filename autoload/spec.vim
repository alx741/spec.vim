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
    let l:config = spec#common#GetConfig()
    let l:thisFileName = FileName()
    call spec#run#RunThis(l:config, l:thisFileName)
endfunction

function! spec#RunAll()
    let l:config = spec#common#GetConfig()
    call spec#run#RunAll(l:config)
endfunction
