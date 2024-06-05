local on_attach = function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    local func_wl = function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end

    -- formate code
    local fm = function()
        vim.lsp.buf.format { async = true }
    end

    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    --nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gd', '<cmd>Lspsaga goto_definition<cr>', '[G]oto [D]eclaration')
    --nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('K', "<cmd>Lspsaga hover_doc<CR>", 'Hover Documentation')
    nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    --map('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    --nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    --nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
    nmap('gr', '<cmd>Lspsaga finder<cr>', '[G]oto [R]eferences')

    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', func_wl, '[W]orkspace [L]ist Folders')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    --nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>rn', '<cmd>Lspsaga rename<CR>', '[R]e[n]ame')
    --nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    nmap('<leader>ca', "<cmd>Lspsaga code_action<CR>", '[C]ode [A]ction')

    nmap('<leader>ot', "<cmd>Lspsaga outline<CR>", '[O]u[T] line')

    nmap('<leader>da', require('telescope.builtin').diagnostics, '[D]i[A]gnostics')

    nmap("<leader>fm", fm, "[F]ormat code")
end

local servers = {
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
    pylsp = {
        settings = {
            pylsp = {
                plugins = { pycodestyle = { enabled = false }, },
            }
        }
    },
    clangd = {
        cmd =
        {
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
    cmake = {

    },
}

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",

        -- 优化 lsp 界面
        { "folke/neodev.nvim",    config = true },
        { "nvimdev/lspsaga.nvim", config = true },
    },
    config = function()
        require("mason").setup()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require("mason-lspconfig").setup({
            ensure_installed = vim.tbl_keys(servers),
            automatic_installed = {},
        })

        for server, cfg in pairs(servers) do
            require("lspconfig")[server].setup(
                vim.tbl_deep_extend("keep",
                    {
                        on_attach = on_attach,
                        capabilities = capabilities,
                    },
                    cfg
                )
            )
        end
    end
}
