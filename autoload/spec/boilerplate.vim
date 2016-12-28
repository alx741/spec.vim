if !exists("g:spec_boilerplate_dir")
    let g:spec_boilerplate_dir = resolve(expand('<sfile>:p:h')) . "/../../boilerplate"
endif

function! spec#boilerplate#Read()
    exe "read " . g:spec_boilerplate_dir . "/" . &ft . "*"
    exe "norm ggJ"
    call s:ReplacePlaceholders()
    exe "redraw!"
endfunction

function! s:ReplacePlaceholders()
    exe "%s/\%specName\%/" . expand("%:t:r")
endfunction
