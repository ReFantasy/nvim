require("basic")

-- enable language server
vim.lsp.enable 'lua_ls'
vim.lsp.enable 'clangd'

-- plugins
require("plugins.mason")
require("plugins.blink")
require("plugins.nvim-window-picker")
require("plugins.neo-tree")
require("plugins.colorscheme")
require("plugins.treesitter")
vim.api.nvim_command("colorscheme catppuccin-frappe")

-- keymap
vim.keymap.set({ "n", "v" }, "<C-h>", "<C-w>h")
vim.keymap.set({ "n", "v" }, "<C-j>", "<C-w>j")
vim.keymap.set({ "n", "v" }, "<C-k>", "<C-w>k")
vim.keymap.set({ "n", "v" }, "<C-l>", "<C-w>l")

vim.keymap.set({ "n", "v" }, "<leader>fm", vim.lsp.buf.format, { desc = "[LSP] Code Format" })
vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[LSP] Code Action" })
vim.keymap.set({ "n" }, "<leader>rn", vim.lsp.buf.rename, { desc = "[LSP] Code Rename" })
vim.keymap.set({ "n" }, "<leader>da", vim.diagnostic.open_float, { desc = "[LSP] Code Diagnostics" })
vim.keymap.set({ "n" }, "gD", vim.lsp.buf.declaration, { desc = "[LSP] Code Declaration" })
vim.keymap.set({ "n" }, "gd", vim.lsp.buf.definition, { desc = "[LSP] Code Definition" })

vim.keymap.set({ "n", "v" }, "<leader>e", "<cmd>Neotree toggle<CR>") -- open dir

-- 选择窗口
vim.keymap.set("n", "<leader>pw", function()
    local window_number = require("window-picker").pick_window()
    if window_number then
        vim.api.nvim_set_current_win(window_number)
    end
end, { desc = "[C] Pick Window" }) -- pick window
