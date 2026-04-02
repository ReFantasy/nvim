-- 分屏
vim.keymap.set("n", "|", "<cmd>vsplit<CR>")
vim.keymap.set("n", "\\", "<cmd>split<CR>")
-- vim.keymap.set({ "n", "i", "v" }, "<leader>qq", "<cmd>wa<CR><cmd>qa<CR>", { desc = "save all and quit vim" })

-- -- 调整窗口大小
-- vim.keymap.set("n", "<S-Up>", ":resize -2<CR>", opts)
-- vim.keymap.set("n", "<S-Down>", ":resize +2<CR>", opts)
-- vim.keymap.set("n", "<S-Left>", ":vertical resize -2<CR>", opts)
-- vim.keymap.set("n", "<S-Right>", ":vertical resize +2<CR>", opts)
-- -- 分屏
-- vim.keymap.set("n", "|", "<cmd>vsplit<CR>", opts)
-- vim.keymap.set("n", "\\", "<cmd>split<CR>", opts)
-- -- 单行或多行移动
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- vim.keymap.set("v", "H", "<gv", opts)
-- vim.keymap.set("v", "L", ">gv", opts)

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		-- In this case, we create a function that lets us more easily define mappings specific
		-- for LSP related items. It sets the mode, buffer and description for us each time.
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end
		-- 定义快捷键

		-- map("ga", vim.lsp.buf.code_action, "[L]sp Code Action", { "n", "x" })
		-- map("gn", vim.lsp.buf.rename, "[L]sp Code Rename", { "n", "x" })
		-- map("gD", vim.lsp.buf.declaration, "[L]sp [D]eclaration")

		if client and client:supports_method("textDocument/inlayHint", event.buf) then
			map("<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end, "[T]oggle Inlay [H]ints")
		end
	end,
})
