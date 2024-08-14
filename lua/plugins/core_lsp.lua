-- 默认开启的lsp服务
local servers = {
    lua_ls = {
        settings = {
            Lua = {
                workspace = { checkThirdParty = false },
                telemetry = { enable = false },
                -- hint = { enable = true, },
                -- codeLens = { enable = true, },
            },
        },
    },
    pylsp = {
        settings = {
            pylsp = {
                plugins = { pycodestyle = { enabled = false } },
                hint = { enable = true },
                severity = {},
            },
        },
    },
    -- pyright = {
    -- },
    clangd = {
        cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--all-scopes-completion",
            "--completion-style=detailed",
            "--j=8",
            "--pch-storage=memory",
            --"-Wno-unused",
        },
    },
    -- cmake = {},
    neocmake = {
        cmd = { "neocmakelsp", "--stdio" },
        filetypes = { "cmake" },
        -- root_dir = function(fname)
        --     return nvim_lsp.util.find_git_ancestor(fname)
        -- end,
        single_file_support = true, -- suggested
        init_options = {
            format = {
                enable = true,
            },
            lint = {
                enable = true,
            },
            scan_cmake_in_package = true, -- default is true
        },
    },
    -- marksman = {},
    marksman = {
        cmd = { "marksman", "server" },
        filetype = { "markdown", "markdown.mdx" },
        single_file_support = true,
    },
}

-- 映射
local on_attach = function(_, bufnr)
    local nmap = function(keys, func, desc)
        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc, silent = true })
    end
    local builtin = require("telescope.builtin")
    -- nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    -- nmap('gd', vim.lsp.buf.definition, '[G]oto [D]eclaration')
    -- nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    -- nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
    -- nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
    -- nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
    -- nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
    -- nmap("<leader>wl", function()
    --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, "[W]orkspace [L]ist Folders")
    -- nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
    -- nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    -- nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
    -- nmap("<leader>da", vim.diagnostic.open_float, "[D]i[A]gnostics")
    nmap("<leader>da", vim.diagnostic.open_float, "[D]i[A]gnostics")
    -- nmap('<leader>dl', vim.diagnostic.setloclist, '[D]i[A]gnostics')
    -- nmap('<leader>dl', builtin.diagnostics, '[D]i[A]gnostics [L]ist')
    -- nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

    -- nmap("K", "<cmd>Lspsaga hover_doc<CR>", "Hover Documentation")
    nmap("gk", "<cmd>Lspsaga peek_definition<cr>", "[C] [G]o to [P]eek definition")
    nmap("<leader>rn", "<cmd>Lspsaga rename<CR>", "[R]e[n]ame")
    nmap("<leader>ca", "<cmd>Lspsaga code_action<cr>", "[C]ode [A]ction")

    nmap("<leader>fm", function()
        vim.lsp.buf.format({ async = true })
    end, "[C] [F]or[m]at code")
end

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "nvimdev/lspsaga.nvim",
    },
    config = function()
        require("mason").setup({
            ui = { border = "rounded" },
        })
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        require("mason-lspconfig").setup({
            ensure_installed = vim.tbl_keys(servers),
            automatic_installed = {},
        })

        for server, cfg in pairs(servers) do
            require("lspconfig")[server].setup(vim.tbl_deep_extend("keep", {
                on_attach = on_attach,
                capabilities = capabilities,
            }, cfg))
        end

        require("lspsaga").setup()

        require("lspconfig.ui.windows").default_options.border = "rounded"

        vim.diagnostic.config({
            virtual_text = false, -- 关闭在虚拟文本中显示代码诊断信息
            underline = false,
            float = {
                border = "rounded",
            },
            -- severity = vim.diagnostic.severity.ERROR,
        })
    end,
}
