vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    -- Use a sharp border with `FloatBorder` highlights
    border = "rounded", -- "single", "double", "rounded", "solid", "shadow"
    -- add the title in hover float window
    title = " Preview ",
})
vim.diagnostic.config {
    virtual_text = {
        spacing = 4,
        prefix = '',
    },
    float = {
        severity_sort = true,
        source = 'if_many',
        border = 'single',
    },
    severity_sort = true,
    signs = {
        -- text = {
        --   [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
        --   [vim.diagnostic.severity.WARN] = icons.diagnostics.Warn,
        --   [vim.diagnostic.severity.INFO] = icons.diagnostics.Info,
        --   [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
        -- },
    },
}

local servers = {
    lua_ls = {
        settings = {
            Lua = {
                completion = {
                    callSnippet = "Replace",
                },
            },
        },
    },
    -- pyright = {
    -- 	settings = {
    -- 		python = {
    -- 			analysis = {
    -- 				autoSearchPaths = true,
    -- 				diagnosticMode = "workspace", --"openFilesOnly",
    -- 				useLibraryCodeForTypes = true,
    -- 				autoImportCompletions = true,
    -- 				typeCheckingMode = "off", -- "off", "basic", "standard", "strict"
    -- 				diagnosticSeverityOverrides = {
    -- 					-- Use the rule name as a key and one of "error," "warning," "information," "true," "false," or "none" as value.
    -- 					reportInvalidTypeForm = "none",
    -- 					reportArgumentType = "none",
    -- 				},
    -- 			},
    -- 		},
    -- 		disableLanguageServices = false,
    -- 	},
    -- },
    basedpyright = {
        settings = {
            basedpyright = {
                analysis = { typeCheckingMode = 'off' },
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
}

return {
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            -- Allows extra capabilities provided by nvim-cmp
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            require("mason").setup({
                ui = { border = "rounded" },
            })
            require("mason-lspconfig").setup({
                ensure_installed = vim.tbl_keys(servers or {}),
                automatic_installation = false,
            })

            -- Lsp可以使用luasnip的片段
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()
            cmp_capabilities.textDocument.completion.enitsNearCursor = true
            cmp_capabilities.offsetEncoding = "utf-8"
            capabilities = vim.tbl_deep_extend("force", capabilities, cmp_capabilities)

            local handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend("force", {}, capabilities,
                        server.capabilities or {})
                    require("lspconfig")[server_name].setup(server)
                end,
            }

            require("mason-lspconfig").setup_handlers(handlers)

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(event)
                    local map = function(keys, func, desc, mode)
                        mode = mode or "n"
                        vim.keymap.set(mode, keys, func,
                            { buffer = event.buf, desc = "LSP: " .. desc })
                    end
                    map("ca", vim.lsp.buf.code_action, "[LSP] Code Action", { "n", "x" })
                    map("da", vim.diagnostic.open_float, "[LSP] Diagnostics")
                    map("K", vim.lsp.buf.hover, "[LSP] Hover document")
                    map("<leader>rn", vim.lsp.buf.rename, "[LSP] Rename")
                end,
            })

            -- float windows style
            require("lspconfig.ui.windows").default_options.border = "rounded" -- nvim<=0.10
            -- vim.o.winborder = 'rounded'                                        --nvim>0.10
        end,
    },
}
