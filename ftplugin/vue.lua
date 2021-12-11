-- TODO: make functions for ident_config(<size>)
local buf_opt = vim.bo
buf_opt.expandtab = true      -- use spaces instead of tabs
buf_opt.shiftwidth = 2        -- shift 4 spaces when tab
buf_opt.tabstop = 2           -- 1 tab == 4 spaces
buf_opt.smartindent = true    -- autoindent new lines
