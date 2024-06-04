local opt = vim.opt
local buffer = vim.b
local global = vim.g

global.mapleader = " "

opt.completeopt = { 'menu', 'menuone', 'noselect' }
opt.wildmenu = true
opt.autoread = true
opt.title = true
opt.swapfile = false
opt.undofile = true --始终保留历史操作
opt.wrap = false
buffer.fileenconding = "utf-8"

-- Tab
opt.tabstop = 4 -- number of visual spaces per TAB
opt.softtabstop = 4 -- number of spacesin tab when editing
opt.shiftwidth = 4 -- insert 4 spaces on a tab
opt.expandtab = true -- tabs are spaces, mainly because of python
opt.autoindent = true

-- UI config
opt.number = true -- show absolute number
opt.relativenumber = false
opt.cursorline = true -- highlight cursor line underneath the cursor horizontally
opt.showmode = false -- we are experienced, wo don't need the "-- INSERT --" mode hint

-- 防止包裹
opt.wrap = false

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪贴板
opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
opt.splitbelow = true -- open new vertical split bottom
opt.splitright = true -- open new horizontal splits right

-- 搜索
opt.ignorecase = true -- ignore case in searches by default
opt.smartcase = true -- but make it case sensitive if an uppercase is entered
opt.incsearch = true -- search as characters are entered
opt.hlsearch = false -- do not highlight matches

-- 外观
opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI
opt.signcolumn = "yes"

