" Load FileType defaults
call spec#defaults#load()

function! spec#open#SpecFileExists(specName)
    let l:dirs = g:spec_global_dirs

    if &ft ==? "haskell"
        if exists("g:spec_haskell_dirs")
            let l:dirs = g:spec_haskell_dirs
        endif

    elseif &ft ==? "ruby"
        if exists("g:spec_ruby_dirs")
            let l:dirs = g:spec_ruby_dirs
        endif

    elseif &ft ==? "php"
        if exists("g:spec_php_dirs")
            let l:dirs = g:spec_php_dirs
        endif
    endif

    for dir in l:dirs
        let l:spec = findfile(a:specName, dir . "/**/")
        return (l:spec !=? "")
    endfor
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
