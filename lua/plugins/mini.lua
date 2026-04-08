vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.nvim" },
	"https://github.com/nvim-telescope/telescope.nvim",
})
require("mini.pairs").setup()

require("mini.cursorword").setup() -- 高亮显示光标位置的单词
-- 设置非当前光标下的匹配单词：例如使用背景色，并移除下划线
vim.api.nvim_set_hl(0, "MiniCursorword", { bg = "#3a3a3a", ctermbg = 240 })
-- 设置光标下的当前单词：例如使用更醒目的背景色或加粗，同样移除下划线
vim.api.nvim_set_hl(0, "MiniCursorwordCurrent", { bg = "#5a5a5a", ctermbg = 242, bold = true })

-- showing notifications in bottom right corner
local win_config = function()
	local has_statusline = vim.o.laststatus > 0
	local pad = vim.o.cmdheight + (has_statusline and 1 or 0)
	return { anchor = "SE", col = vim.o.columns, row = vim.o.lines - pad }
end
require("mini.notify").setup({
	lsp_progress = { duration_last = 1500 },
	window = { config = win_config },
})
local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal" }) -- 获取当前主题纯文本 (Normal) 的高亮属性
vim.api.nvim_set_hl(0, "MiniNotifyNormal", { bg = normal_hl.bg })
vim.api.nvim_set_hl(0, "MiniNotifyBorder", { bg = normal_hl.bg, fg = "green" })
vim.api.nvim_set_hl(0, "MiniNotifyTitle", { bg = normal_hl.bg })

local function show_mini_notify_in_telescope(opts)
	opts = opts or {}
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	-- 1. 获取所有的通知信息
	local notices = MiniNotify.get_all()
	local results = {}
	for _, notice in ipairs(notices) do
		-- 将多行消息转换为单行以便在 Telescope 中友好显示
		local msg = notice.msg:gsub("\n", "  ")
		table.insert(results, msg)
	end
	-- 2. 创建并打开 Telescope Picker
	pickers
		.new(opts, {
			prompt_title = "Mini Notifications",
			finder = finders.new_table({
				results = results,
			}),
			sorter = conf.generic_sorter(opts),
			-- 3. 定义回车选中后的操作
			attach_mappings = function(prompt_bufnr, map)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					-- local selection = action_state.get_selected_entry()
					-- if selection then
					-- 	-- 选中后可以做点什么，比如原样打印或复制到寄存器
					-- 	print(selection[1])
					-- end
				end)
				return true
			end,
		})
		:find()
end
vim.keymap.set("n", "<leader>nh", function()
	-- MiniNotify.show_history()
	show_mini_notify_in_telescope({})
end, { desc = "Show notice history" })

require("mini.statusline").setup()
