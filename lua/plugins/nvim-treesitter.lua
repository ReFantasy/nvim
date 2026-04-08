vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require("nvim-treesitter").setup({
	highlight = { enable = true }, -- 启用高亮（推荐）
	indent = { enable = true }, -- 启用智能缩进（推荐）
})

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

----------------------------------------------------------------------------
--[[                              折叠配置                               ]]
----------------------------------------------------------------------------
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

-- 切换折叠模式的函数
function ToggleFoldMethod()
	if vim.wo.foldmethod == "manual" then
		-- 切换到自动折叠（expr + treesitter）
		vim.wo.foldmethod = "expr"
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.notify("折叠模式: 自动 (Treesitter)")
	else
		-- 切换到手动模式
		vim.wo.foldmethod = "manual"
		-- 清除已有的自动折叠，避免残留
		vim.cmd("normal! zE")
		vim.notify("折叠模式: 手动")
	end
end
vim.keymap.set("n", "zn", ToggleFoldMethod, { desc = "切换折叠模式" })
