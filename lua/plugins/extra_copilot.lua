return {
	-- copilot
	{
		"github/copilot.vim",
        -- lazy = true,
	},
	{
		branch = "canary",
        lazy = false,
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			-- { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "github/copilot.vim" },
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			debug = false,
			-- model = "gpt-4", -- GPT model to use, 'gpt-3.5-turbo', 'gpt-4', or 'gpt-4o'
			window = {
				-- layout = "float",
				relative = "cursor",
				width = 0.5,
				height = 0.9,
				row = 1,
			},

			-- default prompts
			prompts = {
				Explain = {
					prompt = "/COPILOT_EXPLAIN Write an explanation for the active selection as paragraphs of text. Please answer in Chinese.",
				},
				-- Review = {
				-- 	prompt = "/COPILOT_REVIEW Review the selected code.",
				-- 	callback = function(response, source)
				-- 		-- see config.lua for implementation
				-- 	end,
				-- },
				-- Fix = {
				-- 	prompt = "/COPILOT_GENERATE There is a problem in this code. Rewrite the code to show it with the bug fixed.",
				-- },
				-- Optimize = {
				-- 	prompt = "/COPILOT_GENERATE Optimize the selected code to improve performance and readablilty.",
				-- },
				-- Docs = {
				-- 	prompt = "/COPILOT_GENERATE Please add documentation comment for the selection.",
				-- },
				-- Tests = {
				-- 	prompt = "/COPILOT_GENERATE Please generate tests for my code.",
				-- },
				-- FixDiagnostic = {
				-- 	prompt = "Please assist with the following diagnostic issue in file:",
				-- 	selection = select.diagnostics,
				-- },
				-- Commit = {
				-- 	prompt = "Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.",
				-- 	selection = select.gitdiff,
				-- },
				-- CommitStaged = {
				-- 	prompt = "Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.",
				-- 	selection = function(source)
				-- 		return select.gitdiff(source, true)
				-- 	end,
				-- },
			},
		},
		-- config = function(_, opts) end,
		keys = {
			{
				"<leader>ccq",
				function()
					local input = vim.fn.input("Quick Chat: ") .. "\nPlease answer in Chinese."
					if input ~= "" then
						require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
					end
				end,
				desc = "CopilotChat - Quick chat",
			},
			{ "<leader>cco", "<cmd>CopilotChatOpen<cr>", desc = "[C] CopilotChat - Open chat" },
			{ "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "[C] CopilotChat - Explain code" },
			{ "<leader>ccf", "<cmd>CopilotChatFix<cr>", desc = "[C] CopilotChat - Fix code" },
		},
	},
}
