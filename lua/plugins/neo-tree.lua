vim.pack.add({
    {
        src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
        version = vim.version.range('3')
    },
    -- dependencies
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    -- optional, but recommended
    "nvim-tree/nvim-web-devicons",
})
require('neo-tree').setup({
    -- options go here
})
