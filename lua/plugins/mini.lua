vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.nvim" },
})
require("mini.pairs").setup()

require("mini.cursorword").setup() -- 高亮显示光标位置的单词
-- 设置非当前光标下的匹配单词：例如使用背景色，并移除下划线
vim.api.nvim_set_hl(0, "MiniCursorword", { bg = "#3a3a3a", ctermbg = 240 })
-- 设置光标下的当前单词：例如使用更醒目的背景色或加粗，同样移除下划线
vim.api.nvim_set_hl(0, "MiniCursorwordCurrent", { bg = "#5a5a5a", ctermbg = 242, bold = true })

-- showing notifications in bottom right corner
local win_config = function()
	local has_statusline = vim.o.laststatus > 0
	local pad = vim.o.cmdheight + (has_statusline and 1 or 0)
	return { anchor = "SE", col = vim.o.columns, row = vim.o.lines - pad }
end
require("mini.notify").setup({
	lsp_progress = { duration_last = 1500 },
	window = { config = win_config },
})
vim.keymap.set("n", "<leader>nh", MiniNotify.show_history, { desc = "Show notice history" })
local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal" }) -- 获取当前主题纯文本 (Normal) 的高亮属性
vim.api.nvim_set_hl(0, "MiniNotifyNormal", { bg = normal_hl.bg })
vim.api.nvim_set_hl(0, "MiniNotifyBorder", { bg = normal_hl.bg, fg = "green" })
vim.api.nvim_set_hl(0, "MiniNotifyTitle", { bg = normal_hl.bg })

require("mini.statusline").setup()
