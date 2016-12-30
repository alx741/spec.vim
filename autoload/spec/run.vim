function! spec#run#RunThis(config, fileName)
    " Get the specFile
    "     if fileName is a srcName
            " then convert it to the corresponding specName

    echom spec#run#ComposeCommand(a:config, 'individual', a:specFile)
endfunction

function! spec#run#RunAll()
    let l:config = spec#common#GetConfig()
    echom s:Command('all', '')
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

    " Build command
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
