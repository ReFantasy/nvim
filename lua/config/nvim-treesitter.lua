return {
	"nvim-treesitter/nvim-treesitter",
	enabled = true,
	config = function()
		          require("nvim-treesitter").setup {
				  ensure_installed = { "cpp", "lua", "vim", "vimdoc", "python" },
				  auto_install = true,
				  highlight = {enable = true},
			  }
                      end,
}
