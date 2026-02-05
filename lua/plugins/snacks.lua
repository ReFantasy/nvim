return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = false }, --处理大文件的工具
		dashboard = { enabled = true },
		explorer = { enabled = true },
		indent = { enabled = true }, --缩进指示和范围
		input = { enabled = true }, --更好的 vim.ui.input
		notifier = { enabled = true }, --美观的 vim.notify
		quickfile = { enabled = false },
		scope = { enabled = false }, --基于树形语法或缩进进行作用域检测的文本对象
		scroll = { enabled = false }, --平滑翻页
		statuscolumn = { enabled = true }, --美观的状态列
		words = { enabled = true }, --自动显示 LSP 引用并快速在它们之间导航

		picker = {
			enabled = true,
			sources = {
				explorer = {
					auto_close = true,
					layout = {
						preset = "sidebar",
						preview = false,
						auto_hide = { "input" },
					},
				},
			},
		},
	},
	keys = {
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
		{
			"<leader>nh",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification History",
		},
	},
}
