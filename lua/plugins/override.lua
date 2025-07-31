return {
  { "akinsho/bufferline.nvim", enabled = false },
  { "folke/noice.nvim", enabled = false },
  {
    "saghen/blink.cmp",
    opts = { keymap = {
      preset = "enter",
      ["<Tab>"] = { "select_next", "fallback" },
    } },
  },
  {
    "folke/snacks.nvim",
    opts = {
      indent = { enabled = false },
      dashboard = {
        preset = {
          header = [[
              ▀████▀▄▄              ▄█
                █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█
             ▄        █          ▀▀▀▀▄  ▄▀
            ▄▀ ▀▄      ▀▄              ▀▄▀
           ▄▀    █     █▀   ▄█▀▄      ▄█
           ▀▄     ▀▄  █     ▀██▀     ██▄█
            ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █
             █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀
            █   █  █      ▄▄           ▄▀
            ]],
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    keys = {
      -- disable the keymap to grep files
      -- { "<leader>cf", mode = { "n" }, false },

      -- add a keymap to browse plugin files
      {
        "<leader>fm",
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end,
        desc = "Format File",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "cpp" },
      textobjects = {
        lsp_interop = {
          enable = true,
          -- border = "single",
          floating_preview_opts = {
            border = "rounded",
          },
          peek_definition_code = {
            -- ["gk"] = "@function.outer",
            -- ["<leader>dF"] = "@class.outer",
            ["gk"] = {
              query = "@function.outer",
              desc = "[Treesitter] Peek definition code (function). Press the shortcut twice to enter the floating window.",
            },
            ["gK"] = {
              query = "@class.outer",
              desc = "[Treesitter] Peek definition code (class). Press the shortcut twice to enter the floating window.",
            },
          },
        },
      },
    },
  },
}
