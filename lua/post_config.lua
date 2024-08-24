-----------------------------------------------------------------------------------------
--    翻滚页面内容时，保持光标所在屏幕的相对位置保持不变
-----------------------------------------------------------------------------------------
local function save_cursor_position()
	local pos = vim.api.nvim_win_get_cursor(0)
	return pos[1], pos[2]
end

local function restore_cursor_position(line, col)
	-- 获取当前缓冲区的总行数
	local total_lines = vim.api.nvim_buf_line_count(0)

	if line > total_lines - 5 then
		line = total_lines - 5
	end
	if line < 5 then
		line = 5
	end

	vim.api.nvim_win_set_cursor(0, { line, col })
end
-- 映射
vim.api.nvim_set_keymap("n", "<C-k>", "", {
	noremap = true,
	silent = true,
	callback = function()
		-- 保存当前光标位置
		local line, col = save_cursor_position()

		-- 执行默认的 Ctrl-y 操作（向上滚动一行）
		--vim.api.nvim_command(':NvimTreeToggle<cr>')
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-y>", true, false, true), "n", true)
		-- 恢复光标位置
		restore_cursor_position(line - 1, col)
	end,
})
vim.api.nvim_set_keymap("n", "<C-j>", "", {
	noremap = true,
	silent = true,
	callback = function()
		local line, col = save_cursor_position()
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-e>", true, false, true), "n", true)
		restore_cursor_position(line + 1, col)
	end,
})
