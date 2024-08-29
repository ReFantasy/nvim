return {
	"rebelot/heirline.nvim",
	enabled = false,
	event = "VeryLazy",
	config = function()
		require("heirline").setup({
			statusline = require("plugins.heirline.statusline"),
			-- tabline = require 'custom.config.heirline.tabline',
		})
	end,
}
