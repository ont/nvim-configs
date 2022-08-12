-- vim.opt.packpath = '~/.config/nvim'
vim.cmd [[packadd packer.nvim]]

return require('packer').startup({function()
    ------------------------------------------
    -- Packer load packer
    ------------------------------------------
    use 'wbthomason/packer.nvim'

    ------------------------------------------
    -- Color scheme(s), syntax
    ------------------------------------------
    use 'joshdick/onedark.vim'
    use 'catppuccin/nvim'
    use 'doums/darcula'
    use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
    use 'rhysd/vim-gfm-syntax'

    ------------------------------------------
    --- Info panels
    ------------------------------------------
    use { 'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
        require('lualine').setup()
    end, }
    -- tabs info line
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons',
    config = function()
        require("bufferline").setup{}
    end, }


    ------------------------------------------
    -- LSP / completion
    ------------------------------------------
    -- highlight, edit, and navigate code using a fast incremental parsing library
    use 'nvim-treesitter/nvim-treesitter'

    -- collection of configurations for built-in LSP client
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    -- autocomplete
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'saadparwaiz1/cmp_luasnip'
    -- autocomplete for filesystem
    use 'hrsh7th/cmp-path'
    -- snippets plugin
    use 'L3MON4D3/LuaSnip'
    use "rafamadriz/friendly-snippets"
    -- .editorconfig support
    use 'editorconfig/editorconfig-vim'

    -----------------------------------------------------------
    -- Navigation
    -----------------------------------------------------------
    -- Filemanager
    use { 'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end, }
    -- Classes and functions
    use 'majutsushi/tagbar'
    -- Telescope (replacement for fzf and ack)
    use { 'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function() require'telescope'.setup {} end, }

    -----------------------------------------------------------
    -- GIT
    -----------------------------------------------------------
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'

    -----------------------------------------------------------
    -- Golang
    -----------------------------------------------------------
    -- use 'jose-elias-alvarez/null-ls.nvim'
    -- use 'WhoIsSethDaniel/goldsmith.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'
    use 'crispgm/nvim-go'

    -----------------------------------------------------------
    -- TODO / Zettelkasten
    -----------------------------------------------------------
    -- use "oberblastmeister/neuron.nvim"
    -- use "nvim-lua/plenary.nvim"
    -- use 'nvim-lua/popup.nvim'
    -- use "nvim-telescope/telescope.nvim"

    -----------------------------------------------------------
    -- Usefull plugins
    -----------------------------------------------------------
    use 'jiangmiao/auto-pairs'
    -- use 'skanehira/translate.vim'
    -- use 'nvim-lua/popup.nvim'
end,
config = {
    log = { level = 'debug' }
}})
