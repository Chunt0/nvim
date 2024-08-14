return {
	{ -- Integrated LLM
		"Chunt0/llm.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local groq = require("groq")
			local openai = require("openai")
			local anthropic = require("anthropic")
			local perplexity = require("perplexity")
			local prompts = require("prompts")
			local my_prompts = require("custom/my_prompts")
			local models = require("models")
			local my_models = require("custom/my_models")
			local vars = require("variables")

			-- Example use of models
			-- models.openai = my_models.openai.gpt_4o_mini -- Use gpt-4o-mini instead of default gpt-4o
			-- models.groq = my_models.groq.mixtral_8x7b -- Use mixtral_8x7b instead of default llama3.1-70b-versatile

			-- Example use of system_prompt set up
			prompts.system_prompt = my_prompts.faithful_prompt

			-- Example use of vars
			-- vars.temp = 1.5 -- value between 0 - 2 default is 0.7, increases randomness in token sampling. Higher values create greater randomness.
			-- vars.top_p = 0.5 -- value between 0 - 1 default is 1, determines the range of possible tokens to be sampled from. A value less than 1 reduces the space of possible tokens to be sampled
			-- vars.presence_penalty =  -- value between -2 - 2  default is 0, a higher value increases penalty for repeating previously produced tokens

			vim.keymap.set({ "n", "v" }, "<leader>H", groq.invoke, { desc = "llm groq" })
			vim.keymap.set({ "n", "v" }, "<leader>J", perplexity.invoke, { desc = "llm perplexity" })
			vim.keymap.set({ "n", "v" }, "<leader>K", anthropic.invoke, { desc = "llm anthropic" })
			vim.keymap.set({ "n", "v" }, "<leader>L", openai.invoke, { desc = "llm openai" })
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
