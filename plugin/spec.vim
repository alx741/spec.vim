command! SpecOpen call spec#Open()

if !exists("g:spec_disable_maps")
    let g:spec_disable_maps = 0
endif

if exists("g:spec_disable_maps") && g:spec_disable_maps == 0
    augroup spec
        au!
        au FileType haskell,ruby nnoremap ghs :SpecOpen<CR>
    augroup END
endif
