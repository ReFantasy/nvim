return {
    "neovim/nvim-lspconfig",
    opts = {
        inlay_hints = {
            enabled = false,
        },
        servers = {
            ['*'] = {
                keys = {
                    -- Add a keymap
                    -- { "H", "<cmd>echo 'hello'<cr>", desc = "Say Hello" },
                    -- Change an existing keymap
                    -- { "K", "<cmd>echo 'custom hover'<cr>", desc = "Custom Hover" },
                    -- Disable a keymap
                    -- { "gd", false },
                    {
                        "<leader>rn",
                        vim.lsp.buf.rename,
                        desc = "Find Plugin File",
                    },
                },
            },
            basedpyright = {
                settings = {
                    basedpyright = {
                        analysis = { typeCheckingMode = "off" },
                    },
                },
            },
            clangd = {
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy=false",
                    "--all-scopes-completion",
                    "--completion-style=detailed",
                    "-j=8",
                    "--pch-storage=memory",
                    "--fallback-style=Microsoft",
                    "--pretty",
                    -- "--header-insertion=iwyu", -- 自动插入头文件iwyu
                    "--header-insertion=never",
                    "--header-insertion-decorators", -- 使用修饰符来标记插入的头文件
                    --"-Wno-unused",
                },
            },
        },
    },
}
