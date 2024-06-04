vim.loader.enable()

require('core.options')
require('core.keymaps')

require('lazy_nvim')


-- define your colorscheme here
-- vim.cmd("colorscheme monokai_pro")
local colorscheme = 'tokyonight-moon'
--local colorscheme = 'vscode'
local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_ok then
    vim.notify('colorscheme ' .. colorscheme .. ' not found!')
    return
end
