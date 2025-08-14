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
  {
    "neovim/nvim-lspconfig",
    keys = {
      -- add a keymap
      {
        "<leader>rn",
        vim.lsp.buf.rename,
        desc = "Find Plugin File",
      },
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- will be automatically installed with mason and loaded with lspconfig
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
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      close_if_last_window = true,
      enable_git_status = true,
      default_component_configs = {
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "󰉖",
          folder_empty_open = "󰷏",
          -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
          -- then these will never be used.
          default = "*",
          highlight = "NeoTreeFileIcon",
          provider = function(icon, node, state) -- default icon provider utilizes nvim-web-devicons if available
            if node.type == "file" or node.type == "terminal" then
              local success, web_devicons = pcall(require, "nvim-web-devicons")
              local name = node.type == "terminal" and "terminal" or node.name
              if success then
                local devicon, hl = web_devicons.get_icon(name)
                icon.text = devicon or icon.text
                icon.highlight = hl or icon.highlight
              end
            end
          end,
        },
      },
      window = {
        position = "left",
        width = 35,
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ui = { border = "rounded" },
    },
  },
}
