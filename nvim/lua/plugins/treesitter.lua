return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = {
                    "lua", "javascript", "typescript", "python",
                    "c", "cpp", "rust", "json", "yaml", "html",
                    "css", "c_sharp"
                },
                highlight = { enable = true },
                indent = { enable = true },
            }
        end,
    },
}

