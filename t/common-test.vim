source autoload/spec/common.vim

describe 'srcName to specName'
    it 'should convert a src file name to its spec name'
        let config = {'spec_dir': 'test', 'src_dir': 'src', 'spec_extension': '.hs', 'src_extension': '.hs',
                    \ 'spec_prefix': '', 'spec_suffix': 'Spec', 'runner': '!', 'run_individual_cmd': '',
                    \ 'run_all_cmd': '', 'hook_before': '', 'hook_pass': '', 'hook_fail': ''}

        Expect spec#common#SrcNameTOSpecName(config, 'Module') ==# 'ModuleSpec'
        Expect spec#common#SrcNameTOSpecName(config, 'OtherModule') ==# 'OtherModuleSpec'
    end

    it 'should convert a src file name to its spec name using a prefix'
        let config = {'spec_dir': 'test', 'src_dir': 'src', 'spec_extension': '.hs', 'src_extension': '.hs',
                    \ 'spec_prefix': 'The', 'spec_suffix': 'Spec', 'runner': '!', 'run_individual_cmd': '',
                    \ 'run_all_cmd': '', 'hook_before': '', 'hook_pass': '', 'hook_fail': ''}

        Expect spec#common#SrcNameTOSpecName(config, 'Module') ==# 'TheModuleSpec'
        Expect spec#common#SrcNameTOSpecName(config, 'OtherModule') ==# 'TheOtherModuleSpec'
    end

    it 'should give the same name when no prefix nor suffix is given'
        let config = {'spec_dir': 'test', 'src_dir': 'src', 'spec_extension': '.hs', 'src_extension': '.hs',
                    \ 'spec_prefix': '', 'spec_suffix': '', 'runner': '!', 'run_individual_cmd': '',
                    \ 'run_all_cmd': '', 'hook_before': '', 'hook_pass': '', 'hook_fail': ''}

        Expect spec#common#SrcNameTOSpecName(config, 'Module') ==# 'Module'
        Expect spec#common#SrcNameTOSpecName(config, 'OtherModule') ==# 'OtherModule'
    end
end


describe 'specName to srcName'
    it 'should convert a spec file name to its src name when only suffix is used'
        let config = {'spec_dir': 'test', 'src_dir': 'src', 'spec_extension': '.hs', 'src_extension': '.hs',
                    \ 'spec_prefix': '', 'spec_suffix': 'Spec', 'runner': '!', 'run_individual_cmd': '',
                    \ 'run_all_cmd': '', 'hook_before': '', 'hook_pass': '', 'hook_fail': ''}

        Expect spec#common#SpecNameTOSrcName(config, 'ModuleSpec') ==# 'Module'
        Expect spec#common#SpecNameTOSrcName(config, 'OtherModuleSpec') ==# 'OtherModule'
    end

    it 'should convert a spec file name to its src name when only prefix is used'
        let config = {'spec_dir': 'test', 'src_dir': 'src', 'spec_extension': '.hs', 'src_extension': '.hs',
                    \ 'spec_prefix': 'The', 'spec_suffix': '', 'runner': '!', 'run_individual_cmd': '',
                    \ 'run_all_cmd': '', 'hook_before': '', 'hook_pass': '', 'hook_fail': ''}

        Expect spec#common#SpecNameTOSrcName(config, 'TheModule') ==# 'Module'
        Expect spec#common#SpecNameTOSrcName(config, 'TheOtherModule') ==# 'OtherModule'
    end

    it 'should convert a spec file name to its src name when both prefix and suffix is used'
        let config = {'spec_dir': 'test', 'src_dir': 'src', 'spec_extension': '.hs', 'src_extension': '.hs',
                    \ 'spec_prefix': 'The', 'spec_suffix': 'Spec', 'runner': '!', 'run_individual_cmd': '',
                    \ 'run_all_cmd': '', 'hook_before': '', 'hook_pass': '', 'hook_fail': ''}

        Expect spec#common#SpecNameTOSrcName(config, 'TheModuleSpec') ==# 'Module'
        Expect spec#common#SpecNameTOSrcName(config, 'TheOtherModuleSpec') ==# 'OtherModule'
    end
end
