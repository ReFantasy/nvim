return {
	{
		"nvimdev/lspsaga.nvim",
		enabled = false,
		event = "VeryLazy",
		keys = {
			{ "K", "<cmd>Lspsaga hover_doc<cr>", desc = "Lspsaga hover" },
			{ "gK", "<cmd>Lspsaga peek_definition<cr>", desc = "Lspsaga hpeek_definition" },
		},
		config = function()
			require("lspsaga").setup({
				ui = {
					code_action = require("nvim-web-devicons").get_icon("justfile", "", { default = true }),
				},
			})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},
}
