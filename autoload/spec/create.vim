function! spec#create#SpecDir()
    let l:config = spec#common#GetConfig()
    let l:srcFilePath = expand('%:p:h')
    let l:srcDir = "/" . config['src_dir']
    let l:specDir = "/" . config['spec_dir']
    return substitute(l:srcFilePath, l:srcDir, l:specDir, "")
endfunction
