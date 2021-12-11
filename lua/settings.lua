local cmd = vim.cmd             -- execute Vim commands
local exec = vim.api.nvim_exec  -- execute Vimscript
local g = vim.g                 -- global variables
local opt = vim.opt             -- global/buffer/windows-scoped options

-----------------------------------------------------------
-- Main
-----------------------------------------------------------
-- visuals / gui
opt.colorcolumn = '80'        -- vertical visual line on 80-column
opt.cursorline = true         -- highlight cursor line
opt.foldcolumn = '1'          -- size for fold column (show always)
opt.laststatus = 2            -- always show status line
opt.number = true             -- enable lines numbering
opt.signcolumn = 'yes'        -- always show column for linting errors (no flickering)
opt.relativenumber = false    -- relative line numbering
opt.splitright = true         -- vertical split to the right
opt.splitbelow = true         -- horizontal split to the bottom
opt.scrolloff = 7             -- scroll when cursor on 7-th line from buffer bottom

opt.termguicolors = true      --  24-bit RGB colors
cmd([[
set guifont=Roboto\ Mono\ Medium\ [GOOG]:h9:w57
set guifont=Bitstream\ Vera\ Sans\ Mono:h9.5
set guifont=ProggyCleanTT:h12
set guifont=Terminus:h9
set guifont=Noto\ Sans\ Mono:h9.3
set guifont=Liberation\ Mono:h9.3
]])

-- g.Guifont='Fantasque Sans Mono:h12'
-- cmd'GuiFont Fantasque Sans Mono:h12'
-- cmd'colorscheme onedark'    -- color theme
-- cmd'colorscheme catppuccin' -- color theme
opt.background = 'dark'
cmd'colorscheme gruvbox' -- color theme

-- text editing
opt.wrap = false         -- long lines: no wrap
opt.virtualedit = 'all'  -- edit out of line end
cmd([[
filetype indent plugin on
syntax enable
]])
opt.expandtab = true      -- use spaces instead of tabs
opt.shiftwidth = 4        -- shift 4 spaces when tab
opt.tabstop = 4           -- 1 tab == 4 spaces
opt.smartindent = true    -- autoindent new lines

opt.formatoptions:append('j') -- remove comment leader when joining via J
-- opt.complete=.,w,b,t,i,u,U

-- search/replace
opt.ignorecase = true       -- i by default
opt.smartcase  = true       -- noignorecase for ThatText
opt.gdefault   = true       -- default g in substitution
opt.inccommand = 'nosplit'  -- live substitution for %s/.../.../

-- file read/save
opt.autoread    = true    -- auto re-read if modified
opt.hidden      = true    -- allow unsaved changes for buffers
opt.undofile    = true    -- do undo files
opt.writebackup = false   -- do backups
opt.swapfile    = false   -- disable swap files
opt.undodir   = '~/.local/share/nvim/undo/'
opt.backupdir = '~/.local/share/nvim/backup/'
opt.directory = '~/.local/share/nvim/swap/'


-----------------------------------------------------------
-- Other
-----------------------------------------------------------
-- Hightlight copyied text
exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup end
]], false)

-----------------------------------------------------------
-- Languages
-----------------------------------------------------------
-- dictionaries
opt.spelllang= { 'en_us', 'ru' }  
-- Translate direction
g.translate_source = 'ru'
g.translate_target = 'en'

opt.langmap='ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчняж;abcdefghijklmnopqrstuvwxyz;'
-- NOTE: autocmd have probably incorrect behaviour: it only works when 
-- switching to command or visual mode. Switching to normal mode doesn't trigger it.
cmd([[
autocmd InsertLeave * :silent !xkb-switch -s us
]])

-----------------------------------------------------------
-- Plugins
-- TODO: separate file
-----------------------------------------------------------
-- TreeSitter
-- TODO: automatically call ":TSInstall go"
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- custom_captures = {
    --   -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
    --   ["foo.bar"] = "Identifier",
    -- },
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true
  }
}

-- -- neuron
-- require'neuron'.setup {
--     virtual_titles = true,
--     mappings = true,
--     run = nil, -- function to run when in neuron dir
--     neuron_dir = "~/zk", -- the directory of all of your notes, expanded by default (currently supports only one directory for notes, find a way to detect neuron.dhall to use any directory)
--     leader = "gz", -- the leader key to for all mappings, remember with 'go zettel'
-- }

-- crispgm/nvim-go
require('go').setup{
    -- auto commands
    auto_format = true,
    auto_lint = true,
    -- linters: revive, errcheck, staticcheck, golangci-lint
    linter = 'revive',
    -- lint_prompt_style: qf (quickfix), vt (virtual text)
    lint_prompt_style = 'vt',
    -- formatter: goimports, gofmt, gofumpt
    formatter = 'goimports',
    -- test flags: -count=1 will disable cache
    test_flags = {'-v'},
    test_timeout = '30s',
    test_env = {},
    -- show test result with popup window
    test_popup = true,
    test_popup_width = 80,
    test_popup_height = 10,
    -- test open
    test_open_cmd = 'edit',
    -- struct tags
    tags_name = 'json',
    tags_options = {'json=omitempty'},
    tags_transform = 'snakecase',
    tags_flags = {'-skip-unexported'},
    -- quick type
    quick_type_flags = {'--just-types'},
}

-- LuaSnip
require("luasnip/loaders/from_vscode").lazy_load()
local luasnip = require('luasnip')
local cmp = require("cmp")

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

_G.tab_complete = function()
    if luasnip and luasnip.expand_or_jumpable() then
        return t("<Plug>luasnip-expand-or-jump")
    elseif check_back_space() then
        return t "<Tab>"
    else
        cmp.complete()
    end
    return ""
end
_G.s_tab_complete = function()
    if luasnip and luasnip.jumpable(-1) then
        return t("<Plug>luasnip-jump-prev")
    else
        return t "<S-Tab>"
    end
    return ""
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})

-- jiangmiao/auto-pairs
g.AutoPairsFlyMode = 1
g.AutoPairsShortcutToggle = '<M-[>'
g.AutoPairsShortcutFastWrap = '<M-g>'
g.AutoPairsShortcutBackInsert = '<M-b>'
