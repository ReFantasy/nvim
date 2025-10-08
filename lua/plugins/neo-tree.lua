-- checkhealth neo-tree to ensure you have all the required dependencies.
vim.pack.add({
    {
        src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
        version = vim.version.range('3')
    },
    -- dependencies
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/MunifTanjim/nui.nvim",
    -- optional, but recommended
    "https://github.com/nvim-tree/nvim-web-devicons",
})
require('neo-tree').setup({
    -- options go here
    close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
    popup_border_style = "",   -- or "" to use 'winborder' on Neovim v0.11+
    enable_git_status = true,
    enable_diagnostics = false,
    window = {
        mappings = {
            ["S"] = "open_split",
            ["s"] = "open_vsplit",
            -- ["S"] = "split_with_window_picker",
            -- ["s"] = "vsplit_with_window_picker",
        }
    }
})
