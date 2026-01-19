return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
      {
        "github/copilot.vim",
        -- "zbirenbaum/copilot.lua",
      },
    },
    build = "make tiktoken",
    opts = {
      -- See Configuration section for options
      -- model = "gpt-4.1", -- AI model to use
      -- model = "gpt-5", -- AI model to use
      model = "gpt-5.2-codex", -- AI model to use
      language = "Chinese", -- "English", -- Default language to use for answers
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
    },
  },
}
