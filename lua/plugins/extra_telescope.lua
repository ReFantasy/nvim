return {
	{
		"nvim-telescope/telescope.nvim",
		enent = "VimEnter",
		tag = "0.1.6",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			},
			-- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
			{ "nvim-telescope/telescope-ui-select.nvim" },

			-- Useful for getting pretty icons, but requires a Nerd Font.
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			local status, _ = pcall(require, "telescope.actions")
			if not status then
				return
			end

			require("telescope").setup({
				defaults = {
					preview = true,
					file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				},
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
				},
			})
			-- To get fzf loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require("telescope").load_extension("fzf")
			pcall(require("telescope").load_extension, "ui-select")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader><space>", builtin.buffers, { desc = "[C] Buffers list" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
			vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "[C] Find recently opened files" })

			-- Shortcut for searching your Neovim configuration files
			vim.keymap.set("n", "<leader>fn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch [N]eovim files" })

			-- local search_cur_file = function()
			--     builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
			--         winvlend = 10,
			--         previewer = false,
			--     })
			-- end
			-- vim.keymap.set('n', '<leader>s', search_cur_file, { desc = '[C] Fuzzily [S]earch content in current buffer' })
		end,
	},
}
