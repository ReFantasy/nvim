-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- best to run :checkhealth nvim-treesitter after updating

-- my developed plugins
vim.opt.runtimepath:append("$HOME/code/PeekDefinition/")

local pkg = require("PeekDefinition")
-- vim.print(pkg.info)
pkg.setup({
  color = "green",
})
