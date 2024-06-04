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
    }
}
