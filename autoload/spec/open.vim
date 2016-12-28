function! spec#open#SpecFile()
    let l:config = spec#common#GetConfig()
    let l:specName = spec#common#SpecName()

    " Find specs dir recursively upwards
    let l:dirAbsPath = finddir(l:config['spec_dir'], "./;/")
    if l:dirAbsPath !=? ""
        " Find spec file recursively downwards
        return findfile(l:specName, l:dirAbsPath . "/**/")
    else
        echoerr "Specs directory: \"" . l:config['spec_dir']  . "\" does not exist!"
        return ""
    endif
endfunction

function! spec#open#SrcFile()
    let l:config = spec#common#GetConfig()
    let l:srcName = spec#common#SrcName()

    " Find src dir recursively upwards
    let l:dirAbsPath = finddir(l:config['src_dir'], "./;/")
    if l:dirAbsPath !=? ""
        " Find src file recursively downwards
        return findfile(l:srcName, l:dirAbsPath . "/**/")
    else
        echoerr "Source directory: \"" . l:config['src_dir']  . "\" does not exist!"
        return ""
    endif
endfunction

function! spec#open#SrcFileExists()
    let l:srcName = spec#common#SrcName()
    let l:srcFile = spec#open#SrcFile()
    if l:srcFile !=? ""
        return v:true
    else
        return v:false
    endif
endfunction

function! spec#open#SpecFileExists()
    let l:specName = spec#common#SpecName()
    let l:specFile = spec#open#SpecFile()
    if l:specFile !=? ""
        return v:true
    else
        return v:false
    endif
endfunction
