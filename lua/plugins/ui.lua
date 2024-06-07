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
        -- 自动补全括号
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        config = function()
            require('nvim-autopairs').setup({
                enable_check_bracket_line = false
            })
        end,
    },
    {
        -- 打开文件重新定位到上次的编辑位置
        "ethanholz/nvim-lastplace",
        config = true,
    },
    {
        -- 查看键盘映射 :WhichKey
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("which-key").setup {
                window = {
                    border = "single", -- none, single, double, shadow
                },
            }
        end
    },
}
