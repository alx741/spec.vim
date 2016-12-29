function! spec#open#Open(config, split, fileName)
    " This is a spec file
    if spec#common#IsSpec(a:config, a:fileName)
        let l:srcName = spec#common#SpecNameTOSrcName(a:config, a:fileName)
        let l:srcFile = spec#common#FindSrcFile(a:config, l:srcName)
        if l:srcFile !=? ''
            call spec#common#Edit(a:split, l:srcFile)
        else
            echom "Source file \"" . l:srcName . "\" does not exist!"
        endif

    " This is a source file
    else
        let l:specName = spec#common#SrcNameTOSpecName(a:config, a:fileName)
        let l:specFile = spec#common#FindSpecFile(a:config, l:specName)
        if l:specFile !=? ''
            call spec#common#Edit(a:split, l:specFile)
        else
            echom "Spec file \"" . l:specName . "\" does not exist!"
        endif
    endif
endfunction
