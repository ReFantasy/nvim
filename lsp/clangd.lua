return {
  cmd = { 'clangd',
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
}
