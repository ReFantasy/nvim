vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require("nvim-treesitter").setup({})

local filetypes = {
	"c",
	"cpp",
	"python",
	"lua",
	"bash",
	"cmake",
	"cuda",
	"vim",
	"vimdoc",
	"markdown",
	"markdown_inline",
	"yaml",
	"query",
}

require("nvim-treesitter").install(filetypes)

