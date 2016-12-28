function! spec#defaults#load()
    " =======================
    "     Global Defaults
    " =======================
    if !exists("g:spec_global")
        let g:spec_global = {
            \   'spec_dir': 'test',
            \   'src_dir': 'src',
            \   'prefix': '',
            \   'suffix': 'Spec'
            \ }
    endif


    " =======================
    "       Haskell
    " =======================
    if !exists("g:spec_haskell")
        let g:spec_haskell = {
            \   'spec_dir': 'test',
            \   'src_dir': 'src',
            \   'prefix': '',
            \   'suffix': 'Spec',
            \   'boilerplate':
            \       "module %specName% where\n"
            \ }
    endif


    " =======================
    "       Ruby
    " =======================
    if !exists("g:spec_ruby")
        let g:spec_ruby = {
            \   'spec_dir': 'spec',
            \   'src_dir': 'src',
            \   'prefix': '',
            \   'suffix': '_spec'
            \ }
    endif


    " =======================
    "       PHP
    " =======================
    if !exists("g:spec_php")
        let g:spec_php = {
            \   'spec_dir': 'spec',
            \   'src_dir': 'src',
            \   'prefix': '',
            \   'suffix': 'Spec'
            \ }
    endif
endfunction
