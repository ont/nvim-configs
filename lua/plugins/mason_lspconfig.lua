return {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    opts = {
        automatic_enable = true,
    },
    config = function(_, opts)
        require("mason-lspconfig").setup(opts)

        -- gopls is installed outside Mason, so mason-lspconfig will not
        -- auto-enable it.
        vim.lsp.enable("gopls")
    end,
}
