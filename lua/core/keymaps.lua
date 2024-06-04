local keymap = vim.keymap

-- define common options
local opts = {    noremap = true,      -- non-recursive
                  silent = true,       -- do not show message
              }


-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set('v', 'H', '<gv', opts)
keymap.set('v', 'L', '>gv', opts)


-- 窗口操作
--keymap.set("n", "<leader>sv", "<C-w>v") --水平新增窗口
--keymap.set("n", "<leader>sh", "<C-w>s") --垂直新增窗口

keymap.set('n', '<C-h>', '<C-w>h', opts)
keymap.set('n', '<C-j>', '<C-w>j', opts)
keymap.set('n', '<C-k>', '<C-w>k', opts)
keymap.set('n', '<C-l>', '<C-w>l', opts)

keymap.set('n', '<S-Up>', ':resize -2<CR>', opts)
keymap.set('n', '<S-Down>', ':resize +2<CR>', opts)
keymap.set('n', '<S-Left>', ':vertical resize -2<CR>', opts)
keymap.set('n', '<S-Right>', ':vertical resize +2<CR>', opts)

-- buffer切换
keymap.set("n", "<A-Tab>", "<cmd>bNext<CR>", opts)
-- keymap.set("n", "<leader>bc", "<cmd>bd<CR>", opts) --关闭buffer

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode

--[[
-----------------------------------------------------------------------------------------
--翻滚页面内容时，保持光标所在屏幕的相对位置保持不变
-----------------------------------------------------------------------------------------
local function save_cursor_position()
    local pos = vim.api.nvim_win_get_cursor(0)
    return pos[1], pos[2]
end

local function restore_cursor_position(line, col)
    local total_lines = vim.api.nvim_buf_line_count(0)

    if line > total_lines-10 then
        line = total_lines-10
    end
    if line < 10 then
        line = 10
    end

    vim.api.nvim_win_set_cursor(0, {line, col})
end
vim.api.nvim_set_keymap('n', '<C-k>', '', {
                noremap = true,
                silent = true,
                callback = function()
                  local line, col = save_cursor_position()

                  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-y>", true, false, true), 'n', true)
                  restore_cursor_position(line-1, col)
                end
            })
vim.api.nvim_set_keymap('n', '<C-j>', '', {
                noremap = true,
                silent = true,
                callback = function()
                  local line, col = save_cursor_position()
                  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-e>", true, false, true), 'n', true)
                  restore_cursor_position(line+1, col)
                end
            })
            ]]--

