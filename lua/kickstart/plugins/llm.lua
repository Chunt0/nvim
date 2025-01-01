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

			--
			-- Improved key mappings with more consistent naming and grouping
			-- Anthropic
			vim.keymap.set({ "n", "v" }, "<leader>ai", anthropic.invoke, { desc = "LLM Anthropic: Invoke" })
			vim.keymap.set({ "n", "v" }, "<leader>ac", anthropic.code, { desc = "LLM Anthropic: Code" })
			vim.keymap.set(
				{ "n", "v" },
				"<leader>ab",
				anthropic.code_all_buf,
				{ desc = "LLM Anthropic: Code entire buffer" }
			)
			vim.keymap.set({ "n", "v" }, "<leader>at", anthropic.code_chat, { desc = "LLM Anthropic: Code chat" })
			vim.keymap.set(
				{ "n", "v" },
				"<leader>aa",
				anthropic.code_chat_all_buf,
				{ desc = "LLM Anthropic: Code chat entire buffer" }
			)

			-- OpenAI
			vim.keymap.set({ "n", "v" }, "<leader>oi", openai.invoke, { desc = "LLM OpenAI: Invoke" })
			vim.keymap.set({ "n", "v" }, "<leader>oc", openai.code, { desc = "LLM OpenAI: Code" })
			vim.keymap.set({ "n", "v" }, "<leader>ob", openai.code_all_buf, { desc = "LLM OpenAI: Code entire buffer" })
			vim.keymap.set({ "n", "v" }, "<leader>ot", openai.code_chat, { desc = "LLM OpenAI: Code chat" })
			vim.keymap.set(
				{ "n", "v" },
				"<leader>oa",
				openai.code_chat_all_buf,
				{ desc = "LLM OpenAI: Code chat entire buffer" }
			)

			-- Ollama (commented out)
			vim.keymap.set({ "n", "v" }, "<leader>li", ollama.invoke, { desc = "LLM Ollama: Invoke" })
			vim.keymap.set({ "n", "v" }, "<leader>lc", ollama.code, { desc = "LLM Ollama: Code" })
			vim.keymap.set({ "n", "v" }, "<leader>lb", ollama.code_all_buf, { desc = "LLM Ollama: Code entire buffer" })
			vim.keymap.set({ "n", "v" }, "<leader>lt", ollama.code_chat, { desc = "LLM OpenAI: Code chat" })
			vim.keymap.set(
				{ "n", "v" },
				"<leader>la",
				ollama.code_chat_all_buf,
				{ desc = "LLM OpenAI: Code chat entire buffer" }
			)
		end,
	},
}
