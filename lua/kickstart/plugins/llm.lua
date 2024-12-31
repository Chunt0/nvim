return {
	{ -- Integrated LLM
		"Chunt0/llm.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local groq = require("groq")
			local openai = require("openai")
			local anthropic = require("anthropic")
			local perplexity = require("perplexity")
			local ollama = require("ollama")
			local prompts = require("prompts")
			local my_prompts = require("custom/my_prompts")
			local models = require("models")
			local my_models = require("custom/my_models")
			local vars = require("variables")

			-- Example use of models
			-- models.openai = my_models.openai.o1_mini -- Use gpt-4o-mini instead of default gpt-4o
			models.ollama = my_models.ollama.deepseek_coder_v2
			-- models.groq = my_models.groq.mixtral_8x7b -- Use mixtral_8x7b instead of default llama3.1-70b-versatile

			-- Example use of system_prompt set up
			prompts.system_prompt = my_prompts.helpful_prompt

			-- Example use of vars
			-- vars.temp = 1.5 -- value between 0 - 2 default is 0.7, increases randomness in token sampling. Higher values create greater randomness.
			-- vars.top_p = 0.5 -- value between 0 - 1 default is 1, determines the range of possible tokens to be sampled from. A value less than 1 reduces the space of possible tokens to be sampled
			-- vars.presence_penalty =  -- value between -2 - 2  default is 0, a higher value increases penalty for repeating previously produced tokens

			vim.keymap.set({ "n", "v" }, "<leader>J", anthropic.invoke, { desc = "llm anthropic" })
			vim.keymap.set({ "n", "v" }, "<leader>j", anthropic.code, { desc = "llm anthropic code" })
			vim.keymap.set({ "n", "v" }, "<leader>K", ollama.invoke, { desc = "llm ollama" })
			vim.keymap.set({ "n", "v" }, "<leader>k", ollama.code, { desc = "llm ollama code" })
			vim.keymap.set({ "n", "v" }, "<leader>L", openai.invoke, { desc = "llm openai" })
			vim.keymap.set({ "n", "v" }, "<leader>l", openai.code, { desc = "llm openai code" })
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
