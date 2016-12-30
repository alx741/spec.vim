source autoload/spec/run.vim
source t/vspec/matchers.vim
call vspec#matchers#load()


describe 'ComposeCommand'
    it 'returns an Ex command for executing all the tests'
        let config = {'spec_dir': 'test', 'src_dir': 'src', 'spec_extension': '.hs', 'src_extension': '.hs',
                    \ 'spec_prefix': '', 'spec_suffix': 'Spec', 'runner': '!', 'run_individual_cmd': '',
                    \ 'run_all_cmd': 'Builder test', 'hook_before': '', 'hook_pass': '', 'hook_fail': ''}
        Expect spec#run#ComposeCommand(config, 'all', '') ==? '! Builder test'

        let config = {'spec_dir': 'test', 'src_dir': 'src', 'spec_extension': '.hs', 'src_extension': '.hs',
                    \ 'spec_prefix': '', 'spec_suffix': 'Spec', 'runner': 'Dispatch', 'run_individual_cmd': '',
                    \ 'run_all_cmd': 'Builder test', 'hook_before': '', 'hook_pass': '', 'hook_fail': ''}
        Expect spec#run#ComposeCommand(config, 'all', '') ==? 'Dispatch Builder test'

        let config = {'spec_dir': 'test', 'src_dir': 'src', 'spec_extension': '.hs', 'src_extension': '.hs',
                    \ 'spec_prefix': '', 'spec_suffix': 'Spec', 'runner': 'AsyncRun', 'run_individual_cmd': '',
                    \ 'run_all_cmd': 'Builder test', 'hook_before': '', 'hook_pass': '', 'hook_fail': ''}
        Expect spec#run#ComposeCommand(config, 'all', '') ==? 'AsyncRun Builder test'
    end

    it 'returns an Ex command for executing and individual {spec}'
        let config = {'spec_dir': 'test', 'src_dir': 'src', 'spec_extension': '.hs', 'src_extension': '.hs',
                    \ 'spec_prefix': '', 'spec_suffix': 'Spec', 'runner': '!', 'run_individual_cmd': 'Builder {spec}',
                    \ 'run_all_cmd': 'Builder test', 'hook_before': '', 'hook_pass': '', 'hook_fail': ''}
        Expect spec#run#ComposeCommand(config, 'individual', 'project/test/ModuleSpec.hs') ==? '! Builder project/test/ModuleSpec.hs'

        let config = {'spec_dir': 'test', 'src_dir': 'src', 'spec_extension': '.hs', 'src_extension': '.hs',
                    \ 'spec_prefix': '', 'spec_suffix': 'Spec', 'runner': 'Dispatch', 'run_individual_cmd': 'Builder test {spec}',
                    \ 'run_all_cmd': 'Builder test', 'hook_before': '', 'hook_pass': '', 'hook_fail': ''}
        Expect spec#run#ComposeCommand(config, 'individual', '../ModuleSpec.hs') ==? 'Dispatch Builder test ../ModuleSpec.hs'
    end

    it 'returns an Ex command for executing and individual {spec} with hooks'
        let config = {'spec_dir': 'test', 'src_dir': 'src', 'spec_extension': '.hs', 'src_extension': '.hs',
                    \ 'spec_prefix': '', 'spec_suffix': 'Spec', 'runner': '!', 'run_individual_cmd': 'Builder {spec}',
                    \ 'run_all_cmd': 'Builder test', 'hook_before': 'tddlight yellow', 'hook_pass': '', 'hook_fail': ''}
        Expect spec#run#ComposeCommand(config, 'individual', 'project/test/ModuleSpec.hs') ==?
                    \ '! tddlight yellow && Builder project/test/ModuleSpec.hs'

        let config = {'spec_dir': 'test', 'src_dir': 'src', 'spec_extension': '.hs', 'src_extension': '.hs',
                    \ 'spec_prefix': '', 'spec_suffix': 'Spec', 'runner': '!', 'run_individual_cmd': 'Builder {spec}',
                    \ 'run_all_cmd': 'Builder test', 'hook_before': 'tddlight yellow', 'hook_pass': 'tddlight green', 'hook_fail': ''}
        Expect spec#run#ComposeCommand(config, 'individual', 'project/test/ModuleSpec.hs') ==?
                    \ '! tddlight yellow && Builder project/test/ModuleSpec.hs && tddlight green'

        let config = {'spec_dir': 'test', 'src_dir': 'src', 'spec_extension': '.hs', 'src_extension': '.hs',
                    \ 'spec_prefix': '', 'spec_suffix': 'Spec', 'runner': 'Dispatch', 'run_individual_cmd': 'Builder {spec}',
                    \ 'run_all_cmd': 'Builder test', 'hook_before': 'tddlight yellow',
                    \ 'hook_pass': 'tddlight green', 'hook_fail': 'tddlight red'}
        Expect spec#run#ComposeCommand(config, 'individual', 'project/test/ModuleSpec.hs') ==?
                    \ 'Dispatch tddlight yellow && Builder project/test/ModuleSpec.hs && tddlight green || tddlight red'

        let config = {'spec_dir': 'test', 'src_dir': 'src', 'spec_extension': '.hs', 'src_extension': '.hs',
                    \ 'spec_prefix': '', 'spec_suffix': 'Spec', 'runner': 'Dispatch', 'run_individual_cmd': 'Builder {spec}',
                    \ 'run_all_cmd': 'Builder test', 'hook_before': 'tddlight yellow',
                    \ 'hook_pass': '', 'hook_fail': 'tddlight red'}
        Expect spec#run#ComposeCommand(config, 'individual', 'project/test/ModuleSpec.hs') ==?
                    \ 'Dispatch tddlight yellow && Builder project/test/ModuleSpec.hs || tddlight red'

        let config = {'spec_dir': 'test', 'src_dir': 'src', 'spec_extension': '.hs', 'src_extension': '.hs',
                    \ 'spec_prefix': '', 'spec_suffix': 'Spec', 'runner': 'Dispatch', 'run_individual_cmd': 'Builder {spec}',
                    \ 'run_all_cmd': 'Builder test', 'hook_before': '', 'hook_pass': '', 'hook_fail': 'tddlight red'}
        Expect spec#run#ComposeCommand(config, 'individual', 'project/test/ModuleSpec.hs') ==?
                    \ 'Dispatch Builder project/test/ModuleSpec.hs || tddlight red'
    end
end
