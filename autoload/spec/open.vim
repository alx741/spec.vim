" Load FileType defaults
call spec#defaults#load()

function! spec#open#SpecFile(specName)
    let l:dir = g:spec_global['spec_dir']

    if &ft ==? "haskell"
        if exists("g:spec_haskell")
            let l:dir = g:spec_haskell['spec_dir']
        endif

    elseif &ft ==? "ruby"
        if exists("g:spec_ruby")
            let l:dir = g:spec_ruby['spec_dir']
        endif

    elseif &ft ==? "php"
        if exists("g:spec_php")
            let l:dir = g:spec_php['spec_dir']
        endif
    endif

    " Find specs dir recursively upwards
    let l:dirAbsPath = finddir(l:dir, "./;/")
    if l:dirAbsPath !=? ""
        " Find spec file recursively downwards
        return findfile(a:specName, l:dirAbsPath . "/**/")
    else
        echoerr "Specs directory: \"" . l:dir  . "\" does not exist!"
        return ""
    endif
endfunction

function! spec#open#SpecName()
    let l:prefix_suffix = PrefixAndSuffix()
    let l:prefix = l:prefix_suffix[0]
    let l:suffix = l:prefix_suffix[1]
    return l:prefix . FileName() . l:suffix . Extension()
endfunction

function! PrefixAndSuffix()
    let l:prefix = g:spec_global['prefix']
    let l:suffix = g:spec_global['suffix']

    if &ft ==? "haskell"
        if exists("g:spec_haskell")
            let l:prefix = g:spec_haskell['prefix']
        endif
        if exists("g:spec_haskell")
            let l:suffix = g:spec_haskell['suffix']
        endif

    elseif &ft ==? "ruby"
        if exists("g:spec_ruby")
            let l:prefix = g:spec_ruby['prefix']
        endif
        if exists("g:spec_ruby")
            let l:suffix = g:spec_ruby['suffix']
        endif

    elseif &ft ==? "php"
        if exists("g:spec_php")
            let l:prefix = g:spec_php['prefix']
        endif
        if exists("g:spec_php")
            let l:suffix = g:spec_php['suffix']
        endif
    endif

    return [l:prefix, l:suffix]
endfunction

function! FileName()
    return expand("%:t:r")
endfunction

function! Extension()
    return "." . expand("%:e")
endfunction
