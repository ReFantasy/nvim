return {
	{
		"nvimdev/lspsaga.nvim",
		enabled = true,
		event = "VeryLazy",
		keys = {
			{ "K", "<cmd>Lspsaga hover_doc<cr>", desc = "Lspsaga hover" },
			{ "gK", "<cmd>Lspsaga peek_definition<cr>", desc = "Lspsaga hpeek_definition" },
		},
		config = function()
			require("lspsaga").setup({
				LightBulb = { enabled = false }, -- Automatically show lightbulbs when the current line has available code actions.
			})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},
}
