-- 分屏
vim.keymap.set("n", "|", "<cmd>vsplit<CR>")
vim.keymap.set("n", "\\", "<cmd>split<CR>")
-- vim.keymap.set({ "n", "i", "v" }, "<leader>qq", "<cmd>wa<CR><cmd>qa<CR>", { desc = "save all and quit vim" })

-- -- 调整窗口大小
-- vim.keymap.set("n", "<S-Up>", ":resize -2<CR>", opts)
-- vim.keymap.set("n", "<S-Down>", ":resize +2<CR>", opts)
-- vim.keymap.set("n", "<S-Left>", ":vertical resize -2<CR>", opts)
-- vim.keymap.set("n", "<S-Right>", ":vertical resize +2<CR>", opts)
-- -- 分屏
-- vim.keymap.set("n", "|", "<cmd>vsplit<CR>", opts)
-- vim.keymap.set("n", "\\", "<cmd>split<CR>", opts)
-- -- 单行或多行移动
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- vim.keymap.set("v", "H", "<gv", opts)
-- vim.keymap.set("v", "L", ">gv", opts)
