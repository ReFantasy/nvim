return {
	"nvim-telescope/telescope.nvim",
	-- lazy = false,
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- optional but recommended
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				-- Default configuration for telescope goes here:
				-- config_key = value,
				mappings = {
					i = {
						-- map actions.which_key to <C-h> (default: <C-/>)
						-- actions.which_key shows the mappings for your picker,
						-- e.g. git_{create, delete, ...}_branch for the git_branches picker
						["<C-h>"] = "which_key",
					},
				},
			},
			pickers = {
				-- Default configuration for builtin pickers goes here:
				-- picker_name = {
				--   picker_config_key = value,
				--   ...
				-- }
				-- Now the picker_config_key will be applied every time you call this
				-- builtin picker
			},
			extensions = {
				-- Your extension configuration goes here:
				-- extension_name = {
				--   extension_config_key = value,
				-- }
				-- please take a look at the readme of the extension you want to configure
			},
		})

		local builtin = require("telescope.builtin")
		-- 搜索文件
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		-- 搜索 Buffer
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope find buffers" })

		-- 全局搜索文本
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Telescope global live grep" })
		-- 当前 Buffer 搜索文本
		vim.keymap.set("n", "<leader>sc", builtin.current_buffer_fuzzy_find, { desc = "Telescope local live grep" })
	end,
}
