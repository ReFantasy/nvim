return {
  { "akinsho/bufferline.nvim", enabled = false },
  { "folke/noice.nvim", enabled = false },
  {
    "saghen/blink.cmp",
    -- use a release tag to download pre-built binaries
    version = "1.*",
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',
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

  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        -- pyright = {},
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = { typeCheckingMode = "off" },
            },
          },
        },
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy=false",
            "--all-scopes-completion",
            "--completion-style=detailed",
            "-j=8",
            "--pch-storage=memory",
            "--fallback-style=Microsoft",
            "--pretty",
            -- "--header-insertion=iwyu", -- 自动插入头文件iwyu
            "--header-insertion=never",
            "--header-insertion-decorators", -- 使用修饰符来标记插入的头文件
            --"-Wno-unused",
          },
        },
      },
    },
  },
}
