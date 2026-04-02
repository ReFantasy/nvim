----------------------------------------------------------------------------
--[[                              基本 配置                               ]]
----------------------------------------------------------------------------
require("config.options")
require("config.keymaps")

----------------------------------------------------------------------------
--[[                              插件 配置                               ]]
----------------------------------------------------------------------------
-- 自动加载 plugins 目录下的所有 lua 文件
-- automatically finds them and merges them with any local lsp/*.lua
local plugins_dir = vim.fn.stdpath("config") .. "/lua/plugins"
local plugin_files = vim.split(vim.fn.glob(plugins_dir .. "/*.lua"), "\n")
for _, file in ipairs(plugin_files) do
	if file ~= "" then
		local plugin_name = vim.fn.fnamemodify(file, ":t:r")
		require("plugins." .. plugin_name)
	end
end

----------------------------------------------------------------------------
--[[                              LSP 配置                                ]]
----------------------------------------------------------------------------
-- 先取消默认LSP keymap
vim.keymap.del("n", "gra")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "grn")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "grt")
-- 使用 nvim-lspconfig 配置 lsp
local servers = { "lua_ls", "clangd", "basedpyright" }
for _, lsp in ipairs(servers) do
	vim.lsp.enable(lsp)
end
