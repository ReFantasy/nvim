-- lazy load
local keys = {
    { '<F5>', function()
        require('core.utility.cmake_build').build()
        require 'telescope'.extensions.dap.configurations {}
    end },
    { '<F9>',  function() require('dap').toggle_breakpoint() end },
    { '<F10>', function() require('dap').step_over() end },
    { '<F11>', function() require('dap').step_into() end },

    -- { '<F12>',     '<cmd>DapTerminate<cr><cmd>only!<cr>' },
    { '<F12>', function() require('dap').terminate() end },
}
return {
    {
        'mfussenegger/nvim-dap',
        keys = keys,
        dependencies = {
            {
                "rcarriga/nvim-dap-ui",
                dependencies = { 'nvim-neotest/nvim-nio' },
            },
            'theHamsta/nvim-dap-virtual-text',
            'nvim-telescope/telescope-dap.nvim',
            --"jay-babu/mason-nvim-dap.nvim",
        },
        config = function()
            -- visual studio sytle
            -- vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
            local F5Action = function()
                require('core.utility.cmake_build').build()
                local debug_status = require('dap').status()
                if string.len(debug_status) == 0
                then
                    require 'telescope'.extensions.dap.configurations()
                else
                    --require('dap').continue()
                    require 'telescope'.extensions.dap.configurations()
                end
            end
            vim.keymap.set('n', '<F5>', F5Action)
            vim.keymap.set('n', '<F9>', function() require('dap').toggle_breakpoint() end)
            vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
            vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
            vim.keymap.set('n', '<F12>', function() require('dap').disconnect() end)

            -- start dap
            local dap = require('dap')

            require('nvim-dap-virtual-text').setup {}

            -- dapui
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end


            vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = '', linehl = '', numhl = '' })


            dap.adapters.codelldb = {
                type = 'server',
                port = "${port}",
                executable = {
                    command = os.getenv("HOME") .. '/.local/share/nvim/mason/bin/codelldb',
                    args = { "--port", "${port}" },
                    -- On windows you may have to uncomment this:
                    -- detached = false,
                }
            }

            -- Requires gdb 14.0+
            -- dap.adapters.gdb = {
            --     type = "executable",
            --     command = "/home/refantasy/.conda/envs/cpplib/bin/gdb",
            --     args = { "-i", "dap" }
            -- }

            -- dap.adapters.cppdbg = {
            --     id = 'cppdbg',
            --     type = 'executable',
            --     -- command = '' .. vim.fn.exepath('OpenDebugAD7'),
            --     command = os.getenv("HOME") .. '/.local/share/nvim/mason/bin/OpenDebugAD7',
            -- }

            dap.configurations.cpp = {
                -- {
                --     type = "cppdbg",
                --     name = "Launch file",
                --     request = "launch",
                --     program = function()
                --         return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                --     end,
                --     cwd = '${workspaceFolder}',
                --     stopAtEntry = true,
                -- },
                -- {
                --     name = "Launch",
                --     type = "gdb",
                --     request = "launch",
                --     program = function()
                --         return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                --     end,
                --     cwd = "${workspaceFolder}",
                --     stopAtBeginningOfMainSubprogram = false,
                -- },
                {
                    name = "Launch file",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                },
            }

            -- deug python
            dap.adapters.python = {
                type = 'executable',
                command = 'python',
                args = { '-m', 'debugpy.adapter' },
            }

            dap.configurations.python = {
                {
                    type = 'python',
                    request = 'launch',
                    name = "Launch file",
                    program = "${file}",
                    pythonPath = function()
                        return 'python'
                    end,
                },
            }
        end,
    },
}
