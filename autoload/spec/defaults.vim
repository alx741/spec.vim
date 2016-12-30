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
            \   'keep_src_tree': 1,
            \   'spec_prefix': '',
            \   'spec_suffix': 'Spec',
            \   'runner': '!',
            \   'run_individual_cmd': '',
            \   'run_all_cmd': '',
            \   'hook_before': '',
            \   'hook_pass': '',
            \   'hook_fail': ''
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
            \   'keep_src_tree': 1,
            \   'spec_prefix': '',
            \   'spec_suffix': 'Spec',
            \   'runner': '!',
            \   'run_individual_cmd': 'stack runhaskell {spec}',
            \   'run_all_cmd': 'stack test',
            \   'hook_before': '',
            \   'hook_pass': '',
            \   'hook_fail': ''
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
            \   'keep_src_tree': 1,
            \   'spec_prefix': '',
            \   'spec_suffix': '_spec',
            \   'runner': '!',
            \   'run_individual_cmd': 'rspec {spec}',
            \   'run_all_cmd': 'rspec',
            \   'hook_before': '',
            \   'hook_pass': '',
            \   'hook_fail': ''
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
            \   'keep_src_tree': 1,
            \   'spec_prefix': '',
            \   'spec_suffix': 'Spec',
            \   'runner': '!',
            \   'run_individual_cmd': 'bin/phpspec run {spec}',
            \   'run_all_cmd': 'bin/phpspec run',
            \   'hook_before': '',
            \   'hook_pass': '',
            \   'hook_fail': ''
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
            \   'keep_src_tree': 0,
            \   'spec_prefix': '',
            \   'spec_suffix': '-test',
            \   'runner': '!',
            \   'run_individual_cmd': '',
            \   'run_all_cmd': 'rake test',
            \   'hook_before': '',
            \   'hook_pass': '',
            \   'hook_fail': ''
            \ }
    endif


    " =======================
    "       JavaScript
    " =======================
    if !exists("g:spec_javascript")
        let g:spec_javascript = {
            \   'spec_dir': 'spec',
            \   'src_dir': 'src',
            \   'spec_extension': '.js',
            \   'src_extension': '.js',
            \   'keep_src_tree': 1,
            \   'spec_prefix': '',
            \   'spec_suffix': 'Spec',
            \   'runner': '!',
            \   'run_individual_cmd': 'jasmine {spec}',
            \   'run_all_cmd': 'jasmine',
            \   'hook_before': '',
            \   'hook_pass': '',
            \   'hook_fail': ''
            \ }
    endif
endfunction
