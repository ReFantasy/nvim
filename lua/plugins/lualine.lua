function get_os_icon()
    local separator = package.config:sub(1, 1)

    if separator == '\\' then
        return require 'nvim-web-devicons'.get_icon('windows', '')
    else
        local handle = io.popen("uname -a")
        local result = handle:read("*a")
        handle:close()
        if result:find("Debian") then
            return require 'nvim-web-devicons'.get_icon('Debian', '')
        elseif result:find("Ubuntu") then
            return require 'nvim-web-devicons'.get_icon('ubuntu', '')
        elseif result:find("Darwin") then
            return require 'nvim-web-devicons'.get_icon('apple', '')
        else
            return require 'nvim-web-devicons'.get_icon('linux', '')
        end
    end
end

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

local mode = {
    "mode",
    --fmt = function(str)
    --	return "-- " .. str .. " --"
    --end,
}

local branch = {
    "branch",
    icons_enabled = false,
}

local diff = {
    "diff",
    --colored = false,
    --symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
    --cond = hide_in_width
}

local diagnostics = {
    "diagnostics",
    --sources = { "nvim_diagnostic" },
    --sections = { "error", "warn" },
    --symbols = { error = " ", warn = " " },
    --colored = false,
    --update_in_insert = false,
    --always_visible = true,
}



local filename = {
    "filename",
}

local hostname = {
    "hostname",
    color = { fg = '#fd567c' },
}

local location = {
    "location",
    padding = 0,
}

-- cool function for progress
local progress = {
    "progress"
}

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local status_ok, lualine = pcall(require, "lualine")
        if not status_ok then
            return
        end

        local custom_theme = require 'lualine.themes.onedark'

        lualine.setup({
            options = {
                theme = custom_theme, --"auto",
                icons_enabled = false,
                section_separators = { left = '', right = '' },
                component_separators = { left = '|', right = '|' },
                disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
                always_divide_middle = true,
                -- refresh = {
                --     statusline = 0,
                --     tabline = 0,
                --     winbar = 0,
                -- }
            },
            sections = {
                lualine_a = { mode, get_os_icon },
                lualine_b = { branch, diff, diagnostics },
                lualine_c = { filename },
                lualine_x = { hostname },
                lualine_y = { progress },
                lualine_z = { location },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            extensions = {},
        })
    end
}
