vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.termguicolors = true -- enabl 24-bit RGB color in the TUI

vim.opt.number = true -- show absolute number
vim.opt.relativenumber = true
vim.opt.cursorline = true -- highlight cursor line underneath the cursor horizontally

vim.opt.splitbelow = true -- open new vertical split bottom
vim.opt.splitright = true -- open new horizontal splits right

vim.opt.tabstop = 4 -- number of visual spaces per TAB
vim.opt.softtabstop = 4 -- number of spacesin tab when editing
vim.opt.shiftwidth = 4 -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces, mainly because of python
vim.opt.autoindent = true

vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered
vim.opt.incsearch = true -- search as characters are entered
vim.opt.hlsearch = false -- do not highlight matches

vim.opt.signcolumn = "yes"

vim.o.winborder = "rounded" -- rounded windows
