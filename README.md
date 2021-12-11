# Overview
Nvim as IDE for golang developers (and possibly other languages supported by plugins).

Main feautures:
- LSP-based features
   - completions
   - hinting / linting
   - go to definition/references/etc...
- snippets
- fuzzy completions for LSP/snippets/etc...
- full-text grep
- fuzzy file searching with preview (ctrl-p, fzf analogue)
- project file tree preview
- source file classes/methods/vars tree preview

TODO:
- delve (debugger) support
- interactive terminal / `:GoRun`
- bugfixies

# Before you begin
Configure font rendering in your system and select good monospace font for nvim. Rendered text must be:
- crisp (minimal blur edges)
- readable
- not too small/large
This will provide you with a foundation to work comfortably.

Personally I achive this goals with:
- `neovide` gui frontend for nvim (uses custom opengl font rendering engine).
- `guifont=Liberation\ Mono:h9.3` (must be installed in system, check with `fc-list : family style | grep -i liberation`)

Below all `nvim` commands are alias for `neovide`.

# Installation
1. clone this repository into `~/.config/nvim` path.
2. install packer https://github.com/wbthomason/packer.nvim#quickstart
3. run `nvim +PackerSync`
4. run `nvim +GoInstallBinaries`
5. inside nvim run `:TSInstall go gomod html javascript vue` and `:TSInstall <filetype>` for each `filetype` your work with (supports tab-completions).

# Keybindings

F keys:
- `F3` - reload nvim config files
- `F5` - project tree
- `F8` - source code tree

LSP keys:
- `gi` - go implementation
- `gd` - LSP go to definition
- `<space>D` - go to type of object
- `K` - show popup hint about object under cursor
- `<space>rn` - rename word under cursor (refactoring)

Autocomplete keys:
- `<c-space>` - force autocomplete
- `<c-e>` - cancel autocomplete
- `<c-b>`, `<c-f>` - scroll docs
- `<cr>` - confirm autocomplete

Fuzzy searching / navigation:
- `<c-t>` - find files in project dir
- `<c-p>` - find opened buffer
- `<c-h>`/`<c-l>` - prev/next buffer (ctrl + vim-style left-right)

Other stuff:
- `<space>w` - write current file
- `right arrow` - change numbering
- `left arrow` - strip trailng spaces and save
- `<a-y>`/`<a-p>` - alt + yand/paste from system clipboard buffer
