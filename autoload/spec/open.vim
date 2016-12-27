" Load FileType defaults
call spec#defaults#load()

function! spec#open#SpecFile(specName)
    let l:dir = g:spec_global_dir

    if &ft ==? "haskell"
        if exists("g:spec_haskell_dir")
            let l:dir = g:spec_haskell_dir
        endif

    elseif &ft ==? "ruby"
        if exists("g:spec_ruby_dir")
            let l:dir = g:spec_ruby_dir
        endif

    elseif &ft ==? "php"
        if exists("g:spec_php_dir")
            let l:dir = g:spec_php_dir
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
    let l:prefix = g:spec_global_prefix
    let l:suffix = g:spec_global_suffix

    if &ft ==? "haskell"
        if exists("g:spec_haskell_prefix")
            let l:prefix = g:spec_haskell_prefix
        endif
        if exists("g:spec_haskell_suffix")
            let l:suffix = g:spec_haskell_suffix
        endif

    elseif &ft ==? "ruby"
        if exists("g:spec_ruby_prefix")
            let l:prefix = g:spec_ruby_prefix
        endif
        if exists("g:spec_ruby_suffix")
            let l:suffix = g:spec_ruby_suffix
        endif

    elseif &ft ==? "php"
        if exists("g:spec_php_prefix")
            let l:prefix = g:spec_php_prefix
        endif
        if exists("g:spec_php_suffix")
            let l:suffix = g:spec_php_suffix
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
