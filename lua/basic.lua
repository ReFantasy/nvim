vim.g.mapleader = " "

-- 显示行号
vim.opt.number = true -- show absolute number
vim.opt.relativenumber = true
-- 高亮光标行
vim.opt.cursorline = true 
-- 默认新创建窗口在右和下位置
vim.opt.splitbelow = true 
vim.opt.splitright = true 
-- 外观
vim.opt.termguicolors = true -- enabl 24-bit RGB color in the TUI
-- vim.opt.signcolumn = "yes"
-- 分屏
vim.keymap.set("n", "|", "<cmd>vsplit<CR>")
vim.keymap.set("n", "\\", "<cmd>split<CR>")

vim.lsp.enable 'lua_ls'
