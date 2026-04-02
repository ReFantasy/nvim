-- vim.pack.add({
--   { src = 'https://github.com/nvim-tree/nvim-web-devicons' }, -- optioinal
--   { src = 'https://github.com/nvim-tree/nvim-tree.lua' },
-- })

-- require("nvim-tree").setup()

-- -- 设置打开/关闭目录树的快捷键 (以 <leader>e 为例)
-- vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true, desc = 'Toggle NvimTree' })

-- -- 启动 Neovim 时自动打开 nvim-tree
-- vim.api.nvim_create_autocmd("VimEnter", {
--     callback = function(data)
--         -- 如果你通过 `nvim 目录名` 启动，将其设为工作区
--         local is_dir = vim.fn.isdirectory(data.file) == 1
--         if is_dir then
--             vim.cmd.cd(data.file)
--         end
--         -- 打开文件树
--         require("nvim-tree.api").tree.open()
--     end,
-- })

vim.pack.add({
	{
		src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
		version = vim.version.range("3"),
	},
	-- dependencies
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	-- optional, but recommended
	"https://github.com/nvim-tree/nvim-web-devicons",
})

require("neo-tree").setup({
	close_if_last_window = true,
	popup_border_style = "rounded",
	enable_git_status = true,
	enable_diagnostics = false,
	open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes

	default_component_configs = {
		--     indent_size = 2,
		--     padding = 1,
		--     -- indent guides
		--     with_markers = true,
		--     indent_marker = "│",
		--     last_indent_marker = "└",
		--     highlight = "NeoTreeIndentMarker",
		--     -- expander config, needed for nesting files
		--     with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
		--     expander_collapsed = "",
		--     expander_expanded = "",
		--     expander_highlight = "NeoTreeExpander",
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
		width = 32,
		mapping_options = {
			noremap = true,
			nowait = true,
		},
	},
})

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { noremap = true, silent = true, desc = "Toggle NvimTree" })
