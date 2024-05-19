return {
	{
	    "williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup{
				--ensure_installed = { "pyright" },
			}

			require("lspconfig").clangd.setup{}
			require("lspconfig").pylsp.setup{}
			
		end
	},

	{
		"neovim/nvim-lspconfig",
	},
}
