function! spec#open#SpecFile(specName)
    let l:config = spec#common#GetConfig()

    " Find specs dir recursively upwards
    let l:dirAbsPath = finddir(l:config['spec_dir'], "./;/")
    if l:dirAbsPath !=? ""
        " Find spec file recursively downwards
        return findfile(a:specName, l:dirAbsPath . "/**/")
    else
        echoerr "Specs directory: \"" . l:config['spec_dir']  . "\" does not exist!"
        return ""
    endif
endfunction
