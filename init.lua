require("config.lazy")
require("config.settings")
require("config.keymaps")

-- Configure autostart for gopls
-- SEE: https://dx13.co.uk/articles/2023/04/24/neovim-lsp-without-plugins/ 
-- local autocmd = vim.api.nvim_create_autocmd
-- autocmd("FileType", {
--     pattern = "go",
--     callback = function()
--         local root_dir = vim.fs.dirname(
--             vim.fs.find({ 'go.mod', 'go.work', '.git' }, { upward = true })[1]
--         )
--         local client = vim.lsp.start({
--             name = 'gopls',
--             cmd = { 'gopls' },
--             root_dir = root_dir,
--         })
--         vim.lsp.buf_attach_client(0, client)
--     end
-- })



-- vim.lsp.enable("gopls")
-- require("lspconfig").gopls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   cmd = {"gopls"},
--   filetypes = { "go", "gomod", "gowork", "gotmpl" },
--   root_dir = util.root_pattern("go.work", "go.mod", ".git"),
--   settings = {
--     gopls = {
--       completeUnimported = true,
--       usePlaceholders = true,
--       analyses = {
--         unusedparams = true,
--       },
--     },
--   },
-- }
