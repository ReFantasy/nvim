return {
    {
        'mhartington/formatter.nvim',
        config = function()
            local util = require "formatter.util"
            require("formatter").setup {
                logging = false,
                filetype = {
                    cpp = {
                        function()
                            return {
                                exe = "clang-format",
                                args = {
                                    "--style=Microsoft",
                                    "-assume-filename",
                                    util.escape_path(util.get_current_buffer_file_name()),
                                },
                                stdin = true,
                            }
                        end
                    },
                    python = {
                        require("formatter.filetypes.python").black,
                        -- function()
                        --     return {
                        --         exe = "black",
                        --         args = { "--skip-string-normalization", "-q", "--stdin-filename", util.escape_path(util.get_current_buffer_file_name()), "-" },
                        --         stdin = true,
                        --     }
                        -- end
                    },
                    ["*"] = {
                        require("formatter.filetypes.any").substitute_trailing_whitespace,
                        function() vim.lsp.buf.format { async = true } end,
                    },
                },
            }

            -- 键盘映射
            vim.keymap.set("n", "<leader>fm", '<cmd>Format<cr>', { silent = true, desc = '[F]ormat code' })

            -- local lfm = function()
            --     vim.lsp.buf.format { async = true }
            -- end
            -- vim.keymap.set("n", '<leader>lfm', lfm, { desc = 'LSP [F]ormat code' })
        end,
    },
}
