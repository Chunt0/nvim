return {
	{ -- Integrated LLM
		"Chunt0/llm.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local groq = require("groq")
			local openai = require("openai")
			local anthropic = require("anthropic")
			local perplexity = require("perplexity")
			--local ollama = require("ollama")

			--vim.keymap.set({ "n", "v" }, "<leader>J", ollama.ch2en, { desc = "llm ollama help" })
			--vim.keymap.set({ "n", "v" }, "<leader>j", ollama.en2ch, { desc = "llm ollama replace" })
			vim.keymap.set({ "n", "v" }, "<leader>H", anthropic.help, { desc = "llm anthropic_help" })
			vim.keymap.set({ "n", "v" }, "<leader>h", anthropic.code, { desc = "llm anthropic_code" })
			vim.keymap.set({ "n", "v" }, "<leader>J", perplexity.help, { desc = "llm perplexity_help" })
			vim.keymap.set({ "n", "v" }, "<leader>j", perplexity.code, { desc = "llm perplexity_code" })
			vim.keymap.set({ "n", "v" }, "<leader>K", groq.help, { desc = "llm groq_help" })
			vim.keymap.set({ "n", "v" }, "<leader>k", groq.code, { desc = "llm groq_code" })
			vim.keymap.set({ "n", "v" }, "<leader>L", openai.help, { desc = "llm openai_help" })
			vim.keymap.set({ "n", "v" }, "<leader>l", openai.code, { desc = "llm openai_code" })
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
