function get_os_icon()
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



function get_gpu_usage()
    local handle = io.popen("nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits")
    local result = handle:read("*a")
    handle:close()

    if result then
        local usage = tonumber(result:match("%d+"))
        if usage then
            --return usage .. "%"
            --return "GPU:" .. tostring(usage)
            return "GPU:" .. string.format("%3.0f", usage)
        else
            return nil --"Unable to parse GPU usage"
        end
    else
        return nil--"Unable to get GPU usage"
    end
end

function get_cpu_usage()
    local os_type = get_os_type()
    
    if os_type == "Windows" then
        -- Windows system
        local handle = io.popen("wmic cpu get loadpercentage /value")
        local result = handle:read("*a")
        handle:close()

        local usage = result:match("LoadPercentage=(%d+)")
        if usage then
            return usage .. "%"
        else
            return "Unable to get CPU usage"
        end
    else
        -- Unix-like system
        local handle = io.popen("top -bn1 | grep 'Cpu(s)'")
        local result = handle:read("*a")
        handle:close()

        local usage = result:match("(%d+%.%d+) id")
        if usage then
            usage = 100 - tonumber(usage)
            return "CPU:" .. usage --string.format("%.2f%%", usage)
        else
            return "Unable to get CPU usage"
        end
    end
end




return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
	    local custom_theme = require'lualine.themes.onedark'
        --custom_theme.normal.b.bg = '#cc7979'

        function git_icon()
            return require'nvim-web-devicons'.get_icon('git', '')
        end
       
	    require("lualine").setup{
		    options = {
			    theme = custom_theme,
			    icons_enabled = false,
			    section_separators = { left = '', right = ''},
			    component_separators = { left = '|', right = '|' }
		    },
            
			sections = {
			    lualine_a = {'mode', get_os_icon},
			    lualine_b = {{'branch', icons_enabled=false}, 'diff', 'diagnostics'},
			    lualine_c = {'filename'},
			    lualine_x = {
                    {'hostname', color = {fg='#fcb2af'}},
                },
			    lualine_y = {'progress' },
			    lualine_z = {'location'}
		    },
           refresh = {
               statusline = 1000,
           },
	    }
    end,
}
