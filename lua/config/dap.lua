return {
    -- nvim-dap
    {
        'mfussenegger/nvim-dap',
         config = function()
             local dap = require('dap')

             -- keymap
             vim.api.nvim_set_keymap('n','<F5>', ":lua require'dap'.continue()<CR>",{})
             vim.api.nvim_set_keymap('n','<F9>', ":lua require'dap'.toggle_breakpoint()<CR>",{})
             vim.api.nvim_set_keymap('n','<F10>', ":lua require'dap'.step_over()<CR>",{})
             vim.api.nvim_set_keymap('n','<F11>', ":lua require'dap'.step_into()<CR>",{})
             vim.api.nvim_set_keymap('n','<S-t>', ":lua require'dap'.terminate()<CR>",{})

             -- 设置输出到终端
             

             -- python
             dap.adapters.python = {
                 type = 'executable';
                 command = 'python';
                 args = { '-m', 'debugpy.adapter' };
             }
             dap.configurations.python = {
               {
                 type = 'python';
                 request = 'launch';
                 name = "Launch file";
                 program = "${file}";
                 pythonPath = function()
                   return 'python'
                 end;
               },
              }

		 end,
    },
    -- dap virtual text
    {
        'theHamsta/nvim-dap-virtual-text',
        config = function()
            require('nvim-dap-virtual-text').setup()
        end,
    },
}
