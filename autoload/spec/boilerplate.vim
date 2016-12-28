if !exists("g:spec_boilerplate_dir")
    let g:spec_boilerplate_dir = resolve(expand('<sfile>:p:h')) . "/../../boilerplate"
endif

function! spec#boilerplate#Read()
    let l:config = spec#common#GetConfig()
    let l:boilerplateFile = g:spec_boilerplate_dir . "/" . &ft . l:config['src_extension']
    let l:boilerplate = readfile(l:boilerplateFile)

    exe "norm! gg"
    for l:line in l:boilerplate
        exe "norm! i" . l:line . "\<CR>"
    endfor
    exe "norm! ddgg"
endfunction

function! spec#boilerplate#Placeholders(srcName, specName)
    exe "%s/\%srcName\%/" . a:srcName . "/ge"
    exe "%s/\%specName\%/" . a:specName . "/ge"
    exe "norm! gg0"
endfunction
