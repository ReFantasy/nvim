return {
	{
		"nvim-tree/nvim-tree.lua",
		enabled = true,
		version = "*",
		lazy = false,
		--dependencies = {
		--	"kyazdani42/nvim-web-devicons"
		--},
		config = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
            
			require("nvim-tree").setup({
                renderer = {group_empty = true,},
                filters = {dotfiles = true},
            })
		end,
	}
}
