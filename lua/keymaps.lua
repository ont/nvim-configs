--
-- Various keybindings
--
local cmd = vim.cmd
local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

-- System clipboard yank/paste: alt + y/p
-- TODO: also process selection buffer '*'
map('v', '<a-y>', '"+y', default_opts)
map('n', '<a-p>', '"+p', default_opts)
map('i', '<a-p>', '<c-o>"+p', default_opts)

-- Arrow keys as shortcut for usefull features
-- strip all trailing spaces
map('', '<right>', [[:%s/\s\+$//<CR>:w<CR>]], default_opts)
-- change numeration style
map('', '<left>', ':exec &nu==&rnu? "se nu!" : "se rnu!"<CR>', default_opts)
-- map('', '<up>', ':echoe "Use k"<CR>', {noremap = true, silent = false})
-- map('', '<down>', ':echoe "Use j"<CR>', {noremap = true, silent = false})

----- CTRL+hjkl
-- instead of arrow keys use CTRL-l,h for moving between buffers
map('n', '<c-l>', ':BufferLineCycleNext<CR>', default_opts)
map('n', '<c-h>', ':BufferLineCyclePrev<CR>', default_opts)
-- cmd([[
-- nnoremap <c-j> :cn<CR>
-- nnoremap <c-k> :cp<CR>
-- ]])
-- map('n', '<tab>', ':cn<CR>', default_opts)
-- map('n', '<s-tab>', ':cp<CR>', default_opts)

-- Переводчик рус -> eng
-- map('v', 't', '<Plug>(VTranslate)', {})

-- config reaload
map('n', '<F3>', ':so ~/.config/nvim/init.lua<CR>:so ~/.config/nvim/lua/plugins.lua<CR>:so ~/.config/nvim/lua/settings.lua<CR>:so ~/.config/nvim/lua/keymaps.lua<CR>', { noremap = true })

-----------------------------------------------------------
-- leader keybindings
-----------------------------------------------------------
-- leader to <Space> (used in keymaps below as <Leader>)
vim.g.mapleader = ' '

-- saving file with pressing <Space> then w
map('n', '<Leader>w', ':w<CR>', {})

-- grepping word under cursor
map('n', '<Leader>g', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], default_opts)
map('n', '<Leader>G', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], default_opts)
map('n', '<Leader>d', [[i<c-r>=strftime('%Y-%m-%d')<cr>]], default_opts)

-----------------------------------------------------------
-- Telescope (fzf)
-----------------------------------------------------------
map('n', '<c-t>', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], default_opts)
map('n', '<c-p>', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], default_opts)

-----------------------------------------------------------
-- FN keys
-----------------------------------------------------------
-- <F5> file browser
map('n', '<F5>', ':NvimTreeRefresh<CR>:NvimTreeFindFileToggle<CR>', default_opts)
-- open tree related to current file
map('n', '<S-F5>', ':sp %:h<CR>', default_opts)

-- <F8> tree of classes/methods/properties (majutsushi/tagbar)
map('n', '<F8>', ':TagbarToggle<CR>', default_opts)

-- <F11> spellchecking
-- map('n', '<F11>', ':set spell!<CR>', default_opts)
-- map('i', '<F11>', '<C-O>:set spell!<CR>', default_opts)
