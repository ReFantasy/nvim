return {
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
            picker = {
                sources = {
                    explorer = {
                        -- your explorer picker configuration comes here
                        -- or leave it empty to use the default settings
                        layout = {
                            preset = "sidebar",
                            preview = false,
                            auto_hide = { "input" },
                        },
                    }
                }
            }
        },
    },
    {
        "saghen/blink.cmp",
        -- use a release tag to download pre-built binaries
        version = "1.*",
        -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
        -- build = 'cargo build --release',
        -- If you use nix, you can build from source using latest nightly rust with:
        -- build = 'nix run .#build-plugin',
        opts = {
            keymap = {
                preset = "enter",
                ["<Tab>"] = { "select_next", "fallback" },
            }
        },
    },
}
