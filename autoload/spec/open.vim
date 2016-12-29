function! spec#open#SrcFileExists()
    return spec#open#GetSrcFilePath() !=? ''
endfunction

function! spec#open#SpecFileExists()
    return spec#open#GetSpecFilePath() !=? ''
endfunction


function! spec#open#GetSpecFilePath()
    let l:config = spec#common#GetConfig()
    let l:specName = spec#common#SrcNameTOSpecName(l:config, FileName())
    return spec#common#FindSpecFile(l:config, l:specName)
endfunction

function! spec#open#GetSrcFilePath()
    let l:config = spec#common#GetConfig()
    let l:srcName = spec#common#SpecNameTOSrcName(l:config, FileName())
    return spec#common#FindSrcFile(l:config, l:srcName)
endfunction
