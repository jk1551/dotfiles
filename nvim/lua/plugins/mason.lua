return {
    -- Mason installer
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    -- Mason + LSP config
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            local mason_lspconfig = require("mason-lspconfig")
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            mason_lspconfig.setup({
                ensure_installed = { "omnisharp", "ts_ls" },
            })

            lspconfig.omnisharp.setup({
                capabilities = capabilities,
            })

           lspconfig.ts_ls.setup({
                capabilities = capabilities
            }) 
        end,
    },
}

