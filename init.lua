vim.loader.enable()

require('core.options')
require('core.keymaps')
require('lazy_nvim')

require('core.utility.cmake_build')
vim.keymap.set('n', '<F4>', cmake_build.build)
-- define your colorscheme here
-- vim.cmd("colorscheme monokai_pro")
--local colorscheme = 'embark'
--local colorscheme = 'tokyonight-moon'
--local colorscheme = 'vscode'
local colorscheme = 'monokai_pro'
local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_ok then
    vim.notify('colorscheme ' .. colorscheme .. ' not found!')
    return
end
