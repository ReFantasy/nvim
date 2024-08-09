return {
    "folke/which-key.nvim",
    dependencies = { "echasnovski/mini.icons" },
    event = "VeryLazy",
    opts = {
        win = {
            border = "single", -- none, single, double, shadow
        },
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}
