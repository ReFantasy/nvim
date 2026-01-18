return {
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function()
      require("window-picker").setup()

      -- 选择窗口
      local pick_win = function()
        local window_number = require("window-picker").pick_window()
        if window_number then
          vim.api.nvim_set_current_win(window_number)
        end
      end
      vim.keymap.set("n", "<leader>pw", pick_win, { desc = "[C] Pick Window" })
    end,
  },
}
