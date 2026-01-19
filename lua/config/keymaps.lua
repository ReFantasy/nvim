-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- 分屏
vim.keymap.set("n", "|", "<cmd>vsplit<CR>")
vim.keymap.set("n", "\\", "<cmd>split<CR>")

-- vim.keymap.set("n", "<S-Up>", ":resize -2<CR>", opts)
-- vim.keymap.set("n", "<S-Down>", ":resize +2<CR>", opts)
-- vim.keymap.set("n", "<S-Left>", ":vertical resize -2<CR>", opts)
-- vim.keymap.set("n", "<S-Right>", ":vertical resize +2<CR>", opts)
-- -- 虚拟文本
-- vim.lsp.inlay_hint.enable(false)
-- vim.keymap.set("n", "<leader>th", function()
--   vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
-- end, { desc = "[T]oggle Inlay [H]ints" })
-- vim.keymap.set("n", "|", "<cmd>vsplit<CR>")
-- vim.keymap.set({ "n", "i", "v" }, "<leader>qa", function()
--   print("okkkkkkkkkkkkkkkkkk")
-- end)

vim.keymap.set({ "n", "i", "v" }, "<leader>qa", "<cmd>wa<CR><cmd>qa<CR>", { desc = "save all and quit vim" })
