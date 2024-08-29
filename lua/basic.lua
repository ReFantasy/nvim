vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.autoread = true
vim.opt.swapfile = false
vim.opt.wrap = false
--opt.undofile = true --始终保留历史操作
vim.opt.exrc = true -- 支持项目目录下的局部配置
vim.b.fileenconding = "utf-8"
vim.opt.scrolloff = 5

-- Tab
vim.opt.tabstop = 4 -- number of visual spaces per TAB
vim.opt.softtabstop = 4 -- number of spacesin tab when editing
vim.opt.shiftwidth = 4 -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces, mainly because of python
vim.opt.autoindent = true

-- Enable break indent
vim.opt.breakindent = true

-- UI config
vim.opt.number = true -- show absolute number
vim.opt.relativenumber = true
vim.opt.cursorline = true -- highlight cursor line underneath the cursor horizontally
vim.opt.showmode = true -- we are experienced, wo don't need the "-- INSERT --" mode hint

-- 启用鼠标
vim.opt.mouse:append("a")

-- 系统剪贴板
-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.opt.clipboard:append("unnamedplus")
end)

-- 默认新创建窗口在右和下位置
vim.opt.splitbelow = true -- open new vertical split bottom
vim.opt.splitright = true -- open new horizontal splits right

-- 搜索
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered
vim.opt.incsearch = true -- search as characters are entered
vim.opt.hlsearch = false -- do not highlight matches

-- 外观
vim.opt.termguicolors = true -- enabl 24-bit RGB color in the TUI
vim.opt.signcolumn = "yes"

-----------------------------------------------------------------------------------------
---    keymap
-----------------------------------------------------------------------------------------
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

-- 切换buffer
-- vim.keymap.set("n", "<leader><space>", ":bnext<CR>", opts)

-- hex and text editing
local function byte2hex()
	vim.cmd("%! xxd -g 1 -u")
	vim.b.hex_ft = vim.bo.filetype
	vim.opt_local.binary = true
	vim.bo.filetype = "xxd"
end
local function hex2byte()
	vim.cmd("%! xxd -r")
	vim.bo.filetype = vim.b.hex_ft
	vim.opt_local.binary = false
end
vim.api.nvim_create_user_command("HexEdit", byte2hex, {})
vim.api.nvim_create_user_command("Hex2Byte", hex2byte, {})

-- 代码折叠
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

-- vim.lsp.inlay_hint.enable(true)

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
