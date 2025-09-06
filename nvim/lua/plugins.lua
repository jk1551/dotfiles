return {
  -- Telescope fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
    end,
  },

  -- add theme
  {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000
  },

  {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
          require("nvim-treesitter.configs").setup {
              ensure_installed = {
              "lua", "javascript", "typescript", "python", "c", "cpp", "rust", "json", "yaml", "html", "css", "c_sharp"
              },
              highlight = { enable = true },
              indent = { enable = true },
          }
      end,
  },
    {
        "saghen/blink.cmp",
        version = "*",
        dependencies = { "rafamadriz/friendly-snippets" },
        event = "InsertEnter",
        opts = {
            fuzzy = { implementation = "lua" },
            snippets = {
                expand = function(snippet, _)
                    require("luasnip").lsp_expand(snippet)
                end,
            },
            appearance = {
                nerd_font_variant = "mono",
            },
            trigger = {
                completion = {
                    show_on_trigger_character = true,
                },
            },
            completion = {
                documentation = { auto_show = true, auto_show_delay_ms = 200 },
                accept = { auto_brackets = { enabled = true }},
                menu = {
                    auto_show = true,
                },
                trigger = {
                    show_on_trigger_character = true,
                },
            },
            {
                sources = {
                    default = { "lsp", "path", "snippets", "buffer" }
                }
            },
            {
                cmdline = { enabled = true },
                keymap = {
                    preset = "enter",
                    ["<C-y>"] = { "select_and_accept" },
                }
            }

        },
        opts_extend = { "sources.default" }
    }
}

