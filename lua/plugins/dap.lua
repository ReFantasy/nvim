return {
    {
        'mfussenegger/nvim-dap',
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
            vim.keymap.set('n', '<F5>', function() require 'telescope'.extensions.dap.configurations {} end)
            vim.keymap.set('n', '<F9>', function() require('dap').toggle_breakpoint() end)
            vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
            vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)

            -- vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
            vim.keymap.set('n', '<F12>', '<cmd>DapTerminate<cr><cmd>only!<cr>')

            -- default_setup
            vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
            vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
            vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
            vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
            vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
                require('dap.ui.widgets').hover()
            end)
            vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
                require('dap.ui.widgets').preview()
            end)
            vim.keymap.set('n', '<Leader>df', function()
                local widgets = require('dap.ui.widgets')
                widgets.centered_float(widgets.frames)
            end)
            vim.keymap.set('n', '<Leader>ds', function()
                local widgets = require('dap.ui.widgets')
                widgets.centered_float(widgets.scopes)
            end)

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

            -- debug cpp
            dap.adapters.cppdbg = {
                id = 'cppdbg',
                type = 'executable',
                -- command = '' .. vim.fn.exepath('OpenDebugAD7'),
                command = os.getenv("HOME") .. '/.local/share/nvim/mason/bin/OpenDebugAD7',
            }

            dap.configurations.cpp = {
                {
                    type = "cppdbg",
                    name = "Launch file",
                    request = "launch",
                    --program = "/home/refantasy/.config/nvim/learnlsp/a.out",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopAtEntry = true,
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
