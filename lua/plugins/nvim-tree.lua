
local function nvtree_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  -- vim.keymap.set('n', '<C-u>', api.tree.change_root_to_parent,        opts('Up'))
  -- vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end

return {
	{
		"nvim-tree/nvim-tree.lua",
		enabled = true,
		version = "*",
		lazy = false,
		--dependencies = {
		--	"kyazdani42/nvim-web-devicons"
		--},
		config = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            -- 打开（关闭）文件目录快捷键
            vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<cr>", {silent = true, noremap = true})
            
			require("nvim-tree").setup({
                on_attach = nvtree_on_attach
            })
		end,
	}
}
