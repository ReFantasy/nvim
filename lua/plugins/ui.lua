return {
    {
        -- 对齐竖线
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        main = "ibl",
        opts = {},
        config = function()
            require("ibl").setup({
                scope = {
                    enabled = false,
                }
            })
        end,
    },
    {
        -- 高亮光标所在位置所有相同单词
        'RRethy/vim-illuminate',
        event = "VeryLazy",
        config = function()
            require('illuminate').configure({
            })
        end
    },

    ----------------------- 实用工具 -----------------------
    {
        "windwp/nvim-autopairs",
        event = "VeryLazy",
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
