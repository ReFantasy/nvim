return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
	    local custom_theme = require'lualine.themes.onedark'
            local function hello()
		    return tostring(cpustat)
	    end

	    require("lualine").setup{
		    -- options = {tneme='vscode'}
		    options = {
			    theme = custom_theme,
			    icons_enabled = false,
			    section_separators = { left = '', right = ''},
			    component_separators = { left = '|', right = '|' }
		    },

			    sections = {
			    lualine_a = {'mode'},
			    lualine_b = {'branch', 'diff', 'diagnostics'},
			    lualine_c = {'filename'},
			    lualine_x = {'encoding' , 'hostname'},
			    lualine_y = {'progress'},
			    lualine_z = {'location'}
		    },
	    }
    end,
}
