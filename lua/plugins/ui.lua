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
    {
        -- 快速跳转
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
    },
    {
        's1n7ax/nvim-window-picker',
        name = 'window-picker',
        event = 'VeryLazy',
        version = '2.*',
        config = function()
            require 'window-picker'.setup({
                filter_rules = {
                    -- whether you want to include the window you are currently on to window
                    -- selection or not
                    include_current_win = true,

                    -- filter using buffer options
                    bo = {
                        -- if the file type is one of following, the window will be ignored
                        filetype = { 'NvimTree', 'neo-tree', 'notify' },

                        -- if the file type is one of following, the window will be ignored
                        buftype = { 'terminal' },
                    },
                },
            })

            -- 选择窗口函数
            local pick_win = function()
                local window_number = require('window-picker').pick_window()
                if window_number then vim.api.nvim_set_current_win(window_number) end
            end

            vim.keymap.set('n', '<leader>pw', pick_win, { desc = '[C] Pick Window' })
        end,

    },
}
