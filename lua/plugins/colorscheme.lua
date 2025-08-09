return {

  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_enable_italic = true
      -- vim.g.gruvbox_material_background = "hard"
      -- vim.g.gruvbox_material_float_style = "dim"
      -- vim.g.gruvbox_material_transparent_background = 1
      -- vim.g.gruvbox_material_menu_selection_background = "blue"
      -- vim.g.gruvbox_material_colors_override ={'float_style':['#1d2021', '234']}
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}
