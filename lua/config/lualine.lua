function get_os_type()
            local separator = package.config:sub(1,1)
    
            if separator == '\\' then
                return require'nvim-web-devicons'.get_icon('windows', '')
            else
            -- For Unix-like systems
                local handle = io.popen("uname -a")
                local result = handle:read("*a")
                handle:close()
                if result:find("Debian") then
                    return require'nvim-web-devicons'.get_icon('Debian', '')
                elseif result:find("Ubuntu") then
                    return require'nvim-web-devicons'.get_icon('ubuntu', '')
                elseif result:find("Darwin") then
                    return require'nvim-web-devicons'.get_icon('apple', '')
                else
                    return require'nvim-web-devicons'.get_icon('linux', '')
                end
            end
end

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
	    local custom_theme = require'lualine.themes.onedark'
        
	    require("lualine").setup{
		    options = {
			    theme = custom_theme,
			    icons_enabled = false,
			    section_separators = { left = '', right = ''},
			    component_separators = { left = '|', right = '|' }
		    },
            
			sections = {
			    lualine_a = {get_os_type,'mode'},
			    lualine_b = {'branch', 'diff', 'diagnostics'},
			    lualine_c = {'filename'},
			    lualine_x = {'encoding' , 'hostname'},
			    lualine_y = {'progress'},
			    lualine_z = {'location'}
		    },
	    }
    end,
}
