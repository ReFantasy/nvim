return {
	{ -- Autocompletion
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					-- Build Step is needed for regex support in snippets.
					-- This step is not supported in many windows environments.
					-- Remove the below condition to re-enable on windows.
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					-- `friendly-snippets` contains a variety of premade snippets.
					--    See the README about individual language/framework/plugin snippets:
					--    https://github.com/rafamadriz/friendly-snippets
					-- {
					--   'rafamadriz/friendly-snippets',
					--   config = function()
					--     require('luasnip.loaders.from_vscode').lazy_load()
					--   end,
					-- },
				},
			},
			"hrsh7th/cmp-buffer", -- buffer auto-completion
			"saadparwaiz1/cmp_luasnip",

			-- Adds other completion capabilities.
			--  nvim-cmp does not ship with all sources by default. They are split
			--  into multiple repos for maintenance purposes.
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline", -- cmdline auto-completion
		},
		config = function()
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
					{
						name = "lazydev",
						-- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
						group_index = 0,
					},

					{ name = "nvim_lsp" }, -- For nvim-lsp
					{ name = "luasnip" }, -- For luasnip user
					{ name = "buffer" }, -- For buffer word completion
					{ name = "path" }, -- For path completion
				}),
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				completion = { completeopt = "menu,menuone,noinsert" },
				mapping = cmp.mapping.preset.insert({
					-- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
					-- ['<C-f>'] = cmp.mapping.scroll_docs(4),
					-- ['<C-Space>'] = cmp.mapping.complete(),
					-- ['<C-e>'] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
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
				-- formatting = {
				-- 	-- Set order from left to right
				-- 	-- kind: single letter indicating the type of completion
				-- 	-- abbr: abbreviation of "word"; when not empty it is used in the menu instead of "word"
				-- 	-- menu: extra text for the popup menu, displayed after "word" or "abbr"
				-- 	fields = { "kind", "abbr", "menu" },
				--
				-- 	-- customize the appearance of the completion menu
				-- 	format = function(entry, vim_item)
				-- 		-- kind icons
				-- 		-- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
				-- 		vim_item.menu = ({
				-- 			nvim_lsp = "[Lsp]",
				-- 			luasnip = "[Luasnip]",
				-- 			buffer = "[File]",
				-- 			path = "[Path]",
				-- 		})[entry.source.name]
				-- 		return vim_item
				-- 	end,
				-- },
			})

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
				-- matching = { disallow_symbol_nonprefix_matching = false },
			})
		end,
	},
}
