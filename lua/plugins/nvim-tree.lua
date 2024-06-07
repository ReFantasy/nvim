local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    -- vim.keymap.set('n', '<C-u>', api.tree.change_root_to_parent,        opts('Up'))
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

return {
    {
        "nvim-tree/nvim-tree.lua",
        keys = {
            { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Open the neo-tree", mode = { "n", "v" } }
        },
        enabled = true,
        version = "*",
        lazy = false,

        config = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1


            require("nvim-tree").setup({
                on_attach = my_on_attach
            })

            local api = require "nvim-tree.api"

            -- 打开（关闭）目录树, 并且不要获取窗口焦点
            local tree_toggle = function()
                api.tree.toggle()
            end
            vim.keymap.set('n', '<leader>e', tree_toggle, {})

            -- 切换到目录树
            vim.keymap.set('n', '<leader>t', api.tree.focus, {})
        end,
    }
}
