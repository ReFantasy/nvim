-- 参数为配置文件名
vim.lsp.enable({'lua_ls'})
vim.lsp.enable({'basedpyright'})
vim.lsp.enable({'clangd'})

vim.api.nvim_create_autocmd('LspAttach', {
  -- group = vim.api.nvim_create_auroup('lsp-attach', {clear=true}),
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(ev)
	  --btain LSP client 
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    -- auto completion
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end

    -- keymaps
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer=ev.buf, desc="LSP: Goto Definition"})
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {buffer=ev.buf, desc="LSP: Goto Declaration"})
  end,
})

vim.cmd("set completeopt+=noselect")


