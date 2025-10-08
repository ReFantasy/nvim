require("basic")

-- enable language server
vim.lsp.enable 'lua_ls'
vim.lsp.enable 'clangd'

-- plugins
require("plugins.mason")
require("plugins.blink")
require("plugins.nvim-window-picker")
require("plugins.neo-tree")

-- keymap
vim.keymap.set({ "n", "v" }, "<C-h>", "<C-w>h")
vim.keymap.set({ "n", "v" }, "<C-j>", "<C-w>j")
vim.keymap.set({ "n", "v" }, "<C-k>", "<C-w>k")
vim.keymap.set({ "n", "v" }, "<C-l>", "<C-w>l")

vim.keymap.set({ "n", "v" }, "<leader>fm", vim.lsp.buf.format, "[LSP] format") -- format code

vim.keymap.set({ "n", "v" }, "<leader>e", "<cmd>Neotree toggle<CR>")           -- open dir

-- 选择窗口
vim.keymap.set("n", "<leader>pw", function()
    local window_number = require("window-picker").pick_window()
    if window_number then
        vim.api.nvim_set_current_win(window_number)
    end
end, { desc = "[C] Pick Window" }) -- pick window
