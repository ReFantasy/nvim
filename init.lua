require("basic")

-- enable language server
vim.lsp.enable 'lua_ls'
vim.lsp.enable 'clangd'

-- plugins manager
require("plugins.mason") 
require("plugins.blink") 
require("plugins.neo-tree")


-- vim.api.nvim_command("colorscheme default")
