[![CircleCI](https://circleci.com/gh/alx741/spec.vim.svg?style=shield)](https://circleci.com/gh/alx741/spec.vim)

# spec.vim

BDD (Behavior Driven Development) helper plugin that provides commands for easy
jumping, creating and running spec test files for various supported languages.

Created spec files can have per-Language configurable boilerplate with
placeholder expansions. It also creates the spec test files following the *src*
directory structure and it's smart enough to prevent you from accidentally
creating spec files for the spec files.

Run your tests in any way you prefer: blocking, using a terminal multiplexer or
taking advantage of Vim 8 and NeoVim's asynchronicity, and use hooks to execute
commands before, and after running the tests (handy for things like [the TDD
traffic light](https://github.com/alx741/tdd_traffic-light) or automatic
deploying when tests pass). When running a spec file in particular, it doesn't
matter if your currently in the source file or the spec file, *spec.vim* will do
the right thing.

**NOTE**: the doc file `:h spec.vim` holds more detailed information than this
README file.


## Currently supported languages

Any BDD framework can be used by customizing the boilerplate for each language.
*spec.vim* ships with some defaults for the listed frameworks.

* C++ [(Igloo)](http://igloo-testing.org/)
* Go [(GoConvey)](http://goconvey.co/)
* Haskell [(Hspec)](https://hspec.github.io/)
* Java [(JDave)](http://jdave.org/)
* JavaScript [(Jasmine)](https://jasmine.github.io/)
* PHP [(PHPspec)](http://www.phpspec.net/en/stable/)
* Python [(Behave)](http://pythonhosted.org/behave/)
* Ruby [(Rspec)](http://rspec.info/)
* Rust [(Rust-Rspec)](https://github.com/mackwic/rspec)
* VimL [(Vspec)](https://github.com/kana/vim-vspec)


## Installation

Compatible with `Vundle`, `Pathogen`, `Vim-plug`.


## Usage

**spec.vim** provides some default mappings:

Map | Command | Action
--- | ------- | ------
**ghs** | :SpecOpen | Toggle between source file and corresponding spec file
**ghS** | :SpecCreate | Create a spec file for the current source file


There are commands and mappings variations available for opening and creating
spec files in a new horizontal or vertical window split:

Map | Command | Action
--- | ------- | ------
**ghhs** | :SpecHOpen | Open in horizontal split
**ghvs** | :SpecVOpen | Open in vertical split
**ghhS** | :SpecHCreate | Create spec file in horizontal split
**ghvS** | :SpecVCreate | Create spec file in vertical split


Running tests:

Map | Command | Action
--- | ------- | ------
**ghr** | :SpecRun | Run the spec for the current file
**ghR** | :SpecRunAll | Run all the tests


For fast editing boilerplate files use:

Map | Command | Action
--- | ------- | ------
**ghE** | :SpecEdit | Edit the boilerplate file for the current language


### Boilerplate

When a new spec file is created with `:SpecCreate` or variants, some
per-language boilerplate will be added by default, you can customize it by
editing the language corresponding file in the `boilerplate` directory.

Boilerplate files have the name of the target language and the language
extension.

Placeholders in the boilerplate files are surrounded by `%` and will be expanded
when spec files are created. Available placeholders are:

* **%srcName%**: The name of the source file (without the extension)
* **%specName%**: The name of the spec file (without the extension)
* **%srcDir%**: The sources directory name
* **%specDir%**: The specs directory name
* **%srcExt%**: The source files extension
* **%specExt%**: The spec files extension
* **%srcFilePath%**: The path to the source file (without the source directory
  name, nor the source file name)


## Configuration

Disable predefined mappings:

```vim
let g:spec_disable_maps = 1
```

Change the boilerplate files directory:

```vim
let g:spec_boilerplate_dir = ~/.boilerplate
```

Disable boilerplate:

```vim
let g:spec_boilerplate_disable = 1
```

### Per-language configuration

You can configure the directories where your spec test files and normal source
files are kept as well as the prefix and suffix the spec files should have, so
for instance: a Ruby `src/module.rb` source file will have a corresponding
`spec/module_spec.rb` spec file, but a Haskell `src/Module.hs` will have a
`test/ModuleSpec.hs` spec file.

To change the default settings of a **language**, declare in your *.vimrc*:

```vim
let g:spec_language = {
    \   'spec_dir': 'spec',
    \   'src_dir': 'src',
    \   'spec_extension': '.rb',
    \   'src_extension': '.rb',
    \   'keep_src_tree': 1,
    \   'spec_prefix': '',
    \   'spec_suffix': 'Spec',
    \   'runner': '!',
    \   'run_individual_cmd': 'rspec {spec}',
    \   'run_all_cmd': 'rspec',
    \   'hook_before': '',
    \   'hook_pass': '',
    \   'hook_fail': ''
    \ }
```

* `spec_dir` is the name of the directory where your spec files live
* `src_dir` is the name of the directory where your source files live
* `spec_extension` is the extension of the spec files, useful for frameworks
  with plain text spec files without extension
* `src_extension` is the extension of the source files, usually the language
  extension
* `keep_src_tree` tells if the source directory structure (tree) should be
  preserved in the specs directory
* `spec_prefix` is the spec file name prefix
* `spec_suffix` is the spec file name suffix
* `runner` The vim command to use for running the test commands. `!` is
  blocking, but you can try `Dispatch` (from
  [vim-dispatch](https://github.com/tpope/vim-dispatch)), `AsyncRun` (from
  [asyncrun.vim](https://github.com/skywind3000/asyncrun.vim)),
  `VimuxRunCommand` (from [vimux](https://github.com/benmills/vimux)), etc.
* `run_individual_cmd` the shell command for running the `{spec}` file
* `run_all_cmd` the shell command to use for running all the tests
* `hook_before` the shell command to execute before running the tests
* `hook_pass` the shell command to execute when tests pass
* `hook_fail` the shell command to execute when tests fail

For more information about runners and hooks see `:h spec.vim`


## Testing spec.vim

*spec.vim* is tested using `vim-vspec` (the same framework it supports by
default for VimL). In order to run the test you need `ruby`, `rake` and
`bundler`.

```sh
make test
```
