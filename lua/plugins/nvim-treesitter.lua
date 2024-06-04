return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		          require("nvim-treesitter.configs").setup {
				      ensure_installed = { "cpp", "lua", "vim", "vimdoc", "python" },
				      highlight = {
                          enable = true,
                          additional_vim_regex_highlighting = false
                      },
			      }
    end,
}
