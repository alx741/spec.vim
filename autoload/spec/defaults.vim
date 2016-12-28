function! spec#defaults#load()
    " =======================
    "     Global Defaults
    " =======================
    if !exists("g:spec_global")
        let g:spec_global = {
            \   'spec_dir': 'test',
            \   'src_dir': 'src',
            \   'spec_extension': '',
            \   'src_extension': '',
            \   'spec_prefix': '',
            \   'spec_suffix': 'Spec'
            \ }
    endif


    " =======================
    "       Haskell
    " =======================
    if !exists("g:spec_haskell")
        let g:spec_haskell = {
            \   'spec_dir': 'test',
            \   'src_dir': 'src',
            \   'spec_extension': '.hs',
            \   'src_extension': '.hs',
            \   'spec_prefix': '',
            \   'spec_suffix': 'Spec'
            \ }
    endif


    " =======================
    "       Ruby
    " =======================
    if !exists("g:spec_ruby")
        let g:spec_ruby = {
            \   'spec_dir': 'spec',
            \   'src_dir': 'src',
            \   'spec_extension': '.rb',
            \   'src_extension': '.rb',
            \   'spec_prefix': '',
            \   'spec_suffix': '_spec'
            \ }
    endif


    " =======================
    "       PHP
    " =======================
    if !exists("g:spec_php")
        let g:spec_php = {
            \   'spec_dir': 'spec',
            \   'src_dir': 'src',
            \   'spec_extension': '.php',
            \   'src_extension': '.php',
            \   'spec_prefix': '',
            \   'spec_suffix': 'Spec'
            \ }
    endif


    " =======================
    "       VimL
    " =======================
    if !exists("g:spec_viml")
        let g:spec_viml = {
            \   'spec_dir': 't',
            \   'src_dir': 'autoload',
            \   'spec_extension': '.vim',
            \   'src_extension': '.vim',
            \   'spec_prefix': '',
            \   'spec_suffix': '-test'
            \ }
    endif
endfunction
