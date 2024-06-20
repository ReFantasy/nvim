return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        require("null-ls").setup({
            sources = {
                null_ls.builtins.formatting.clang_format.with({
                    extra_args = { "--style", "Microsoft" },
                }),
                -- null_ls.builtins.diagnostics.pylint,
                null_ls.builtins.formatting.black,
                -- null_ls.builtins.diagnostics.selene,
            },
        })
    end,
}
