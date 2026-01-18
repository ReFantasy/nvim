return {
    {
        "stevearc/conform.nvim",
        keys = {
            {
                "<leader>fm",
                function()
                    require("conform").format({ async = true, lsp_format = "fallback" })
                end,

                desc = "Format File",
            },
        },

        opts = function()
            local opts = {
                format_on_save = nil,
            }
            return opts
        end,
    },
}
