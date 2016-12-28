# spec.vim

BDD (Behavior Driven Development) helper plugin that provides commands for easy
jumping, creating and running spec test files for various supported languages.

Created spec files can have per-Language configurable boilerplate with
placeholder expansions. It also creates the spec test files following the *src*
directory structure and it's smart enough to prevent you from accidentally
creating spec files for the spec files.


## Currently supported languages

* Haskell
* PHP
* Ruby


## Installation

Compatible with `Vundle`, `Pathogen`, `Vim-plug`.


## Usage

**spec.vim** provides some default mappings:

Map | Command | Action
--- | ------- | ------
**ghs** | :SpecOpen | Jump the spec file for the current source file
**ghS** | :SpecCreate | Create a spec file for the current source file

### Boilerplate

When a new spec file is created with `:SpecCreate`, some per-language
boilerplate will be added by default, you can customize it by editing the
language corresponding file in the `boilerplate` directory.

Boilerplate files have the name of the target language and the language
extension.

Placeholders in the boilerplate files are surrounded by `%` and will be expanded
when spec files are created. Available placeholders are:

* **srcName**: The name of the source file (without the extension)
* **specName**: The name of the spec file (without the extension)


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
    \   'spec_dir': 'test',
    \   'src_dir': 'src',
    \   'prefix': '',
    \   'suffix': 'Spec'
    \ }
```
