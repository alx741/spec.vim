function! spec#run#RunThis(config, fileName)
    " Get specName
    if spec#common#IsSpec(a:config, a:fileName)
        let l:specName = a:fileName
    else
        let l:specName = spec#common#SrcNameTOSpecName(a:config, a:fileName)
    endif

    " Find specFile and Compose
    let l:specFile = spec#common#FindSpecFile(a:config, l:specName)
    exe spec#run#ComposeCommand(a:config, 'individual', l:specFile)
    redraw!
endfunction

function! spec#run#RunAll(config)
    exe spec#run#ComposeCommand(a:config, 'all', '')
    redraw!
endfunction

function! spec#run#ComposeCommand(config, type, specFile)
    " Get user command
    let l:cmd = ''
    if a:type ==? 'individual'
        if a:config['run_individual_cmd'] !=? ''
            let l:cmd = a:config['run_individual_cmd']
        endif
    elseif a:type ==? 'all'
        if a:config['run_all_cmd'] !=? ''
            let l:cmd = a:config['run_all_cmd']
        endif
    endif

    " Check absence
    if l:cmd ==? ''
        throw "No run command provided, try :h spec-run"
    elseif a:config['runner'] ==? ''
        throw "No runner provided, try :h spec-run"
    endif

    " Compose command
    let l:command = a:config['runner'] . " "
    if a:config['hook_before'] !=? ''
        let l:command .= a:config['hook_before'] . " && "
    endif
    let l:command .= l:cmd
    if a:config['hook_pass'] !=? ''
        let l:command .= " && " . a:config['hook_pass']
    endif
    if a:config['hook_fail'] !=? ''
        let l:command .= " || " . a:config['hook_fail']
    endif

    if a:type ==? 'individual'
        let l:command = substitute(l:command, "{spec}", a:specFile, "")
    endif

    return l:command
endfunction
