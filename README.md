# Overview
Nvim as IDE for golang developers (and possibly other languages supported by plugins).

Main features:
- LSP-based features
   - completions
   - hinting / linting
   - go to declaration/definition/references/etc...
- snippets
- fuzzy completions for LSP/snippets/etc...
- full-text grep
- fuzzy file searching with preview (ctrl-p, fzf analogue)
- project file tree preview
- Go formatting, linting, testing helpers
- git integration
- database UI helpers

TODO:
- delve (debugger) support
- bugfixes

# Screenshots
Some key functions in action are displayed here:
![main](https://user-images.githubusercontent.com/350218/145688949-9f1b431b-2719-4cb2-88de-c89417017130.png)


# Before you begin
Configure font rendering in your system and select good monospace font for nvim. Rendered text must be:
- crisp (minimal blur edges)
- readable
- not too small/large

This will provide you with a foundation to work comfortably.

Personally I achieve this with:
- `neovide` gui frontend for nvim (uses custom opengl font rendering engine).
- `guifont=Liberation\ Mono:h9.3` (must be installed in system, check with `fc-list : family style | grep -i liberation`)
- `nerd-fonts-noto-sans-mono` must be installed in Arch for cool utf symbols inside nvim.

Below all `nvim` commands are alias for `neovide`.

# Installation
1. clone this repository into `~/.config/nvim` path.
2. start `nvim`; lazy.nvim will bootstrap itself and install plugins.
3. run `:Lazy sync` if plugins were not installed automatically.
4. run `:GoInstallBinaries` to install Go tools, including `gopls`, goimports, revive, staticcheck, and others.
5. optionally run `:Mason` to install/manage other language servers.
6. inside nvim run `:TSInstall go gomod html javascript vue` and `:TSInstall <filetype>` for each `filetype` you work with (supports tab-completions).

# Keybindings

F keys:
- `F5` - project tree

LSP keys:
- `gD` - go to declaration
- `gd` - go to definition
- `gt` - go to type definition
- `gi` - go to implementation
- `gr` - go to references to variable/method/etc under cursor
- `K` - show popup hint about object under cursor (Neovim LSP default)
- `grn` - rename word under cursor (Neovim LSP default)
- `gO` - document symbols (Neovim LSP default)
- insert-mode `<C-S>` - signature help (Neovim LSP default)

Diagnostics:
- `ge` - next diagnostic and open diagnostic popup
- `gE` - previous diagnostic and open diagnostic popup

Diagnostics are available through signs, underlines, and diagnostic floats.
Use `ge` / `gE` to jump between diagnostics and open the diagnostic popup.

Autocomplete keys:
- `<c-space>` - force autocomplete
- `<c-e>` - cancel autocomplete
- `<c-n>`, `<c-p>` / `up`, `down` - select next/previous item
- `<cr>` - confirm autocomplete

Fuzzy searching / navigation:
- `<c-t>` - find files in project dir
- `<c-p>` - find opened buffer
- `<space>g` - grep word under cursor
- `<space>G` - live grep
- `<c-j>`/`<c-k>` - next/previous quickfix entry

Other stuff:
- `<space>w` - write current file
- `<space>d` - paste current date
- `<space>p` - project tree
- `<a-y>`/`<a-p>` - alt + yank/paste from system clipboard buffer

# Useful commands

- `:Lazy` - plugin manager UI
- `:Mason` - external tools and language servers manager
- `:GoInstallBinaries` - install Go tools used by nvim-go
- `:GoFormat` - format Go files
- `:TSInstall` - install TreeSitter lang modules
- `:G` or `:Git` - run vim-fugitive (plugin for git)
