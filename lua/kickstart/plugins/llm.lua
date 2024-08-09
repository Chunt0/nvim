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

			prompts.system_prompt = my_prompts.system_prompt

			vim.keymap.set({ "n", "v" }, "<leader>H", anthropic.invoke, { desc = "llm anthropic" })
			vim.keymap.set({ "n", "v" }, "<leader>J", perplexity.invoke, { desc = "llm perplexity" })
			vim.keymap.set({ "n", "v" }, "<leader>K", groq.invoke, { desc = "llm groq" })
			vim.keymap.set({ "n", "v" }, "<leader>L", openai.invoke, { desc = "llm openai" })
			vim.keymap.set({ "n", "v" }, "<leader>l", openai.dalle, { desc = "llm openai code" })
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
