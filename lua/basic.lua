vim.g.mapleader = " "

vim.o.winborder = 'rounded'

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
vim.opt.signcolumn = "yes"
-- 分屏
vim.keymap.set("n", "|", "<cmd>vsplit<CR>")
vim.keymap.set("n", "\\", "<cmd>split<CR>")

-- Tab
vim.opt.tabstop = 4      -- number of visual spaces per TAB
vim.opt.softtabstop = 4  -- number of spacesin tab when editing
vim.opt.shiftwidth = 4   -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces, mainly because of python
vim.opt.autoindent = true
