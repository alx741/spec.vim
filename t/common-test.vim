source autoload/spec/common.vim

describe 'srcName to specName'
    it 'should convert a src file name to its spec name using g:spec_global'
        let config = {
            \   'spec_dir': 'test',
            \   'src_dir': 'src',
            \   'spec_extension': '.hs',
            \   'src_extension': '.hs',
            \   'spec_prefix': '',
            \   'spec_suffix': 'Spec',
            \   'runner': '!',
            \   'run_individual_cmd': '',
            \   'run_all_cmd': '',
            \   'hook_before': '',
            \   'hook_pass': '',
            \   'hook_fail': ''
            \ }
        Expect spec#common#SrcNameTOSpecName(config, 'Module') ==# 'ModuleSpec'
        Expect spec#common#SrcNameTOSpecName(config, 'OtherModule') ==# 'OtherModuleSpec'
    end
end
