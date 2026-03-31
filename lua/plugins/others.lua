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

vim.pack.add({
	{ src = "https://github.com/folke/noice.nvim" },
})

vim.pack.add({
	{ src = "https://github.com/windwp/nvim-autopairs" },
})
require("nvim-autopairs").setup({
	enable_check_bracket_line = false,
})
