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

function! FileName()
    return expand("%:t:r")
endfunction

function! Extension()
    return "." . expand("%:e")
endfunction
