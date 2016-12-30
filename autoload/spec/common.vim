" Load FileType defaults
call spec#defaults#load()

function! spec#common#Edit(split, file)
    if a:split ==? 'current'
        exe ":edit " . a:file
    elseif a:split ==? 'horizontal'
        exe ":split " . a:file
    elseif a:split ==? 'vertical'
        exe ":vsplit " . a:file
    endif
endfunction

function! spec#common#AlreadySpec()
    let l:config = spec#common#GetConfig()
    let l:match = matchstr(FileName(), '\C' . l:config['spec_suffix'])
    return (l:match !=? "")
endfunction

function! spec#common#GetConfig()
    if &ft ==? 'haskell'
        if exists("g:spec_haskell")
            return g:spec_haskell
        endif

    elseif &ft ==? 'ruby'
        if exists("g:spec_ruby")
            return g:spec_ruby
        endif

    elseif &ft ==? 'php'
        if exists("g:spec_php")
            return g:spec_php
        endif

    elseif &ft ==? 'vim'
        if exists("g:spec_viml")
            return g:spec_viml
        endif

    elseif &ft ==? 'javascript'
        if exists("g:spec_javascript")
            return g:spec_javascript
        endif

    elseif &ft ==? 'java'
        if exists("g:spec_java")
            return g:spec_java
        endif

    elseif &ft ==? 'go'
        if exists("g:spec_go")
            return g:spec_go
        endif

    endif

    return g:spec_global
endfunction

function! spec#common#SpecDir()
    let l:config = spec#common#GetConfig()
    let l:srcFilePath = expand('%:p:h')
    let l:srcDir = "/" . config['src_dir']
    let l:specDir = "/" . config['spec_dir']
    return substitute(l:srcFilePath, l:srcDir, l:specDir, "")
endfunction

function! spec#common#SrcName()
    let l:config = spec#common#GetConfig()
    let l:removePrefix = substitute(FileName(), l:config['spec_prefix'], "", "")
    let l:removeSuffix = substitute(removePrefix, l:config['spec_suffix'], "", "")
    return l:removeSuffix . l:config['src_extension']
endfunction

function! spec#common#SpecName()
    let l:config = spec#common#GetConfig()
    return l:config['spec_prefix'] . FileName() . l:config['spec_suffix'] . l:config['spec_extension']
endfunction


        " NEW


function! spec#common#FindSpecFile(config, specName)
    if !spec#common#IsSpec(a:config, a:specName)
        throw a:specName . ' is not a spec!'
    endif
    return FindFile(a:config['spec_dir'], a:specName . a:config['spec_extension'])
endfunction

function! spec#common#FindSrcFile(config, srcName)
    if spec#common#IsSpec(a:config, a:srcName)
        throw a:srcName . ' is a spec!'
    endif
    return FindFile(a:config['src_dir'], a:srcName . a:config['src_extension'])
endfunction

function! FindFile(dir, name)
    " Find dir recursively upwards
    let l:dirAbsPath = fnamemodify(finddir(a:dir, "./;/"), ':p')
    if l:dirAbsPath !=? ""
        " Find file recursively downwards
        let l:file = findfile(a:name, l:dirAbsPath . "/**/")
        if l:file ==? ""
            return l:file
        else
            return fnamemodify(l:file, ':p')
        endif
        " return findfile(a:name, l:dirAbsPath . "/**/")
    else
        throw "Directory: \"" . a:dir  . "\" does not exist!"
    endif
endfunction

function! spec#common#GetSpecDir(config, srcFile)
    if spec#common#IsSpec(a:config, spec#common#Name(a:srcFile))
        throw a:srcFile . ' is a spec file!'
    endif

    let l:srcFilePath = fnamemodify(a:srcFile, ':h')
    if a:config['keep_src_tree']
        return substitute(l:srcFilePath, a:config['src_dir'], a:config['spec_dir'], "")
    else
        let l:removeSrc = substitute(l:srcFilePath, a:config['src_dir'] . '.*', '', '')
        return l:removeSrc . a:config['spec_dir']
    endif
endfunction!

function! spec#common#SpecNameTOSrcName(config, specName)
    if !spec#common#IsSpec(a:config, a:specName)
        throw a:specName . ' is not a spec name!'
    endif

    let l:removePrefix = substitute(a:specName, a:config['spec_prefix'], "", "")
    return substitute(l:removePrefix, a:config['spec_suffix'], "", "")
endfunction

function! spec#common#SrcNameTOSpecName(config, srcName)
    if spec#common#IsSpec(a:config, a:srcName)
        throw a:srcName . ' is a spec name!'
    endif

    return a:config['spec_prefix'] . a:srcName . a:config['spec_suffix']
endfunction

function! spec#common#IsSpec(config, name)
    let l:matchPrefix = matchstr(a:name, '\C' . a:config['spec_prefix'])
    let l:matchSuffix = matchstr(a:name, '\C' . a:config['spec_suffix'])
    return (l:matchPrefix !=? '' || l:matchSuffix !=? '')
endfunction

function! spec#common#File()
    return expand('%:p')
endfunction

function! spec#common#Name(file)
    return fnamemodify(a:file, ':t:r')
endfunction

function! FileName()
    return expand("%:t:r")
endfunction

function! Extension()
    return "." . expand("%:e")
endfunction
