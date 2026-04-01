vim.pack.add({
	{ src = "https://github.com/CopilotC-Nvim/CopilotChat.nvim" },
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/github/copilot.vim",
})

require("CopilotChat").setup({
	-- See Configuration section for options
	-- model = "gpt-4.1", -- AI model to use
	-- model = "gpt-5", -- AI model to use
	-- model = "gpt-5.2-codex", -- AI model to use
	-- model = "gpt-5.3-codex", -- AI model to use ':CopilotChatModels' for available models
	language = "Chinese", -- "English", -- Default language to use for answers
	window = {
		width = 0.33,
	},
	-- prompts = {
	--   MyCustomPrompt = {
	--     prompt = "Explain how it works.",
	--     system_prompt = "You are very good at explaining stuff",
	--     mapping = "<leader>ccmc",
	--     description = "My custom prompt description",
	--   },
	--   Yarrr = {
	--     system_prompt = "You are fascinated by pirates, so please respond in pirate speak.",
	--   },
	--   NiceInstructions = {
	--     system_prompt = "You are a nice coding tutor, so please respond in a friendly and helpful manner.",
	--   },
	-- },
})
