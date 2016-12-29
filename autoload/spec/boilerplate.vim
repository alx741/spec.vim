if !exists("g:spec_boilerplate_dir")
    let g:spec_boilerplate_dir = resolve(expand('<sfile>:p:h')) . "/../../boilerplate"
endif

function! spec#boilerplate#Edit()
    let l:config = spec#common#GetConfig()
    let l:boilerplateFile = g:spec_boilerplate_dir . "/" . &ft . l:config['src_extension']
    exe ":split " . l:boilerplateFile
endfunction

function! spec#boilerplate#Read(config)
    let l:boilerplateFile = g:spec_boilerplate_dir . "/" . &ft . a:config['src_extension']
    let l:boilerplate = readfile(l:boilerplateFile)

    exe "norm! gg"
    for l:line in l:boilerplate
        exe "norm! i" . l:line . "\<CR>"
    endfor
    exe "norm! ddgg"
endfunction

function! spec#boilerplate#Placeholders(config, srcName, specName, srcFile)
    exe "%s#\%srcName\%#" . a:srcName . "#ge"
    exe "%s#\%specName\%#" . a:specName . "#ge"
    exe "%s#\%specDir\%#" . a:config['spec_dir'] . "#ge"
    exe "%s#\%srcDir\%#" . a:config['src_dir'] . "#ge"
    exe "%s#\%specExt\%#" . a:config['spec_extension'] . "#ge"
    exe "%s#\%srcExt\%#" . a:config['src_extension'] . "#ge"
    let l:srcFilePath = fnamemodify(a:srcFile, ':h')
    exe "%s#\%srcFilePath\%#" . substitute(l:srcFilePath, a:config['src_dir'], "", "") . "#ge"
    exe "norm! gg0"
endfunction
