return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua.with({}),
				null_ls.builtins.formatting.black.with({
					extra_args = { "--line-length", 128 },
				}),
				null_ls.builtins.formatting.clang_format.with({
					extra_args = { "--style", "Microsoft", "-style", "\" {AccessModifierOffset:-4} \"" },
				}),
				null_ls.builtins.formatting.cmake_format.with({
					extra_args = { "--tab-size", "4", "--line-width", "120" },
				}),
			},
		})
	end,
}
