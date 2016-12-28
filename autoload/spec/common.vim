" Load FileType defaults
call spec#defaults#load()

function! spec#common#AlreadySpec()
    let l:config = spec#common#GetConfig()
    let l:match = matchstr(FileName(), '\C' . l:config['suffix'])
    return (l:match !=? "")
endfunction

function! spec#common#GetConfig()
    if &ft ==? "haskell"
        if exists("g:spec_haskell")
            return g:spec_haskell
        endif

    elseif &ft ==? "ruby"
        if exists("g:spec_ruby")
            return g:spec_ruby
        endif

    elseif &ft ==? "php"
        if exists("g:spec_php")
            return g:spec_php
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

function! spec#common#SpecName()
    let l:config = spec#common#GetConfig()
    return l:config['prefix'] . FileName() . l:config['suffix'] . Extension()
endfunction

function! FileName()
    return expand("%:t:r")
endfunction

function! Extension()
    return "." . expand("%:e")
endfunction
