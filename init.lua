-- This feature is experimental/unstable.
-- adds the Lua loader using the byte-compilation cache
vim.loader.enable()

vim.o.winborder = 'rounded'
vim.api.nvim_command("colorscheme default")

require("config.basic")
require("config.lsp_config")

--------------------------------------------------------------------------------
---  LAZY BEGIN
---  All the plugin config file can be saved on: ./lua/plugins
--------------------------------------------------------------------------------
-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not (vim.uv or vim.loop).fs_stat(lazypath) then
-- 	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
-- 	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
-- 	if vim.v.shell_error ~= 0 then
-- 		vim.api.nvim_echo({
-- 			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
-- 			{ out,                            "WarningMsg" },
-- 			{ "\nPress any key to exit..." },
-- 		}, true, {})
-- 		vim.fn.getchar()
-- 		os.exit(1)
-- 	end
-- end
-- vim.opt.rtp:prepend(lazypath)
-- require("lazy").setup({
-- 	spec = {
-- 		{ import = "plugins" },
-- 	},
-- })
--------------------------------------------------------------------------------
---  END
--------------------------------------------------------------------------------










