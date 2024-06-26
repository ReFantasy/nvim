return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-path",     -- path auto-completion
        "hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
        {
            "saadparwaiz1/cmp_luasnip",
            dependencies = {
                "L3MON4D3/LuaSnip",
                dependencies = { "rafamadriz/friendly-snippets" },
                build = "make install_jsregexp"
            }
        },
        "hrsh7th/cmp-buffer",  -- buffer auto-completion
        "hrsh7th/cmp-cmdline", -- cmdline auto-completion
        {
            "folke/lazydev.nvim",
            dependencies = { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
            ft = "lua",                                             -- only load on lua files
            opts = {
                library = {
                    -- See the configuration section for more details
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "luvit-meta/library", words = { "vim%.uv" } },
                },
            },
        },
    },
    config = function()
        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and
                vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        require("luasnip/loaders/from_vscode").lazy_load()

        local cmp_status_ok, cmp = pcall(require, "cmp")
        if not cmp_status_ok then
            return
        end

        local snip_status_ok, luasnip = pcall(require, "luasnip")
        if not snip_status_ok then
            return
        end
        cmp.setup({
            -- Set source precedence
            sources = cmp.config.sources({
                { name = "lazydev" },
                { name = 'nvim_lsp' }, -- For nvim-lsp
                { name = 'luasnip' },  -- For luasnip user
                { name = 'buffer' },   -- For buffer word completion
                { name = 'path' },     -- For path completion
            }),
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                    -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
                -- ['<C-Space>'] = cmp.mapping.complete(),
                -- ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                -- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            experimental = {
                ghost_text = true,
            },
            -- Let's configure the item's appearance
            -- source: https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
            formatting = {
                -- Set order from left to right
                -- kind: single letter indicating the type of completion
                -- abbr: abbreviation of "word"; when not empty it is used in the menu instead of "word"
                -- menu: extra text for the popup menu, displayed after "word" or "abbr"
                fields = { 'kind', 'abbr', 'menu' },

                -- customize the appearance of the completion menu
                format = function(entry, vim_item)
                    -- kind icons
                    -- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                    vim_item.menu = ({
                        nvim_lsp = '[Lsp]',
                        luasnip = '[Luasnip]',
                        buffer = '[File]',
                        path = '[Path]',
                    })[entry.source.name]
                    return vim_item
                end,
            },
        })

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            }),
            matching = { disallow_symbol_nonprefix_matching = false }
        })
    end,
}
