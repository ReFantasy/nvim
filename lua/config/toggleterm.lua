return {
        'akinsho/toggleterm.nvim', 
         tag = "v2.11.0", 
         config = function()
             require("toggleterm").setup({
                 open_mapping = [[<c-\>]],
                 direction = "float",
                 vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {noremap = true, silent = true})
             })
         end,
}
