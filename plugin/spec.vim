command! SpecOpen call spec#Open('current')
command! SpecHOpen call spec#Open('horizontal')
command! SpecVOpen call spec#Open('vertical')
command! SpecCreate call spec#Create('current')
command! SpecHCreate call spec#Create('horizontal')
command! SpecVCreate call spec#Create('vertical')
command! SpecBoilerplateEdit call spec#boilerplate#Edit()

if !exists("g:spec_disable_maps")
    let g:spec_disable_maps = 0
endif

if exists("g:spec_disable_maps") && g:spec_disable_maps == 0
    augroup spec
        au!
        au FileType haskell,ruby,php nnoremap ghs :SpecOpen<CR>
        au FileType haskell,ruby,php nnoremap ghhs :SpecHOpen<CR>
        au FileType haskell,ruby,php nnoremap ghvs :SpecVOpen<CR>
        au FileType haskell,ruby,php nnoremap ghS :SpecCreate<CR>
        au FileType haskell,ruby,php nnoremap ghhS :SpecHCreate<CR>
        au FileType haskell,ruby,php nnoremap ghvS :SpecVCreate<CR>
        au FileType haskell,ruby,php nnoremap ghE :SpecBoilerplateEdit<CR>
    augroup END
endif
