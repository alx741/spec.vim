function! spec#defaults#load()
    " =======================
    "     Global Defaults
    " =======================
    if !exists("g:spec_global_dirs")
        let g:spec_global_dirs = ['test', '../test']
    endif

    if !exists("g:spec_global_prefix")
        let g:spec_global_prefix = ""
    endif

    if !exists("g:spec_global_suffix")
        let g:spec_global_suffix = "Spec"
    endif


    " =======================
    "       Haskell
    " =======================
    if !exists("g:spec_haskell_dirs")
        let g:spec_haskell_dirs = ['test', '../test']
    endif

    if !exists("g:spec_haskell_prefix")
        let g:spec_haskell_prefix = ""
    endif

    if !exists("g:spec_haskell_suffix")
        let g:spec_haskell_suffix = "Spec"
    endif


    " =======================
    "       Ruby
    " =======================
    if !exists("g:spec_ruby_dirs")
        let g:spec_ruby_dirs = ['spec', '../spec']
    endif

    if !exists("g:spec_ruby_prefix")
        let g:spec_ruby_prefix = ""
    endif

    if !exists("g:spec_ruby_suffix")
        let g:spec_ruby_suffix = "_spec"
    endif
endfunction
