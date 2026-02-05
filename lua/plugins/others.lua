return {
	{
		"kdheepak/lazygit.nvim",
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"folke/noice.nvim",
		opts = {
			cmdline = {
				view = "cmdline",
			},
			-- lsp = {
			--   override = {
			--     ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			--     ["vim.lsp.util.stylize_markdown"] = true,
			--   },
			-- },
		},
	},
}
