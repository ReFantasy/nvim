return {
    {
        -- tmux vim 窗口移动
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
    {
        -- 自动补全括号
        "windwp/nvim-autopairs",
        config = function()
            require('nvim-autopairs').setup({
                enable_check_bracket_line = false
            })
        end,
    },
    {
        -- 对齐竖线
        -- "lukas-reineke/indent-blankline.nvim",
        -- main = "ibl",
        -- opts = {},
        -- config = function()
        --     require("ibl").setup({
        --         scope = {
        --             enabled = false,
        --         }
        --     })
        -- end,
        -- 'nvimdev/indentmini.nvim',
        -- ebabled = false,
        -- event = 'BufEnter',
        -- config = function()
        --     require("indentmini").setup({
        --         -- char = '|',
        --         excluse = {},
        --     }) -- use default config
        --     vim.cmd.highlight('default link IndentLine Comment')
        --     vim.cmd.highlight('IndentLineCurrent guifg=#495357')
        -- end,
    },
    {
        -- 高亮光标所在位置所有相同单词
        'RRethy/vim-illuminate',
        config = function()
            require('illuminate').configure({
            })
        end
    },
    {
        -- 打开文件重新定位到上次的编辑位置
        "ethanholz/nvim-lastplace",
        config = true,
    },
    {
        -- 查看键盘映射 :WhichKey
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                window = {
                    border = "single", -- none, single, double, shadow
                },
            }
        end
    },
    -- {
    --     -- 快速跳转
    --     "folke/flash.nvim",
    --     event = "VeryLazy",
    --     ---@type Flash.Config
    --     opts = {},
    --     -- stylua: ignore
    --     keys = {
    --         { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
    --         { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
    --         { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
    --         { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    --         { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    --     },
    -- },
    {
        's1n7ax/nvim-window-picker',
        name = 'window-picker',
        version = '2.*',
        config = function()
            require 'window-picker'.setup({
                filter_rules = {
                    -- whether you want to include the window you are currently on to window
                    -- selection or not
                    include_current_win = true,
                    autoselect_one = false,

                    -- filter using buffer options
                    bo = {
                        -- if the file type is one of following, the window will be ignored
                        filetype = { 'NvimTree', 'neo-tree', 'notify', "neo-tree-popup", },
                        -- if the file type is one of following, the window will be ignored
                        buftype = { 'terminal', 'terminal' },
                    },
                },
            })

            -- 选择窗口
            local pick_win = function()
                local window_number = require('window-picker').pick_window()
                if window_number then vim.api.nvim_set_current_win(window_number) end
            end

            vim.keymap.set('n', '<leader>pw', pick_win, { desc = '[C] Pick Window' })
        end,

    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = true,
    },
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        }
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require("noice").setup({
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                    },
                },
                -- you can enable a preset for easier configuration
                presets = {
                    bottom_search = true,         -- use a classic bottom cmdline for search
                    -- command_palette = true, -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = false,       -- add a border to hover docs and signature help
                },
            })
        end
    },
}
