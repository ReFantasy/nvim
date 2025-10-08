vim.pack.add {
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    -- dependencies
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
}

require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "cpp" },
    textobjects = {
        lsp_interop = {
            enable = true,
            -- border = "single",
            floating_preview_opts = {
                border = "rounded",
            },
            peek_definition_code = {
                -- ["gk"] = "@function.outer",
                -- ["<leader>dF"] = "@class.outer",
                ["gk"] = {
                    query = "@function.outer",
                    desc = "[Treesitter] Peek definition code (function). Press the shortcut twice to enter the floating window.",
                },
                ["gK"] = {
                    query = "@class.outer",
                    desc = "[Treesitter] Peek definition code (class). Press the shortcut twice to enter the floating window.",
                },
            },
        },
    },
}

-- require 'nvim-treesitter.configs'.setup {
--     ensure_installed = { "cpp", "lua" },
--     textobjects = {
--         lsp_interop = {
--             enable = true,
--             border = 'none',
--             floating_preview_opts = {},
--             peek_definition_code = {
--                 ["<leader>df"] = "@function.outer",
--                 ["<leader>dF"] = "@class.outer",
--             },
--         },
--     },
-- }
