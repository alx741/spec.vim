if !exists("g:spec_boilerplate_dir")
    let g:spec_boilerplate_dir = resolve(expand('<sfile>:p:h')) . "/../../boilerplate"
endif

function! spec#boilerplate#Read()
    exe "read " . g:spec_boilerplate_dir . "/" . &ft . "*"
    exe "norm ggJ"
    exe "redraw!"
endfunction

function! spec#boilerplate#Placeholders(srcName, specName)
    exe "%s/\%srcName\%/" . a:srcName
    exe "%s/\%specName\%/" . a:specName
    exe "redraw!"
endfunction