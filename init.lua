--
-- Main config file.
-- import config from separate files.
-- SEE: https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
-- SEE: https://habr.com/ru/post/586808/ 
--
require('plugins')        -- load all plugins
require('settings')       -- general settings & settings for plugins
require('lsp-config')     -- separate config for all LSP stuff
require('keymaps')        -- apply custom keymaps
require('autocommands')   -- custom autocommands
