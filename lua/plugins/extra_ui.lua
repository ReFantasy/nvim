-- return {
--     {
--         'projekt0n/github-nvim-theme',
--         enabled = false,
--         tag = 'v1.0.2',
--         lazy = false,    -- make sure we load this during startup if it is your main colorscheme
--         priority = 1000, -- make sure to load this before all the other start plugins
--         config = function()
--             require('github-theme').setup({
--                 options = {
--                     transparent = false,
--                     styles = {
--                         comments = 'italic',
--                     },
--                 },
--             })
--
--             -- local specs = require('github-theme.spec').load()
--             -- local spec = require('github-theme.spec').load('github_dark')
--             -- print(vim.inspect(spec.syntax))
--
--             vim.cmd('colorscheme github_dark')
--         end,
--     },
-- }

-- return {
--     "loctvl842/monokai-pro.nvim",
--     config = function()
--         require("monokai-pro").setup({})
--         vim.cmd('colorscheme monokai-pro-machine')
--     end
-- }

-- return {
--     {
--         "tanvirtin/monokai.nvim",
--         enabled = true,
--         config = function()
--             -- require("monokai-pro").setup({})
--             vim.cmd('colorscheme monokai_pro')
--         end
--     },
-- }

return -- Lazy
{
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
        -- somewhere in your config:
        vim.cmd("colorscheme onedark")
    end
}


-- return {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     priority = 1000,
--     config = function()
--         require("catppuccin").setup({
--             flavour = "auto", -- latte, frappe, macchiato, mocha
--             background = { -- :h background
--                 light = "latte",
--                 dark = "mocha",
--             },
--             transparent_background = false, -- disables setting the background color.
--             show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
--             term_colors = false,    -- sets terminal colors (e.g. `g:terminal_color_0`)
--             dim_inactive = {
--                 enabled = false,    -- dims the background color of inactive window
--                 shade = "dark",
--                 percentage = 0.15,  -- percentage of the shade to apply to the inactive window
--             },
--             no_italic = false,      -- Force no italic
--             no_bold = false,        -- Force no bold
--             no_underline = false,   -- Force no underline
--             styles = {              -- Handles the styles of general hi groups (see `:h highlight-args`):
--                 comments = { "italic" }, -- Change the style of comments
--                 conditionals = { "italic" },
--                 loops = {},
--                 functions = {},
--                 keywords = {},
--                 strings = {},
--                 variables = {},
--                 numbers = {},
--                 booleans = {},
--                 properties = {},
--                 types = {},
--                 operators = {},
--                 -- miscs = {}, -- Uncomment to turn off hard-coded styles
--             },
--             color_overrides = {},
--             custom_highlights = {},
--             default_integrations = true,
--             integrations = {
--                 cmp = true,
--                 gitsigns = true,
--                 nvimtree = true,
--                 treesitter = true,
--                 notify = false,
--                 mini = {
--                     enabled = true,
--                     indentscope_color = "",
--                 },
--                 -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
--             },
--         })
--
--         -- setup must be called before loading
--         vim.cmd.colorscheme "catppuccin"
--     end
-- }
