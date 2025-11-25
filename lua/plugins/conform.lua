return {
	"stevearc/conform.nvim",
	opts = {},
	keys = {
		{
			"<leader>fm",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			desc = "Format File",
		},
	},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black", "isort", lsp_format = "fallback" },
				c = { "clang-format", lsp_format = "fallback" },
				cpp = { "clang-format", lsp_format = "fallback" },
			},
		})
	end,
}
