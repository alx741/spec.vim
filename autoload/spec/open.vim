function! spec#open#SpecFile(specName)
    let l:config = spec#common#GetConfig()

    " Find specs dir recursively upwards
    let l:dirAbsPath = finddir(l:config['spec_dir'], "./;/")
    if l:dirAbsPath !=? ""
        " Find spec file recursively downwards
        return findfile(a:specName, l:dirAbsPath . "/**/")
    else
        echoerr "Specs directory: \"" . l:config['spec_dir']  . "\" does not exists!"
        return ""
    endif
endfunction

function! spec#open#SpecFileExists()
    let l:specName = spec#common#SpecName()
    let l:specFile = spec#open#SpecFile(l:specName)
    if l:specFile !=? ""
        return v:true
    else
        return v:false
    endif
endfunction
