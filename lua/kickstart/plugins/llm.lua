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

			vim.keymap.set({ "n", "v" }, "<leader>H", groq.invoke, { desc = "llm groq" })
			vim.keymap.set({ "n", "v" }, "<leader>J", perplexity.invoke, { desc = "llm perplexity" })
			vim.keymap.set({ "n", "v" }, "<leader>K", anthropic.invoke, { desc = "llm anthropic" })
			vim.keymap.set({ "n", "v" }, "<leader>L", openai.invoke, { desc = "llm openai" })
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
