command! SpecOpen call spec#Open()
command! SpecCreate call spec#Create()

if !exists("g:spec_disable_maps")
    let g:spec_disable_maps = 0
endif

if exists("g:spec_disable_maps") && g:spec_disable_maps == 0
    augroup spec
        au!
        au FileType haskell,ruby,php nnoremap ghs :SpecOpen<CR>
        au FileType haskell,ruby,php nnoremap ghS :SpecCreate<CR>
    augroup END
endif
