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
			local models = require("models")
			local my_prompts = require("custom/my_prompts")
			local my_models = require("custom/my_models")

			models.perplexity = my_models.perplexity.perplexity_chat
			models.openai = my_models.openai.gpt_4o
			models.anthropic = my_models.anthropic.claude_sonnet
			models.groq = my_models.groq.gemma_2

			prompts.system_prompt = my_prompts.helpful_prompt

			vim.keymap.set({ "n", "v" }, "<leader>H", anthropic.invoke, { desc = "llm anthropic" })
			vim.keymap.set({ "n", "v" }, "<leader>J", perplexity.invoke, { desc = "llm perplexity" })
			vim.keymap.set({ "n", "v" }, "<leader>K", groq.invoke, { desc = "llm groq" })
			vim.keymap.set({ "n", "v" }, "<leader>L", openai.invoke, { desc = "llm openai" })
			vim.keymap.set({ "n", "v" }, "<leader>l", openai.code, { desc = "llm openai code" })
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
