return {
  {
    "stevearc/conform.nvim",
    keys = {
      {
        "<leader>fm",
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end,

        desc = "Format File",
      },
    },

    opts = function()
      local opts = {
        default_format_opts = {
          -- format_on_save = nil,
          timeout_ms = 3000,
          async = false, -- not recommended to change
          quiet = false, -- not recommended to change
          lsp_format = "fallback", -- not recommended to change
        },
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "black" },
          cpp = { "clang-format" },
        },
      }
      return opts
    end,
  },
}
