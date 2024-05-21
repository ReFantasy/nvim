return {
        'akinsho/toggleterm.nvim', 
         tag = "v2.11.0", 
         config = function()
             require("toggleterm").setup({
                 open_mapping = [[<c-\>]],
                 direction = "float"
             })

         end,
}
