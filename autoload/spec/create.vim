function! spec#create#Create(config, split, srcName)
    if spec#common#IsSpec(a:config, a:srcName)
        echom "This is already a spec file"
        return
    endif

    let l:specName = spec#common#SrcNameTOSpecName(a:config, a:srcName)
    let l:specFile = spec#common#FindSpecFile(a:config, l:specName)
    if l:specFile !=? ''
        echom "Spec file \"" . l:specName . "\" already exists!"
        return
    endif

    let l:srcFile = spec#common#FindSrcFile(a:config, a:srcName)
    let l:specDir = spec#common#GetSpecDir(a:config, l:srcFile)

    call spec#create#TouchSpec(a:config, l:specDir, l:specName)
    call spec#open#Open(a:config, a:split, a:srcName)
    " if !exists("g:spec_boilerplate_disable") || g:spec_boilerplate_disable == 0
    "     call spec#boilerplate#Read()
    "     call spec#boilerplate#Placeholders(srcName, fnamemodify(specName, ':r'), srcFilePath)
    " endif
endfunction

function! spec#create#TouchSpec(config, dir, specName)
    let l:specFile = a:dir . "/" . a:specName . a:config['spec_extension']
    exe "silent! !mkdir -p " . a:dir
    exe "silent! !touch " . l:specFile
    exe "redraw!"
endfunction
