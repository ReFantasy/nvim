return {
	{
	    "williamboman/mason.nvim",
		config = function()
			require("mason").setup({
            })
		end
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup{
				--ensure_installed = { "lua_ls" },
			}

			require("lspconfig").clangd.setup{
                enabled = true,
                cmd =
                {
                    "clangd",
                    "--background-index",
                     "--clang-tidy",
                     "--all-scopes-completion",
                     "--completion-style=detailed",
                     "--j=8",
                     "--pch-storage=memory",
                     --"-Wno-unused",
                },
            }

			require("lspconfig").pylsp.setup{
                settings = {
                    pylsp = {
                      plugins = {
                        pycodestyle = {enabled = false},
                      }
                    }
                   }
            }
		end
	},

	{
		"neovim/nvim-lspconfig",
	},
}
