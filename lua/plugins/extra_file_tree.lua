-- local function my_on_attach(bufnr)
--     local api = require "nvim-tree.api"
--
--     local function opts(desc)
--         return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
--     end
--
--     -- default mappings
--     api.config.mappings.default_on_attach(bufnr)
--
--     -- custom mappings
--     -- vim.keymap.set('n', '<C-u>', api.tree.change_root_to_parent,        opts('Up'))
--     vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
-- end
--
-- return {
--     {
--         "nvim-tree/nvim-tree.lua",
--         enabled = true,
--         version = "*",
--         lazy = false,
--         dependencies = {
--             "nvim-tree/nvim-web-devicons",
--         },
--
--         config = function()
--             vim.g.loaded_netrw = 1
--             vim.g.loaded_netrwPlugin = 1
--
--             local glyphs = {}
--             local installed, circles = pcall(require, 'circles')
--             if installed then
--                 circles.setup({ icons = { empty = '', filled = '', lsp_prefix = '' } })
--                 glyphs = circles.get_nvimtree_glyphs()
--             end
--             glyphs.git = {
--                 unstaged = '',
--                 staged = '',
--                 unmerged = '',
--                 renamed = '',
--                 untracked = '',
--                 deleted = '',
--                 ignored = '',
--             }
--
--             require("nvim-tree").setup({
--                 on_attach = my_on_attach,
--                 filters = {
--                     dotfiles = true,
--                 },
--                 diagnostics = { enable = true },
--                 view = {
--                     width = 30,
--                     side = 'left',
--                     signcolumn = 'no',
--                 },
--                 git = {
--                     enable = true,
--                     ignore = false,
--                     timeout = 500,
--                 },
--                 actions = {
--                     open_file = {
--                         -- quit_on_open = true,
--                     },
--                 },
--                 renderer = {
--                     group_empty = true,
--                     highlight_opened_files = 'all',
--                     special_files = {},
--                     root_folder_modifier = ':p:~',
--                     icons = {
--                         glyphs = glyphs,
--                     },
--                 },
--             })
--
--             local api = require "nvim-tree.api"
--
--             -- 打开（关闭）目录树
--             local tree_toggle = function()
--                 api.tree.toggle()
--             end
--             vim.keymap.set('n', '<leader>e', tree_toggle, {})
--         end,
--     }
-- }

return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		enabled = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		keys = {
			{ "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Open the neo-tree", mode = { "n", "v" } },
		},
		config = function()
			-- If you want icons for diagnostic errors, you'll need to define them somewhere:
			vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
			vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
			vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
			vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
			require("neo-tree").setup({
				close_if_last_window = true,
				popup_border_style = "rounded",
				enable_git_status = true,
				enable_diagnostics = true,
				open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes

				default_component_configs = {
					indent_size = 2,
					padding = 1,
					-- indent guides
					with_markers = true,
					indent_marker = "│",
					last_indent_marker = "└",
					highlight = "NeoTreeIndentMarker",
					-- expander config, needed for nesting files
					with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
					modified = {
						symbol = "[+]",
						highlight = "NeoTreeModified",
					},
					git_status = {
						enabled = false,
					},
				},
				window = {
					position = "left",
					width = 35,
					mapping_options = {
						noremap = true,
						nowait = true,
					},
				},
			})
		end,
	},
}
