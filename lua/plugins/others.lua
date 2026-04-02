vim.pack.add({
	{ src = "https://github.com/s1n7ax/nvim-window-picker" },
})
require("window-picker").setup()
local pick_win = function()
	local window_number = require("window-picker").pick_window()
	if window_number then
		vim.api.nvim_set_current_win(window_number)
	end
end
vim.keymap.set("n", "<leader>pw", pick_win, { desc = "[C] Pick Window" })

vim.pack.add({
	{ src = "https://github.com/christoomey/vim-tmux-navigator" },
})

vim.pack.add({
	{ src = "https://github.com/folke/lazydev.nvim" },
})
require("lazydev").setup({})

vim.pack.add({
	{ src = "https://github.com/folke/flash.nvim" },
})
vim.keymap.set({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end, { desc = "Flash" })

vim.pack.add({
	{ src = "https://github.com/kdheepak/lazygit.nvim" },
})
vim.keymap.set({ "n" }, "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

vim.pack.add({
	{ src = "https://github.com/folke/which-key.nvim" },
})

-- vim.pack.add({
-- 	{ src = "https://github.com/folke/noice.nvim" },
-- })

vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.nvim" },
})
require("mini.pairs").setup()
require("mini.cursorword").setup() -- 高亮显示光标位置的单词
-- 设置非当前光标下的匹配单词：例如使用背景色，并移除下划线
vim.api.nvim_set_hl(0, "MiniCursorword", { bg = "#3a3a3a", ctermbg = 240 })
-- 设置光标下的当前单词：例如使用更醒目的背景色或加粗，同样移除下划线
vim.api.nvim_set_hl(0, "MiniCursorwordCurrent", { bg = "#5a5a5a", ctermbg = 242, bold = true })
