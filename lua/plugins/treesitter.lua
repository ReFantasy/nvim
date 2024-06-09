return {
    "nvim-treesitter/nvim-treesitter",
    tag = 'v0.9.2',
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = { "cpp", "lua", "vim", "vimdoc", "python" },
            -- ensure_installed = "all",
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            },
            indent = {
                enable = true,
            },
        }
    end,
}
