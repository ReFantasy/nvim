vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require("nvim-treesitter").setup({
	highlight = { enable = true }, -- 启用高亮（推荐）
	indent = { enable = true }, -- 启用智能缩进（推荐）
})

-- 折叠配置 (Folding) ==
-- za：切换（打开/关闭）光标下的折叠。
-- zM：关闭文件中所有折叠。
-- zR：打开文件中所有折叠。
-- zi：切换折叠功能 ('foldenable') 的启用/禁用状态。
vim.wo.foldenable = true -- 启用折叠功能
vim.wo.foldcolumn = "1" -- 在左侧显示一列来表示折叠（可选，设为"0"则不显示）
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- 控制最小折叠行数（避免单行被折叠）
vim.wo.foldminlines = 1
vim.wo.foldlevel = 99 -- 默认打开所有折叠（推荐：文件打开时全部展开）
-- 最大折叠嵌套层级
vim.wo.foldnestmax = 5

local filetypes = {
	"c",
	"cpp",
	"python",
	"lua",
	"bash",
	"cmake",
	"cuda",
	"vim",
	"vimdoc",
	"markdown",
	"markdown_inline",
	"yaml",
	"query",
}

require("nvim-treesitter").install(filetypes)
