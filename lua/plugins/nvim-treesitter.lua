return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = { "cpp" },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        init = function()
            -- Disable entire built-in ftplugin mappings to avoid conflicts.
            -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
            vim.g.no_plugin_maps = true
            -- Or, disable per filetype (add as you like)
            -- vim.g.no_python_maps = true
            -- vim.g.no_ruby_maps = true
            -- vim.g.no_rust_maps = true
            -- vim.g.no_go_maps = true
            -- require("nvim-treesitter-textobjects").setup {
            --     textobjects = {
            --         lsp_interop={
            --             enable=true,
            --             peek_definition_code ={
            --                 ["<leader>df"] = "@function.outer"
            --             }
            --         }
            --     }
            -- }
        end,
        config = function()
            -- require("nvim-treesitter-textobjects").setup {
            -- }
        end,

        -- opts = {
        --     textobjects = {
        --         lsp_interop = {
        --             enable = true,
        --             border = 'rounded',
        --             floating_preview_opts = {},
        --             peek_definition_code = {
        --                 ["<leader>df"] = "@function.outer",
        --                 ["<leader>dF"] = "@class.outer",
        --             },
        --         },
        --     },
        -- },
    }
}
