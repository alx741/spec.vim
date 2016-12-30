command! SpecOpen call spec#Open('current')
command! SpecHOpen call spec#Open('horizontal')
command! SpecVOpen call spec#Open('vertical')
command! SpecCreate call spec#Create('current')
command! SpecHCreate call spec#Create('horizontal')
command! SpecVCreate call spec#Create('vertical')
command! SpecEdit call spec#boilerplate#Edit()
command! SpecRun call spec#RunThis()
command! SpecRunAll call spec#RunAll()

if !exists("g:spec_disable_maps")
    let g:spec_disable_maps = 0
endif

if exists("g:spec_disable_maps") && g:spec_disable_maps == 0
    augroup spec
        au!
        au FileType haskell,ruby,php,vim nnoremap ghs :SpecOpen<CR>
        au FileType haskell,ruby,php,vim nnoremap ghhs :SpecHOpen<CR>
        au FileType haskell,ruby,php,vim nnoremap ghvs :SpecVOpen<CR>
        au FileType haskell,ruby,php,vim nnoremap ghS :SpecCreate<CR>
        au FileType haskell,ruby,php,vim nnoremap ghhS :SpecHCreate<CR>
        au FileType haskell,ruby,php,vim nnoremap ghvS :SpecVCreate<CR>
        au FileType haskell,ruby,php,vim nnoremap ghE :SpecEdit<CR>
        au FileType haskell,ruby,php,vim nnoremap ghr :SpecRun<CR>
        au FileType haskell,ruby,php,vim nnoremap ghR :SpecRunAll<CR>
    augroup END
endif
