--
-- basic config for nvim
--

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true -- show absolute number
vim.opt.relativenumber = true
vim.opt.cursorline = true -- highlight cursor line underneath the cursor horizontally

-- 默认新创建窗口在右和下位置
vim.opt.splitbelow = true -- open new vertical split bottom
vim.opt.splitright = true -- open new horizontal splits right

-- Tab
vim.opt.tabstop = 4      -- number of visual spaces per TAB
vim.opt.softtabstop = 4  -- number of spacesin tab when editing
vim.opt.shiftwidth = 4   -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces, mainly because of python
vim.opt.autoindent = true

-- 搜索
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered
vim.opt.incsearch = true -- search as characters are entered
vim.opt.hlsearch = false -- do not highlight matches

-- 外观
vim.opt.termguicolors = true -- enabl 24-bit RGB color in the TUI
vim.opt.signcolumn = "yes"

local opts = {
	noremap = true, -- non-recursive
	silent = true, -- do not show message
}
-- 调整窗口大小
vim.keymap.set("n", "<S-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<S-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<S-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<S-Right>", ":vertical resize +2<CR>", opts)
-- 分屏
vim.keymap.set("n", "|", "<cmd>vsplit<CR>", opts)
vim.keymap.set("n", "\\", "<cmd>split<CR>", opts)
-- 单行或多行移动
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "H", "<gv", opts)
vim.keymap.set("v", "L", ">gv", opts)

-- 代码折叠
-- vim.opt.foldenable = true
-- vim.opt.foldlevel = 99
-- vim.opt.foldlevelstart = 99

-- 虚拟文本
-- vim.lsp.inlay_hint.enable(false)
-- vim.keymap.set("n", "<leader>th", function()
-- 	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
-- end, { desc = "[T]oggle Inlay [H]ints" })
