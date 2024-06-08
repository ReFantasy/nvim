return {
    {
        "mfussenegger/nvim-lint",
        config = function()
            require('lint').linters_by_ft = {
                -- markdown = { 'vale', }
                python = { 'ruff', },
                lua = { 'selene', },
            }
        end
    }
}
