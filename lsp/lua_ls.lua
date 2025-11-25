return {
    cmd = { 'lua-language-server' },
		  settings = {
			Lua = {
				runtime = {
					version = 'LuaJIT',
				},
				diagnostics = {
					globals = {
						'vim',
						'require'
					},
				},
				completion = {
					callSnippet = "Replace"
				}
			}
		}
}
