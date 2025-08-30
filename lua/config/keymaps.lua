-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.del({ "n" }, "<leader>l")
vim.keymap.del({ "n" }, "<leader>cf")

-- 调整窗口大小
local opts = {
  noremap = true, -- non-recursive
  silent = true, -- do not show message
}
vim.keymap.set("n", "<S-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<S-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<S-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<S-Right>", ":vertical resize +2<CR>", opts)
-- 分屏
vim.keymap.set("n", "|", "<cmd>vsplit<CR>", opts)
vim.keymap.set("n", "\\", "<cmd>split<CR>", opts)

-- 虚拟文本
vim.lsp.inlay_hint.enable(false)
vim.keymap.set("n", "<leader>th", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "[T]oggle Inlay [H]ints" })
