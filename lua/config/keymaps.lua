--
-- Aliases
--
local cmd = vim.cmd
local map = vim.keymap.set
local default_opts = {noremap = true, silent = true}

--
-- Common
--
-- leader to <Space> (used in keymaps below as <Leader>)
vim.g.mapleader = ' '

-- system clipboard yank/paste: alt + y/p
-- TODO: also process selection buffer '*'
map('v', '<a-y>', '"+y', default_opts)
map('n', '<a-p>', '"+p', default_opts)
map('i', '<a-p>', '<c-o>"+p', default_opts)

-- paste current date
map('n', '<Leader>d', [[i<c-r>=strftime('%Y-%m-%d')<cr>]], default_opts)

-- next/previous for quick buffer (CTRL-Q in telescope, LSP references...)
map('n', '<c-j>', ':cn<CR>', default_opts)
map('n', '<c-k>', ':cp<CR>', default_opts)

--
-- Telescope (fzf)
--
local has_tele, tele = pcall(require,'telescope.builtin')
if has_tele then
    map('n', '<c-t>', tele.find_files, default_opts)
    map('n', '<c-p>', tele.buffers, default_opts)
    map('n', '<Leader>g', tele.grep_string, default_opts)
    map('n', '<Leader>G', tele.live_grep, default_opts)
end

--
-- Nvim Tree
--
map('n', '<F5>', ':NvimTreeRefresh<CR>:NvimTreeFindFileToggle<CR>', default_opts)
map('n', '<Leader>p', ':NvimTreeRefresh<CR>:NvimTreeFindFileToggle<CR>', default_opts)

--
-- <F8> tree of classes/methods/properties (majutsushi/tagbar)
--
map('n', '<F8>', ':TagbarToggle<CR>', default_opts)

--
-- Lsp related
--
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(e)
    local bufopts = { buffer = e.buf, noremap = true, silent = true, nowait = true }
    -- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "ge", function()
        vim.diagnostic.jump({count=1})
        vim.diagnostic.open_float()
    end, bufopts)
    vim.keymap.set("n", "gE", function()
        vim.diagnostic.jump({count=-1})
        vim.diagnostic.open_float()
    end, bufopts)
  end,
})
