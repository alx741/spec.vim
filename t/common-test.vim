source autoload/spec/common.vim
source t/vspec/matchers.vim
call vspec#matchers#load()


describe 'Name'
    it 'gives the file name (whiout extension) of a given full-path file'
        Expect spec#common#Name('Module.hs') ==# 'Module'
        Expect spec#common#Name('/Module.hs') ==# 'Module'
        Expect spec#common#Name('./Module.hs') ==# 'Module'
        Expect spec#common#Name('/some/path/src/Module.hs') ==# 'Module'
    end
end


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

    it 'Throws an exception if the name is not a src'
        let config = {'spec_dir': 'test', 'src_dir': 'src', 'spec_extension': '.hs',
                    \ 'src_extension': '.hs', 'keep_src_tree': 0, 'spec_prefix': '',
                    \ 'spec_suffix': 'Spec', 'runner': '!', 'run_individual_cmd': '',
                    \ 'run_all_cmd': '', 'hook_before': '', 'hook_pass': '', 'hook_fail': ''}
        Expect "spec#common#SrcNameTOSpecName(config, 'ModuleSpec')" to_throw_exception
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

    it 'Throws an exception if the name is not a spec'
        let config = {'spec_dir': 'test', 'src_dir': 'src', 'spec_extension': '.hs',
                    \ 'src_extension': '.hs', 'keep_src_tree': 0, 'spec_prefix': '',
                    \ 'spec_suffix': 'Spec', 'runner': '!', 'run_individual_cmd': '',
                    \ 'run_all_cmd': '', 'hook_before': '', 'hook_pass': '', 'hook_fail': ''}
        Expect "spec#common#SpecNameTOSrcName(config, 'Module')" to_throw_exception
        Expect "spec#common#SpecNameTOSrcName(config, 'SubModule')" to_throw_exception
        Expect "spec#common#SpecNameTOSrcName(config, 'SubModule-spec')" to_throw_exception
    end
end


describe 'IsSpec'
    it 'returns True if the given name is a specName with suffix only'
        let config = {'spec_dir': 'test', 'src_dir': 'src', 'spec_extension': '.hs', 'src_extension': '.hs',
                    \ 'spec_prefix': '', 'spec_suffix': 'Spec', 'runner': '!', 'run_individual_cmd': '',
                    \ 'run_all_cmd': '', 'hook_before': '', 'hook_pass': '', 'hook_fail': ''}

        Expect spec#common#IsSpec(config, 'ModuleSpec') == 1
    end

    it 'returns True if the given name is a specName with prefix only'
        let config = {'spec_dir': 'test', 'src_dir': 'src', 'spec_extension': '.hs', 'src_extension': '.hs',
                    \ 'spec_prefix': 'The', 'spec_suffix': '', 'runner': '!', 'run_individual_cmd': '',
                    \ 'run_all_cmd': '', 'hook_before': '', 'hook_pass': '', 'hook_fail': ''}

        Expect spec#common#IsSpec(config, 'TheModule') == 1
    end

    it 'returns True if the given name is a specName with both prefix and suffix'
        let config = {'spec_dir': 'test', 'src_dir': 'src', 'spec_extension': '.hs', 'src_extension': '.hs',
                    \ 'spec_prefix': 'The', 'spec_suffix': 'Spec', 'runner': '!', 'run_individual_cmd': '',
                    \ 'run_all_cmd': '', 'hook_before': '', 'hook_pass': '', 'hook_fail': ''}

        Expect spec#common#IsSpec(config, 'TheModuleSpec') == 1
    end
end


describe 'GetSpecDir'
    it 'returns the spec directory path that corresponds to the given source file'
        let config = {'spec_dir': 'test', 'src_dir': 'src', 'spec_extension': '.hs',
                    \ 'src_extension': '.hs', 'keep_src_tree': 1, 'spec_prefix': '',
                    \ 'spec_suffix': 'Spec', 'runner': '!', 'run_individual_cmd': '',
                    \ 'run_all_cmd': '', 'hook_before': '', 'hook_pass': '', 'hook_fail': ''}
        let projectDir = '/home/user/project'

        Expect spec#common#GetSpecDir(config, projectDir . '/src/Module.hs') == projectDir . '/test'
    end

    it 'returns the spec directory path that corresponds to the given source file, with nested dirs'
        let config = {'spec_dir': 'test', 'src_dir': 'src', 'spec_extension': '.hs',
                    \ 'src_extension': '.hs', 'keep_src_tree': 1, 'spec_prefix': '',
                    \ 'spec_suffix': 'Spec', 'runner': '!', 'run_individual_cmd': '',
                    \ 'run_all_cmd': '', 'hook_before': '', 'hook_pass': '', 'hook_fail': ''}
        let projectDir = '/home/user/project'

        Expect spec#common#GetSpecDir(config, projectDir . '/src/sub1/sub2/SubModule.hs') == projectDir . '/test/sub1/sub2'
    end

    it 'returns the spec directory and avoids keeping the src tree structure if keep_src_tree = 0'
        let config = {'spec_dir': 'test', 'src_dir': 'src', 'spec_extension': '.hs',
                    \ 'src_extension': '.hs', 'keep_src_tree': 0, 'spec_prefix': '',
                    \ 'spec_suffix': 'Spec', 'runner': '!', 'run_individual_cmd': '',
                    \ 'run_all_cmd': '', 'hook_before': '', 'hook_pass': '', 'hook_fail': ''}
        let projectDir = '/home/user/project'

        Expect spec#common#GetSpecDir(config, projectDir . '/src/sub1/sub2/SubModule.hs') == projectDir . '/test'
    end

    it 'Throws an exception if the file is actually a spec file'
        let projectDir = '/home/user/project'

        let config = {'spec_dir': 'test', 'src_dir': 'src', 'spec_extension': '.hs',
                    \ 'src_extension': '.hs', 'keep_src_tree': 0, 'spec_prefix': '',
                    \ 'spec_suffix': 'Spec', 'runner': '!', 'run_individual_cmd': '',
                    \ 'run_all_cmd': '', 'hook_before': '', 'hook_pass': '', 'hook_fail': ''}
        Expect "spec#common#GetSpecDir(config, projectDir . '/src/sub1/sub2/SubModuleSpec.hs')" to_throw_exception

        let config = {'spec_dir': 'test', 'src_dir': 'src', 'spec_extension': '.hs',
                    \ 'src_extension': '.hs', 'keep_src_tree': 0, 'spec_prefix': 'The',
                    \ 'spec_suffix': '', 'runner': '!', 'run_individual_cmd': '',
                    \ 'run_all_cmd': '', 'hook_before': '', 'hook_pass': '', 'hook_fail': ''}
        Expect "spec#common#GetSpecDir(config, projectDir . '/src/sub1/sub2/TheSubModule.hs')" to_throw_exception

        let config = {'spec_dir': 'test', 'src_dir': 'src', 'spec_extension': '.hs',
                    \ 'src_extension': '.hs', 'keep_src_tree': 0, 'spec_prefix': 'The',
                    \ 'spec_suffix': 'Spec', 'runner': '!', 'run_individual_cmd': '',
                    \ 'run_all_cmd': '', 'hook_before': '', 'hook_pass': '', 'hook_fail': ''}
        Expect "spec#common#GetSpecDir(config, projectDir . '/src/sub1/sub2/TheSubModuleSpec.hs')" to_throw_exception
    end
end
