return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
        config = function()
            require("ibl").setup()
        end,
    },
    {
        -- 高亮光标所在位置所有相同单词
        'RRethy/vim-illuminate',
    },

    ----------------------- 实用工具 -----------------------
    {
        "windwp/nvim-autopairs",
        config = function()
            require('nvim-autopairs').setup({
                enable_check_bracket_line = false
            })
        end,
    },
    {
        "ethanholz/nvim-lastplace",
        config = true,
    },
    {   
        "folke/which-key.nvim",
        config = true,
    },
    {
        "echasnovski/mini.comment",
        config = true,
    },
    {

    },
}

